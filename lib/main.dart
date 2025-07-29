// ignore_for_file: unused_import, unnecessary_import

import 'package:blogclub/article.dart';
import 'package:blogclub/carousel/carousel_slider.dart';
import 'package:blogclub/data.dart';
import 'package:blogclub/gen/assets.gen.dart';
import 'package:blogclub/gen/fonts.gen.dart';
import 'package:blogclub/home.dart';
import 'package:blogclub/profile.dart';
import 'package:blogclub/splash.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryTextColor = Color(0xff0D253C);
    const secondaryTextColor = Color(0xff2D4379);
    // ignore: unused_local_variable
    const primaryColor = Color(0xff376AED);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: WidgetStateProperty.all(
              const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: FontFamily.avenir),
            ),
          ),
        ),
        useMaterial3: true,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
          onPrimary: Colors.white,
          onSurface: primaryTextColor,
          surface: Color(0xffFBFCFF),
        ),
        appBarTheme: const AppBarTheme(
            titleSpacing: 32,
            backgroundColor: Colors.white,
            foregroundColor: primaryTextColor),
        snackBarTheme: const SnackBarThemeData(
          backgroundColor: primaryColor,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontFamily: FontFamily.avenir,
            color: secondaryTextColor,
            fontWeight: FontWeight.w200,
            fontSize: 18,
          ),
          headlineSmall: TextStyle(
              fontFamily: FontFamily.avenir,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: primaryTextColor),
          headlineLarge: TextStyle(
              fontFamily: FontFamily.avenir,
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: primaryTextColor),
          headlineMedium: TextStyle(
              fontFamily: FontFamily.avenir,
              fontSize: 20,
              color: primaryTextColor,
              fontWeight: FontWeight.w700),
          labelSmall: TextStyle(
              fontFamily: FontFamily.avenir,
              fontWeight: FontWeight.w700,
              color: Color(0xff7B8BB2),
              fontSize: 10),
          bodyMedium: TextStyle(
            fontFamily: FontFamily.avenir,
            color: primaryTextColor,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
          bodySmall: TextStyle(
              fontFamily: FontFamily.avenir,
              color: secondaryTextColor,
              fontSize: 12),
        ),
      ),
      // home: Stack(
      //   children: [
      //     const Positioned.fill(
      //       bottom: 65,
      //       child: SplashScreen(),
      //     ),
      //     Positioned(bottom: 0, right: 0, left: 0, child: _BottomNavigation()),
      //   ],
      // ),

      home: const SplashScreen(),
    );
  }
}

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

const int homeIndex = 0;
const int articlIndex = 1;
const int serachIndex = 2;
const int menuIndex = 3;
const double bottomNavigationHeight = 65;

class _MainscreenState extends State<Mainscreen> {
  int selectedScreenIndex = homeIndex;
  final List<int> _history = [homeIndex];

  final GlobalKey<NavigatorState> _homeKey = GlobalKey();
  final GlobalKey<NavigatorState> _articleKey = GlobalKey();
  final GlobalKey<NavigatorState> _searchkey = GlobalKey();
  final GlobalKey<NavigatorState> _menukey = GlobalKey();

  late final Map<int, GlobalKey<NavigatorState>> map = {
    homeIndex: _homeKey,
    articlIndex: _articleKey,
    serachIndex: _searchkey,
    menuIndex: _menukey,
  };

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop:
          false, // اجازه بده که پاپ بشه، کنترل با onPopInvokedWithResult انجام میشه
      onPopInvokedWithResult: (didPop, result) {
        // در اینجا از هر دو پارامتر didPop و result استفاده می‌کنیم
        if (!didPop) {
          final currentNavigator = map[selectedScreenIndex]!.currentState!;
          if (currentNavigator.canPop()) {
            currentNavigator.pop(); // اگر امکان پاپ هست، پاپ رو انجام بده
          } else if (_history.isNotEmpty) {
            setState(() {
              selectedScreenIndex = _history.last;
              _history.removeLast();
            });
          }
        }
      },
      child: Scaffold(
          body: Stack(
        children: [
          Positioned.fill(
            child: IndexedStack(
              index: selectedScreenIndex,
              children: [
                _navigator(
                  _homeKey,
                  homeIndex,
                  const Homescreen(),
                ),
                _navigator(
                  _articleKey,
                  articlIndex,
                  const ArticleScreen(),
                ),
                _navigator(
                  _searchkey,
                  serachIndex,
                  const SimpleScreen(
                    tabName: 'Search',
                  ),
                ),
                _navigator(
                  _menukey,
                  menuIndex,
                  const ProfileScreen(),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _BottomNavigation(
              onTap: (int index) {
                setState(() {
                  _history.remove(selectedScreenIndex);
                  _history.add(selectedScreenIndex);
                  selectedScreenIndex = index;
                });
              },
              selectedIndex: selectedScreenIndex,
            ),
          ),
        ],
      )),
    );
  }

  Widget _navigator(GlobalKey key, int index, Widget child) {
    return key.currentState == null && selectedScreenIndex != index
        ? Container()
        : Navigator(
            key: key,
            onGenerateRoute: (settings) => MaterialPageRoute(
              builder: (context) => Offstage(
                offstage: selectedScreenIndex != index,
                child: child,
              ),
            ),
          );
  }
}

class SimpleScreen extends StatelessWidget {
  const SimpleScreen({super.key, required this.tabName, this.screenNumber = 1});
  final String tabName;
  final int screenNumber;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Tab: $tabName,screen #$screenNumber',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SimpleScreen(
                    tabName: tabName,
                    screenNumber: screenNumber + 1,
                  ),
                ),
              );
            },
            child: Text('Click Me'),
          ),
        ],
      ),
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  final Function(int index) onTap;
  final int selectedIndex;

  const _BottomNavigation(
      {super.key, required this.onTap, required this.selectedIndex});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 65,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Color(0xff9BB487).withValues(alpha: 0.3 * 2.5),
                ),
              ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BottomNavigationItem(
                    iconFileName: 'Homeinactive.svg',
                    activeIconFileName: 'Home.svg',
                    title: 'Home',
                    onTap: () {
                      onTap(homeIndex);
                    },
                    isActive: selectedIndex == homeIndex,
                  ),
                  BottomNavigationItem(
                    iconFileName: 'articleinactive.svg',
                    activeIconFileName: 'article.svg',
                    title: 'Article',
                    onTap: () {
                      onTap(articlIndex);
                    },
                    isActive: selectedIndex == articlIndex,
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  BottomNavigationItem(
                    iconFileName: 'searchinactive.svg',
                    activeIconFileName: 'search.svg',
                    title: 'Search',
                    onTap: () {
                      onTap(serachIndex);
                    },
                    isActive: selectedIndex == serachIndex,
                  ),
                  BottomNavigationItem(
                    iconFileName: 'menuinactive.svg',
                    activeIconFileName: 'menu.svg',
                    title: 'Menu',
                    onTap: () {
                      onTap(menuIndex);
                    },
                    isActive: selectedIndex == menuIndex,
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              width: 65,
              height: 85,
              alignment: Alignment.topCenter,
              child: Container(
                  height: bottomNavigationHeight,
                  decoration: BoxDecoration(
                    color: const Color(0xff376AED),
                    borderRadius: BorderRadius.circular(32.5),
                    border: Border.all(color: Colors.white, width: 4),
                  ),
                  child: Image.asset('assets/img/icons/plus.png')),
            ),
          )
        ],
      ),
    );
  }
}

class BottomNavigationItem extends StatelessWidget {
  final String iconFileName;
  final String activeIconFileName;
  final String title;
  final bool isActive;
  final Function() onTap;

  const BottomNavigationItem(
      {super.key,
      required this.iconFileName,
      required this.activeIconFileName,
      required this.title,
      required this.onTap,
      required this.isActive});
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/img/icons/${isActive ? activeIconFileName : iconFileName}',
              width: 24,
              height: 24,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.labelSmall!.apply(
                  color: isActive
                      ? themeData.colorScheme.primary
                      : themeData.textTheme.bodySmall!.color),
            )
          ],
        ),
      ),
    );
  }
}
