import 'package:flutter/material.dart';

enum Nav {
  allHeroes,
  party,
  inventory,
  remoteMap,
}

class NavigationInfo extends StatelessWidget {
  static Map<Nav, String> navText = {
    Nav.allHeroes:
        "Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi quia accusamus numquam, quasi sit doloribus quisquam facilis excepturi assumenda laborum nisi laboriosam nihil in optio vitae dolor quas.",
    Nav.inventory: "Inventory",
    Nav.party: "Party",
    Nav.remoteMap: "Remote Map",
  };

  final Nav? currentNav;
  const NavigationInfo({super.key, required this.currentNav});

  Widget navComponent(Nav compo) {
    return Container(
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        color: const Color.fromARGB(255, 56, 56, 56).withAlpha(155),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(
                  Icons.star_border_outlined,
                  color: Colors.white,
                  size: 24,
                ),
                SizedBox(width: 12.0),
                Text("All heroes"),
              ],
            ),
            const SizedBox(height: 5.0),
            Text(
              NavigationInfo.navText[compo]!,
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (currentNav) {
      case Nav.allHeroes:
        return navComponent(Nav.allHeroes);
      case Nav.party:
        return navComponent(Nav.party);
      case Nav.inventory:
        return navComponent(Nav.inventory);
      case Nav.remoteMap:
        return navComponent(Nav.remoteMap);
      default:
        return const SizedBox();
    }
  }
}
