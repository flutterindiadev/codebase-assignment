import 'package:assignment/features/users/presentation/manager/providers/userprovider.dart';
import 'package:assignment/features/users/presentation/widgets/user_list_tile.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';

class UserListScreen extends ConsumerStatefulWidget {
  const UserListScreen({super.key});

  @override
  ConsumerState<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends ConsumerState<UserListScreen> {
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.8) {
      final notifier = ref.read(userListProvider.notifier);
      notifier.fetchUsers();
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final users = ref.watch(filteredUsersProvider);
    final userListState = ref.watch(userListProvider);
    final isOffline = ref
            .watch(connectivityProvider)
            .valueOrNull
            ?.contains(ConnectivityResult.none) ??
        false;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: 'Search users...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              onChanged: (value) {
                ref.read(searchQueryProvider.notifier).state = value;
              },
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          if (isOffline)
            Container(
              color: Colors.orange,
              padding: const EdgeInsets.all(8),
              child: const Row(
                children: [
                  Icon(Icons.wifi_off),
                  SizedBox(width: 8),
                  Text('Offline mode - Showing cached data'),
                ],
              ),
            ),
          Expanded(
            child: userListState.when(
              data: (_) => RefreshIndicator(
                onRefresh: () {
                  final notifier = ref.read(userListProvider.notifier);
                  return notifier.fetchUsers();
                },
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];
                    return UserListTile(user: user);
                  },
                ),
              ),
              loading: () => Center(
                  child: Skeletonizer(
                child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];
                    return UserListTile(user: user);
                  },
                ),
              )),
              error: (error, stack) => Center(
                child: Text('Error: ${error.toString()}'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
