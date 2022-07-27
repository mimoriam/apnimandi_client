import 'package:apnimandi_client/constants/constants.dart';
import 'package:flutter/material.dart';

/// Models:

/// Screens:

/// Widgets:
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

/// Services:
import 'package:dio/dio.dart';

/// State:

/// Utils/Helpers:
import 'package:responsive_builder/responsive_builder.dart';

/// Entry Point:
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();

  Future<void> getHttp() async {
    try {
      var response = await Dio().get('https://fakestoreapi.com/products');
      debugPrint(response.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void didChangeDependencies() async {
    await getHttp();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SideMenu(
      key: _sideMenuKey,
      menu: buildMenu(),
      type: SideMenuType.shrinkNSlide,
      background: Color(kPrimaryGreenColor),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              final _state = _sideMenuKey.currentState;
              if (_state!.isOpened) {
                _state.closeSideMenu();
              } // close side menu
              else {
                _state.openSideMenu();
              } // open side menu
            },
          ),
        ),
        body: SafeArea(
          child: ScreenTypeLayout.builder(
            mobile: (BuildContext context) {
              return OrientationLayoutBuilder(
                // Force a screen to stay in portrait/landscape. Overrides the OrientationLayoutBuilder
                // mode: OrientationLayoutBuilderMode.portrait,
                portrait: (context) => const Text("AAA"),
                landscape: (context) => Container(),
              );
            },
            tablet: (BuildContext context) {
              return OrientationLayoutBuilder(
                portrait: (context) => Container(),
                landscape: (context) => Container(),
              );
            },
            desktop: (BuildContext context) => Container(),
          ),
        ),
      ),
    );
  }
}

Widget buildMenu() {
  return SingleChildScrollView(
    padding: const EdgeInsets.symmetric(vertical: 50.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 22.0,
              ),
              SizedBox(height: 16.0),
              Text(
                "Apni Mandi \nView your profile",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(Icons.home, size: 20.0, color: Colors.white),
          title: const Text("Home"),
          textColor: Colors.white,
          dense: true,
        ),
        ListTile(
          onTap: () {},
          leading:
              const Icon(Icons.verified_user, size: 20.0, color: Colors.white),
          title: const Text("Profile"),
          textColor: Colors.white,
          dense: true,

          // padding: EdgeInsets.zero,
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(Icons.monetization_on,
              size: 20.0, color: Colors.white),
          title: const Text("Wallet"),
          textColor: Colors.white,
          dense: true,

          // padding: EdgeInsets.zero,
        ),
        ListTile(
          onTap: () {},
          leading:
              const Icon(Icons.shopping_cart, size: 20.0, color: Colors.white),
          title: const Text("Cart"),
          textColor: Colors.white,
          dense: true,

          // padding: EdgeInsets.zero,
        ),
        ListTile(
          onTap: () {},
          leading:
              const Icon(Icons.star_border, size: 20.0, color: Colors.white),
          title: const Text("Favorites"),
          textColor: Colors.white,
          dense: true,

          // padding: EdgeInsets.zero,
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(Icons.settings, size: 20.0, color: Colors.white),
          title: const Text("Settings"),
          textColor: Colors.white,
          dense: true,

          // padding: EdgeInsets.zero,
        ),
      ],
    ),
  );
}
