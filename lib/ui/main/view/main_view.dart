import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_clean_code_template/ui/auth/login/view/login_view.dart';
import 'package:my_clean_code_template/ui/home/view/home_view.dart';
import 'package:my_clean_code_template/ui/profile/view/profile_view.dart';

import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class ButtonNavigationView extends StatelessWidget {
  ButtonNavigationView({super.key});
  DateTime? currentBackPressTime;

  Future<bool> showExitPopup(BuildContext context) async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Apakah anda yakin?'),
            content: const Text('Keluar dari Aplikasi?'),
            actions: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Tidak'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () => SystemNavigator.pop(),
                child: const Text('Ya'),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: PersistentTabController(initialIndex: 0),
        screens: [
          HomeView(),
          // InputPinView(),
          ProfileView(),
          HomeView(),
          LoginView(),
        ],
        onItemSelected: (value) {},
        items: itemsBottomNavigation,
        // pageTransitionAnimation: PageTransitionAnimation.cupertino,
        //darisini
        // confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        padding: EdgeInsets.all(5),

        //darisini
        // hideNavigationBarWhenKeyboardShows:
        //     true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        // decoration: NavBarDecoration(
        //   borderRadius: BorderRadius.circular(10.0),
        //   colorBehindNavBar: Colors.white,
        // ),
        // popAllScreensOnTapOfSelectedTab: true,
        // popActionScreens: PopActionScreensType.all,
        // itemAnimationProperties: const ItemAnimationProperties(
        //   // Navigation Bar's items animation properties.
        //   duration: Duration(milliseconds: 200),
        //   curve: Curves.ease,
        // ),
        // screenTransitionAnimation: const ScreenTransitionAnimation(
        //   // Screen transition animation on change of selected tab.
        //   animateTabTransition: true,
        //   curve: Curves.ease,
        //   duration: Duration(milliseconds: 200),
        // ),
        //darisini
        navBarStyle:
            NavBarStyle.style8, // Choose the nav bar style with this property.
      ),
    );
  }

  List<PersistentBottomNavBarItem> itemsBottomNavigation = [
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.grid_view_outlined),
      title: "Beranda",
      activeColorPrimary: Colors.red,
      inactiveColorPrimary: Colors.grey,
      inactiveColorSecondary: Colors.purple,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.work),
      title: "Pekerjaan",
      activeColorPrimary: Colors.red,
      inactiveColorPrimary: Colors.grey,
      inactiveColorSecondary: Colors.purple,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.inbox_outlined),
      title: "Riwayat",
      activeColorPrimary: Colors.red,
      inactiveColorPrimary: Colors.grey,
      inactiveColorSecondary: Colors.purple,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.person),
      title: "Akun",
      activeColorPrimary: Colors.red,
      inactiveColorPrimary: Colors.grey,
      inactiveColorSecondary: Colors.purple,
    ),
  ];
}
