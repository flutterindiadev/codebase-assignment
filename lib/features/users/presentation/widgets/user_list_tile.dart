import 'package:assignment/core/router/app_router.dart';
import 'package:assignment/core/router/navigation_service.dart';
import 'package:assignment/features/users/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserListTile extends ConsumerWidget {
  final UserModel user;

  const UserListTile({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 2, // Add a subtle shadow
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () async {
          final navigationService = ref.read(navigationServiceProvider);
          await navigationService.navigateTo(
            AppRouter.userDetails,
            arguments: user.id,
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0), // Add padding inside the card
          child: Row(
            children: [
              Hero(
                tag: user.id ?? 0,
                child: CircleAvatar(
                  radius: 30, // Increase the avatar size
                  backgroundImage: NetworkImage(user.avatar ?? ''),
                  onBackgroundImageError: (_, __) {
                    // Handle error loading image
                    // You could display a placeholder image here
                    const SizedBox(
                      width: 60,
                      height: 60,
                      child: Icon(Icons.person),
                    );
                  },
                ),
              ),
              const SizedBox(
                  width: 16), // Add some spacing between avatar and text
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${user.first_name ?? ''} ${user.last_name ?? ''}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16, // Slightly larger title
                      ),
                      overflow: TextOverflow.ellipsis, // Handle long names
                    ),
                    const SizedBox(height: 4), // Add some spacing
                    Text(
                      user.email ?? '',
                      //     style: TextStyle(
                      //       color: Colors.grey[600], // Subtle text color
                      //     ),
                      overflow: TextOverflow.ellipsis, // Handle long emails
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios,
                  color: Colors.grey), // Add an indicator
            ],
          ),
        ),
      ),
    );
  }
}
