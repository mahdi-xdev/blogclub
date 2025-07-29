import 'package:blogclub/gen/assets.gen.dart';
import 'package:blogclub/gen/fonts.gen.dart';
import 'package:blogclub/main.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  static const int loginTab = 0;
  static const int signUpTab = 1;
  int selectedTabIndex = loginTab;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final tabTextStyle = TextStyle(
      color: themeData.colorScheme.onPrimary,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                bottom: 32,
                top: 32,
              ),
              child: Assets.img.icons.logo.svg(
                width: 120,
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                  color: themeData.colorScheme.primary,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                selectedTabIndex = loginTab;
                              });
                            },
                            child: Text(
                              'Login',
                              style: tabTextStyle.apply(
                                  color: selectedTabIndex == loginTab
                                      ? Colors.white
                                      : Colors.white54),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                selectedTabIndex = signUpTab;
                              });
                            },
                            child: Text(
                              'Sign Up',
                              style: tabTextStyle.apply(
                                  color: selectedTabIndex == signUpTab
                                      ? Colors.white
                                      : Colors.white54),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(32),
                            topRight: Radius.circular(32),
                          ),
                          color: themeData.colorScheme.surface,
                        ),
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(32, 48, 32, 48),
                            child: selectedTabIndex == loginTab
                                ? _Login(themeData: themeData)
                                : _SignUp(themeData: themeData),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Login extends StatelessWidget {
  const _Login({
    super.key,
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome Back',
          style: themeData.textTheme.headlineLarge,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'Sign in with your account',
          style: themeData.textTheme.bodyLarge!.apply(fontSizeFactor: 0.8),
        ),
        const SizedBox(
          height: 16,
        ),
        const TextField(
          decoration: InputDecoration(
            label: Text('UserName'),
          ),
        ),
        const PassWordTextField(),
        const SizedBox(
          height: 24,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Mainscreen()));
          },
          style: ButtonStyle(
            minimumSize: WidgetStateProperty.all(
              Size(MediaQuery.of(context).size.width, 60),
            ),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            backgroundColor: WidgetStateProperty.all(Colors.blue),
          ),
          child: Text(
            'Login'.toUpperCase(),
            style: TextStyle(color: Colors.white),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Forgot Your Password?'),
            const SizedBox(
              width: 8,
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Reset here'),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        const Center(
          child: Text(
            'OR SIGN IN WITH',
            style: TextStyle(letterSpacing: 2),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.img.icons.google.image(
              width: 36,
              height: 36,
            ),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.facebook.image(
              width: 36,
              height: 36,
            ),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.twitter.image(
              width: 36,
              height: 36,
            ),
          ],
        ),
      ],
    );
  }
}

class _SignUp extends StatelessWidget {
  const _SignUp({
    super.key,
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome To BlogClub',
          style: themeData.textTheme.headlineLarge,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'Please Enter your information',
          style: themeData.textTheme.bodyLarge!.apply(fontSizeFactor: 0.8),
        ),
        const SizedBox(
          height: 16,
        ),
        const TextField(
          decoration: InputDecoration(
            label: Text('FullName'),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        const TextField(
          decoration: InputDecoration(
            label: Text('UserName'),
          ),
        ),
        const PassWordTextField(),
        const SizedBox(
          height: 24,
        ),
        ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            minimumSize: WidgetStateProperty.all(
              Size(MediaQuery.of(context).size.width, 60),
            ),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            backgroundColor: WidgetStateProperty.all(Colors.blue),
          ),
          child: Text(
            'Sign Up'.toUpperCase(),
            style: TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Center(
          child: Text(
            'OR SIGN UP WITH',
            style: TextStyle(letterSpacing: 2),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.img.icons.google.image(
              width: 36,
              height: 36,
            ),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.facebook.image(
              width: 36,
              height: 36,
            ),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.twitter.image(
              width: 36,
              height: 36,
            ),
          ],
        ),
      ],
    );
  }
}

class PassWordTextField extends StatefulWidget {
  const PassWordTextField({
    super.key,
  });

  @override
  State<PassWordTextField> createState() => _PassWordTextFieldState();
}

class _PassWordTextFieldState extends State<PassWordTextField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
        label: Text('Password'),
        suffix: InkWell(
          onTap: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          child: Text(
            obscureText ? 'show' : 'Hide',
            style: TextStyle(
                fontSize: 14, color: Theme.of(context).colorScheme.primary),
          ),
        ),
      ),
    );
  }
}
