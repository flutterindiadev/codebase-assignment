import 'dart:async';
import 'dart:convert';

import 'package:assignment/core/api_handler_middleware.dart';
import 'package:assignment/core/apiurls.dart';
import 'package:assignment/core/server_request_manager.dart';
import 'package:assignment/features/users/data/datasource/user_remote_datasource.dart';
import 'package:assignment/features/users/data/model/user_model.dart';
import 'package:assignment/features/users/data/repository/user_repository.dart';
import 'package:assignment/features/users/domain/entity/user_entity.dart';
import 'package:assignment/features/users/domain/repository/user_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Provider for UserRepository
final userRepositoryProvider = Provider<UserRepository>((ref) {
  final dio = Dio();
  return UserRepositoryImpl(UserRemoteDatasourceImpl(
    ApiUrls(),
    ApiHandlerMiddleWare(ServerRequestManager(dio: dio)),
  ));
});

// Provider for UserList
final userListProvider =
    StateNotifierProvider<UserListNotifier, AsyncValue<List<UserModel>>>((ref) {
  return UserListNotifier(ref.read(userRepositoryProvider));
});

class UserListNotifier extends StateNotifier<AsyncValue<List<UserModel>>> {
  final UserRepository _repository;
  int _page = 1;
  bool _hasMore = true;
  SharedPreferences? _prefs;

  UserListNotifier(this._repository) : super(const AsyncValue.loading()) {
    _init();
  }

  Future<void> _init() async {
    _prefs = await SharedPreferences.getInstance();
    await _loadCachedUsers();
  }

  Future<void> _loadCachedUsers() async {
    if (_prefs == null) return;

    final connectivity = await Connectivity().checkConnectivity();

    // Check if offline
    if (connectivity == ConnectivityResult.none) {
      final cachedUsers = _prefs!.getString('userList');
      if (cachedUsers != null) {
        final users = (jsonDecode(cachedUsers) as List)
            .map((user) => UserModel.fromJson(user))
            .toList();
        state = AsyncValue.data(users); // Return cached user list
        return;
      }
    }

    await fetchUsers();
  }

  Future<void> fetchUsers() async {
    _prefs ??= await SharedPreferences.getInstance();

    final noOfPages = _prefs!.getInt('total_pages') ?? 1;
    final connectivity = await Connectivity().checkConnectivity();

    if (connectivity == ConnectivityResult.none) {
      final cachedUsers = _prefs!.getString('userList');
      if (cachedUsers != null) {
        final users = (jsonDecode(cachedUsers) as List)
            .map((user) => UserModel.fromJson(user))
            .toList();
        state = AsyncValue.data(users);
        return;
      }
    }

    if (!_hasMore) return;

    try {
      final response = await _repository.getUsers(9, _page);
      List<UserEntity> newUsers = [];
      response.fold((e) => print(e.message), (data) => newUsers = data);

      final currentUsers = state.value ?? [];
      final existingIds = currentUsers.map((user) => user.id).toSet();

      // Convert new users to UserModel and filter out duplicates
      final newUserModels = newUsers
          .map((user) => UserModel(
                id: user.id,
                email: user.email,
                first_name: user.firstName,
                last_name: user.lastName,
                avatar: user.avatar,
              ))
          .where((user) => !existingIds.contains(user.id))
          .toList();

      // Combine current users with new unique users
      final updatedUsers = [...currentUsers, ...newUserModels];

      // Update cache and state
      await _prefs!.setString('userList', jsonEncode(updatedUsers));
      state = AsyncValue.data(updatedUsers);

      _hasMore = _page < noOfPages;
      _page++;
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  void reset() {
    _page = 1;
    _hasMore = true;
    state = const AsyncValue.loading();
  }
}

// Provider to manage the search query
final searchQueryProvider = StateProvider<String>((ref) => '');

// Provider to filter users based on the search query
final filteredUsersProvider = Provider<List<UserModel>>((ref) {
  final searchQuery = ref.watch(searchQueryProvider);
  final users = ref.watch(userListProvider).value ?? [];

  if (searchQuery.isEmpty) {
    return users; // Return all users if no search query
  }

  // Filter users based on the search query
  return users.where((user) {
    final fullName = '${user.first_name} ${user.last_name}'.toLowerCase();
    return fullName.contains(searchQuery.toLowerCase());
  }).toList();
});

// Provider to manage the loading state for pagination
final isLoadingMoreProvider = StateProvider<bool>((ref) => false);

// Provider to check internet connectivity
final connectivityProvider = StreamProvider<List<ConnectivityResult>>((ref) {
  final connectivity = Connectivity();
  return connectivity.onConnectivityChanged;
});
