import 'package:flutter/material.dart';

class BerandaAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String name;
  final String greeting;
  final String imagePath;
  final VoidCallback? onProfileTap;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onBookmarkTap;

  const BerandaAppBar({
    super.key,
    required this.name,
    required this.greeting,
    required this.imagePath,
    this.onProfileTap,
    this.onNotificationTap,
    this.onBookmarkTap,
  });

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70,
      backgroundColor: Colors.blue,
      titleSpacing: 16,
      title: ProfileHeader(
        name: name,
        greeting: greeting,
        imagePath: imagePath,
        onTap: onProfileTap,
      ),
      actions: [
        _buildIconButton(
          icon: Icons.notifications_none_outlined,
          onPressed: onNotificationTap,
        ),
        _buildIconButton(
          icon: Icons.bookmark_outline_sharp,
          onPressed: onBookmarkTap,
        ),
      ],
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required VoidCallback? onPressed,
  }) {
    return IconButton(icon: Icon(icon), onPressed: onPressed);
  }
}

class ProfileHeader extends StatelessWidget {
  final String name;
  final String greeting;
  final String imagePath;
  final VoidCallback? onTap;

  const ProfileHeader({
    super.key,
    required this.name,
    required this.greeting,
    required this.imagePath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildAvatar(),
        const SizedBox(width: 12),
        Expanded(child: _buildTextInfo()),
      ],
    );
  }

  Widget _buildAvatar() {
    return InkWell(
      borderRadius: BorderRadius.circular(22),
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(imagePath),
          onBackgroundImageError: (_, _) {},
        ),
      ),
    );
  }

  Widget _buildTextInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          greeting,
          style: const TextStyle(fontSize: 12, color: Colors.white70),
        ),
        Text(
          name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
