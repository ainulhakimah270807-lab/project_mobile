
import 'package:flutter/material.dart';

class AppNavBar extends StatelessWidget {
  final int selectedIndex;

  const AppNavBar({
    super.key,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      type: BottomNavigationBarType.fixed,

      selectedItemColor: Colors.purple,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.white,

      onTap: (index) {
        if (index == selectedIndex) {
          return;
        }

        const halaman = [
          "/",
          "/login",
          "/profile",
        ];

        Navigator.pushNamedAndRemoveUntil(
          context,
          halaman[index],
          (route) => false,
        );
      },

      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: "Home",
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.login),
          label: "Login",
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          activeIcon: Icon(Icons.person),
          label: "Profile",
        ),
      ],
    );
  }
}
