import 'package:flutter/material.dart';
import 'package:testsuitmedia/data/models/models.dart';
import 'package:testsuitmedia/widgets/widgets.dart';

class UserListItem extends StatelessWidget {
  const UserListItem({
    Key? key,
    required this.user,
    required this.onPressed,
    this.selected = false,
  }) : super(key: key);

  final User user;
  final VoidCallback onPressed;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Avatar(
        imageUrl: user.avatar,
      ),
      title: Text(
        user.fullName,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(user.email),
      selected: selected,
      onTap: onPressed,
    );
  }
}
