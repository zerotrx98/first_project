import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final double _preferredHeight = 70.0;
  final VoidCallback onCartPressed;
  final VoidCallback onLoginPressed;
  final VoidCallback onSearchPressed;

  CustomAppBar({Key? key, required this.onCartPressed, required this.onLoginPressed, required this.onSearchPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('PETS LAND'),

      elevation: 0.0,
      backgroundColor: Colors.purple,
      bottomOpacity: 0.0,
      actions: [
        IconButton(
          onPressed: onSearchPressed,
          icon: Icon(Icons.search),
        ),
        IconButton(
          onPressed: onLoginPressed,
          icon: Icon(Icons.person),
        ),
        IconButton(
          onPressed: onCartPressed,
          icon: Icon(Icons.shopping_cart),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(_preferredHeight);
}
