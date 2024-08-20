import 'package:flutter/material.dart';
import 'package:news_app/MenuPageList/business.dart';
import 'package:news_app/MenuPageList/entertainment.dart';
import 'package:news_app/MenuPageList/health.dart';
import 'package:news_app/MenuPageList/latest.dart';
import 'package:news_app/MenuPageList/science.dart';
import 'package:news_app/MenuPageList/sport.dart';
import 'package:news_app/MenuPageList/technology.dart';
import 'package:news_app/MenuPageList/world.dart';
import 'package:news_app/Screens/home_screen.dart';

import '../Common/menu_page_list_button.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          'Menu Page',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width * 1,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            MenuPageListButton(
                icon: Icons.star,
                text: 'Latest',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen()
                    ),
                  );
                }),
            MenuPageListButton(
              icon: Icons.dashboard_outlined,
              text: 'Entertainment',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EntertainmentPage(),
                  ),
                );
              },
            ),
            MenuPageListButton(
              icon: Icons.public,
              text: 'World',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WorldPage(),
                  ),
                );
              },
            ),
            MenuPageListButton(
              icon: Icons.business_center_rounded,
              text: 'Business',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BusinessPage()
                  ),
                );
              },
            ),
            MenuPageListButton(
              icon: Icons.health_and_safety_rounded,
              text: 'Health',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HealthPage()
                  ),
                );
              },
            ),
            MenuPageListButton(
              icon: Icons.sports_basketball_rounded,
              text: 'Sport',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SportPage()
                  ),
                );
              },
            ),
            MenuPageListButton(
              icon: Icons.science_rounded,
              text: 'Science',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  SciencePage()
                  ),
                );
              },
            ),
            MenuPageListButton(
              icon: Icons.engineering,
              text: 'Technology',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TechnologyPage()
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

//check whatsapp.....api call hai dhyan se thoda...hm
