import 'package:flutter/material.dart';
import 'package:news_app/Screens/description_page.dart';
import 'package:news_app/Service/google_news_api.dart';

import 'package:news_app/models/google_news_model.dart';

import 'menupage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Item> list = [];

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // _fetchDataFromGoogleApi();
    _fetchDataFromCachedMemory();
  }

  _fetchDataFromGoogleApi() async {
    list = (await GoogleNewsApi().getGoogleNewsData())!;
    setState(() {});
  }

  _fetchDataFromCachedMemory() async {
    list = (await GoogleNewsApi().getCachedGoogleNewsData())!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.black,
              size: 30,
            )),
        title: const Text(
          'Google News',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
        actions: [
          IconButton(
            onPressed: () {
              print(_scaffoldKey.currentState!.hasEndDrawer.toString());
              _scaffoldKey.currentState!.openEndDrawer();
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
              size: 30,
            ),
          ),
        ],
      ),
      endDrawer: Container(
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * 1,
        color: Colors.white,
        child: const MenuPage(),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Column(
              children: [
                InkWell(
                    onTap: () {
                      list[index].images?.thumbnail != null
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DescPage(
                                        title: list[index].title.toString(),
                                        imgUrl: list[index]
                                            .images!
                                            .thumbnailProxied
                                            .toString(),
                                        snippet: list[index].snippet.toString(),
                                        publisher:
                                            list[index].publisher.toString(),
                                      )))
                          : ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                              content: Text("NUll Value"),
                              duration: Duration(milliseconds: 400),
                            ));
                    },
                    child: list[index].images?.thumbnail != null
                        ? Image(
                            fit: BoxFit.fitWidth,
                            width: MediaQuery.of(context).size.width,
                            image: NetworkImage(
                                list[index].images!.thumbnail.toString()))
                        : const Image(
                            image: NetworkImage(
                                "https://t3.ftcdn.net/jpg/01/73/00/58/360_F_173005809_txJU6BsjnNWGMFlEAxprFmigx9HBYrSI.jpg"))),
                Text(
                  list[index].title.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  list[index].snippet.toString(),
                  style: const TextStyle(fontSize: 15, color: Colors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  list[index].publisher.toString(),
                  style: const TextStyle(fontSize: 12, color: Colors.black),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
