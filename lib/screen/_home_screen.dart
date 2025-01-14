import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maze_conquest_sp/widget/background_gradient.dart';
import 'package:maze_conquest_sp/widget/cloud_background.dart';
import 'package:maze_conquest_sp/widget/home_screen/navigation_button.dart';
import 'package:maze_conquest_sp/widget/home_screen/navigation_info.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final ValueNotifier<Nav?> whichNav = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return BackgroundGradient(
      child: CloudBackground(
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Find player...",
                        filled: true,
                        enabled: true,
                        fillColor: Theme.of(context).primaryColor.withAlpha(80),
                        suffixIcon: const Icon(
                          Icons.person_search_outlined,
                          size: 30.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                      onSubmitted: (value) {
                        print(value);
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Text("Aaron Fabian", style: Theme.of(context).textTheme.bodyLarge),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 16.0),
                      child: const CircleAvatar(
                        radius: 46.0,
                        backgroundImage: NetworkImage("https://avatar.iran.liara.run/public/33"),
                      ),
                    ),
                    const SizedBox(height: 56),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RawMaterialButton(
                          onPressed: () {},
                          fillColor: const Color.fromARGB(255, 171, 71, 188),
                          constraints: const BoxConstraints(minWidth: 0.0),
                          padding: const EdgeInsets.all(15.0),
                          shape: const CircleBorder(),
                          child: const Icon(
                            Icons.leaderboard,
                            semanticLabel: 'Player Lv',
                          ),
                        ),
                        RawMaterialButton(
                          onPressed: () {},
                          fillColor: const Color.fromARGB(255, 171, 71, 188),
                          constraints: const BoxConstraints(minWidth: 0.0),
                          padding: const EdgeInsets.all(15.0),
                          shape: const CircleBorder(),
                          child: const Icon(Icons.flash_on, semanticLabel: 'Power'),
                        ),
                        RawMaterialButton(
                          onPressed: () {},
                          fillColor: const Color.fromARGB(255, 171, 71, 188),
                          constraints: const BoxConstraints(minWidth: 0.0),
                          padding: const EdgeInsets.all(15.0),
                          shape: const CircleBorder(),
                          child: const Icon(Icons.leaderboard, semanticLabel: 'Leaderboard'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    Container(
                      height: 120.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        color: const Color.fromARGB(255, 56, 56, 56).withAlpha(155),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          NavigationButton(
                            navTitle: "All heroes",
                            iconData: Icons.person_pin_outlined,
                            onHelpPressed: () => whichNav.value = Nav.allHeroes,
                            onPressed: () => context.goNamed('all_heroes'),
                          ),
                          NavigationButton(
                            navTitle: "Party",
                            iconData: Icons.people_alt_outlined,
                            onPressed: () => context.goNamed('party'),
                            onHelpPressed: () => whichNav.value = Nav.party,
                          ),
                          NavigationButton(
                            navTitle: "Inventory",
                            iconData: Icons.inventory_2_outlined,
                            onPressed: () {},
                            onHelpPressed: () => whichNav.value = Nav.inventory,
                          ),
                          NavigationButton(
                            navTitle: "Remote map",
                            iconData: Icons.cast_connected_outlined,
                            onPressed: () {},
                            onHelpPressed: () => whichNav.value = Nav.remoteMap,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    ValueListenableBuilder(
                      valueListenable: whichNav,
                      builder: (context, val, child) => NavigationInfo(currentNav: val),
                    )
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: Container(
            color: const Color.fromARGB(255, 56, 56, 56).withAlpha(155),
            padding: const EdgeInsets.all(3.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.copyright_outlined,
                  size: 12.0,
                  color: Colors.white,
                ),
                const SizedBox(width: 8.0),
                Text(
                  "International Paradigm",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*

  import 'package:flutter/material.dart';
  import 'package:maze_conquest_sp/widget/background_gradient.dart';
  import 'package:maze_conquest_sp/widget/card_feature.dart';
  import 'package:maze_conquest_sp/widget/cloud_background.dart';

  class HomeScreen extends StatefulWidget {
    const HomeScreen({super.key});

    @override
    State<HomeScreen> createState() => _HomeScreenState();
  }

  class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
    late AnimationController _animationController;

    @override
    void initState() {
      super.initState();

      _animationController = AnimationController(
        vsync: this,
        lowerBound: 0,
        upperBound: 1,
        duration: const Duration(milliseconds: 1000),
      );

      _animationController.forward();
    }

    @override
    void dispose() {
      _animationController.dispose();

      super.dispose();
    }

    @override
    Widget build(BuildContext context) {
      return BackgroundGradient(
        child: CloudBackground(
          child: Scaffold(
            body: SafeArea(
              child: Center(
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) => SlideTransition(
                      position: Tween(
                        begin: const Offset(0, 0.7),
                        end: const Offset(0, 0.6),
                      ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut)),
                      child: child),
                  child: Container(
                    height: 150,
                    margin: const EdgeInsets.all(24),
                    color: Colors.white.withAlpha(80),
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: GridView.count(
                        crossAxisSpacing: 3.0,
                        mainAxisSpacing: 3.0,
                        crossAxisCount: 3,
                        children: [
                          CardFeature(
                            text: "Remote",
                            icon: Icons.settings_remote_sharp,
                            onTap: () {},
                          ),
                          CardFeature(
                            text: "Users",
                            icon: Icons.supervised_user_circle,
                            onTap: () {},
                          ),
                          CardFeature(
                            text: "Rank",
                            icon: Icons.leaderboard_sharp,
                            onTap: () {},
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
*/
