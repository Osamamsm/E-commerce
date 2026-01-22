import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key, this.isEditable = false,required this.avatarUrl});

  final bool isEditable;
  final String? avatarUrl;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFF9333ea), width: 3),
          ),
          child: CircleAvatar(
            radius: 50,
            backgroundColor: const Color(0xFFFFDBB5),
            backgroundImage: avatarUrl != null
                ? CachedNetworkImageProvider(avatarUrl!)
                : CachedNetworkImageProvider('https://cdn-icons-png.flaticon.com/512/149/149071.png'),
          ),
        ),
        isEditable
            ? Positioned(
                bottom: 0,
                right: 0,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: const Color(0xFF9333ea),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFF1e1b4b),
                        width: 2,
                      ),
                    ),
                    child: const Icon(
                      Icons.edit,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            : SizedBox.shrink(),
      ],
    );
  }
}
