import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBarView extends StatelessWidget implements PreferredSizeWidget {
  const AppBarView({
    super.key,
    required this.title,
    this.leading,
    this.onPressed,
    this.actions,
    this.bottom,
  });

  final String title;
  final IconData? leading;
  final void Function()? onPressed;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      // elevation: 0,
      leading: leading != null
          ? IconButton(
              icon: Icon(leading),
              onPressed: onPressed ?? () => context.pop(),
            )
          : null,
      actions: actions,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(bottom != null ? kToolbarHeight + 64 : kToolbarHeight);
}
