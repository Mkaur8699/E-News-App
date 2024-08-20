import 'package:flutter/material.dart';
import 'package:news_app/MenuPageList/business.dart';
import 'package:news_app/MenuPageList/entertainment.dart';
import 'package:news_app/MenuPageList/health.dart';
import 'package:news_app/MenuPageList/latest.dart';
import 'package:news_app/MenuPageList/science.dart';
import 'package:news_app/MenuPageList/sport.dart';
import 'package:news_app/MenuPageList/technology.dart';
import 'package:news_app/MenuPageList/world.dart';

class HeadlineScreen extends StatefulWidget {
  const HeadlineScreen({super.key});

  @override
  State<HeadlineScreen> createState() => _HeadlineScreenState();
}

class _HeadlineScreenState extends State<HeadlineScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 9,
        child: Scaffold(
          appBar: AppBar(
            leading: const Icon(Icons.search),
            title: const Text('Headlines'),
            centerTitle: true,
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(48.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: TabBar(
                    isScrollable: true,
                    tabs: [
                      Tab(text: 'Entertainment'),
                      Tab(text: 'World'),
                      Tab(text: 'Business'),
                      Tab(text: 'Health'),
                      Tab(text: 'Sports'),
                      Tab(text: 'Science'),
                      Tab(text: 'Technology'),
                    ],
                  ),
                ),
              ),
            ),
          ),
          body: const TabBarView(children: [
            EntertainmentPage(),
            WorldPage(),
            BusinessPage(),
            HealthPage(),
            SportPage(),
            SciencePage(),
            TechnologyPage(),
          ],),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
