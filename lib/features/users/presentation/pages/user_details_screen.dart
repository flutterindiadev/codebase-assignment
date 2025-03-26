import 'package:assignment/features/users/domain/entity/user_entity.dart';
import 'package:assignment/features/users/domain/usecase/get_user_details_usecase.dart';
import 'package:assignment/features/users/presentation/manager/providers/userprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';

// Provider for user details
final userDetailsProvider =
    FutureProvider.family<UserEntity, int>((ref, userId) async {
  final usecase = ref.read(getUserDetailsUsecaseProvider);
  final result = await usecase(GetUserDetailsUsecaseParams(id: userId));
  return result.fold(
    (failure) => throw failure,
    (user) => user,
  );
});

// Provider for the usecase
final getUserDetailsUsecaseProvider = Provider((ref) {
  final repository = ref.read(userRepositoryProvider);
  return GetUserDetailsUsecase(repository);
});

class UserDetailsScreen extends ConsumerWidget {
  final int userId;

  const UserDetailsScreen({
    super.key,
    required this.userId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDetailsAsync = ref.watch(userDetailsProvider(userId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: userDetailsAsync.when(
        data: (user) => _buildUserDetails(context, user),
        loading: () =>
            Skeletonizer(child: _buildUserDetails(context, UserEntity())),
        error: (error, stack) => Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  color: Colors.redAccent,
                  size: 50,
                ),
                const SizedBox(height: 16),
                Text(
                  'Failed to load user details.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Reason: ${error.toString()}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    ref.invalidate(userDetailsProvider(userId));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    foregroundColor: Theme.of(context).colorScheme.onSecondary,
                  ),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUserDetails(BuildContext context, UserEntity user) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildProfileHeader(context, user),
          const SizedBox(height: 24),
          _buildInfoCard(
            context,
            title: 'Personal Information',
            children: [
              _buildInfoRow('ID', user.id?.toString() ?? 'N/A'),
              _buildInfoRow('First Name', user.firstName ?? 'N/A'),
              _buildInfoRow('Last Name', user.lastName ?? 'N/A'),
              _buildInfoRow('Email', user.email ?? 'N/A'),
            ],
          ),
          const SizedBox(height: 16),
          // You can add more sections here if needed, e.g., for address, phone, etc.
        ],
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context, UserEntity user) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8),
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Hero(
            tag: user.id ?? 0,
            child: CircleAvatar(
              radius: 60,
              backgroundColor: Colors.grey[300],
              backgroundImage:
                  user.avatar != null ? NetworkImage(user.avatar!) : null,
              child: user.avatar == null
                  ? const Icon(Icons.person, size: 60, color: Colors.white)
                  : null,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '${user.firstName ?? ''} ${user.lastName ?? ''}',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
            textAlign: TextAlign.center,
          ),
          if (user.email != null) ...[
            const SizedBox(height: 8),
            Text(
              user.email!,
              style: TextStyle(
                color: Theme.of(context)
                    .colorScheme
                    .onPrimaryContainer
                    .withOpacity(0.8),
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildInfoCard(
    BuildContext context, {
    required String title,
    required List<Widget> children,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 12),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
}
