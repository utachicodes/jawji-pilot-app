import 'package:flutter/material.dart';
import 'brand.dart';

class BrandAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final bool centerTitle;

  const BrandAppBar({super.key, this.title, this.actions, this.centerTitle = false});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: centerTitle,
      leadingWidth: 64,
      leading: const Padding(
        padding: EdgeInsets.only(left: 12),
        child: Align(alignment: Alignment.centerLeft, child: BrandLogo(size: 28)),
      ),
      title: title != null ? Text(title!) : null,
      actions: actions,
    );
  }
}

