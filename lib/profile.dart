import 'package:blogclub/data.dart';
import 'package:blogclub/gen/assets.gen.dart';
import 'package:blogclub/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final posts = AppDatabase.posts;
    final themeData = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                elevation: 0,
                backgroundColor:
                    themeData.colorScheme.surface.withValues(alpha: 0.2),
                title: const Text('Profile'),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.more_horiz_rounded),
                    onPressed: () {},
                  ),
                  const SizedBox(
                    width: 32,
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(32, 0, 32, 32),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: themeData.colorScheme.surface,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 20,
                            color: themeData.colorScheme.onSurface
                                .withValues(alpha: 0.1),
                          ),
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                          child: Row(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Assets.img.stories.story11
                                      .image(width: 84, height: 84)),
                              const SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('@mahdi_002'),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      'Mahdi Ebrahimi',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall
                                          ?.copyWith(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      'Flutter developer',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .apply(
                                              color: themeData
                                                  .colorScheme.primary),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                          child: Text(
                            'About me',
                            style: themeData.textTheme.headlineSmall,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(32, 4, 32, 32),
                          child: Text(
                            ' I developed a strong passion for mobile app development, and as a result, I worked on various projects in this area. ',
                            style: themeData.textTheme.bodyLarge!.copyWith(
                                fontSize: 14, fontWeight: FontWeight.w200),
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 26,
                    left: 96,
                    right: 96,
                    child: Container(
                      height: 32,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 30,
                            color: themeData.colorScheme.onSurface
                                .withValues(alpha: 0.8),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 18,
                    right: 64,
                    left: 64,
                    child: Container(
                      height: 68,
                      decoration: BoxDecoration(
                        color: themeData.colorScheme.primary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xff2151CD),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '52',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: themeData.colorScheme.onPrimary),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    'Psot',
                                    style: themeData.textTheme.bodyLarge!
                                        .copyWith(
                                            fontWeight: FontWeight.w200,
                                            color: themeData
                                                .colorScheme.onPrimary),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '250',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: themeData.colorScheme.onPrimary),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  'Following',
                                  style: themeData.textTheme.bodyLarge!
                                      .copyWith(
                                          fontWeight: FontWeight.w200,
                                          color:
                                              themeData.colorScheme.onPrimary),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '4.5K',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: themeData.colorScheme.onPrimary),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  'Followers',
                                  style: themeData.textTheme.bodyLarge!
                                      .copyWith(
                                          fontWeight: FontWeight.w200,
                                          color:
                                              themeData.colorScheme.onPrimary),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: themeData.colorScheme.surface,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              'MyPosts',
                              style: themeData.textTheme.headlineSmall,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Assets.img.icons.grid.svg(),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Assets.img.icons.table.svg(),
                          ),
                        ],
                      ),
                    ),
                    for (var i = 0; i < posts.length; i++)
                      Post(
                        post: posts[i],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
