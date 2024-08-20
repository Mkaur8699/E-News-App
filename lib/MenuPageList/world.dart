import 'package:flutter/material.dart';

import '../Screens/description_page.dart';
import '../Service/google_news_api.dart';
import '../models/world_news_model.dart';

class WorldPage extends StatefulWidget {
  const WorldPage({super.key});

  @override
  State<WorldPage> createState() => _WorldPageState();
}

class _WorldPageState extends State<WorldPage> {
  List<Item3> list3 = [];

  @override
  void initState() {
    super.initState();
    // _fetchWorldDataFromGoogleApi();
    _fetchWorldDataFromCachedMemory();
  }

  _fetchWorldDataFromGoogleApi() async {
    list3 = (await GoogleNewsApi().getWorldNewsData()) ?? [];
    print(list3);
    setState(() {});
  }

  _fetchWorldDataFromCachedMemory() async{
    list3 = (await GoogleNewsApi().getCachedWorldNewsData())??[];
    print(list3);
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'World Page',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      //screen share ?
      body: ListView.builder(
        itemCount: list3.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: Column(
            children: [
              InkWell(
                  onTap: () {
                    list3[index].images!.thumbnail != null
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DescPage(
                                      title: list3[index].title.toString(),
                                      imgUrl: list3[index]
                                          .images!
                                          .thumbnailProxied
                                          .toString(),
                                      snippet: list3[index].snippet.toString(),
                                      publisher:
                                          list3[index].publisher.toString(),
                                    )))
                        : ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                            content: Text("NUll Value"),
                            duration: Duration(milliseconds: 400),
                          ));
                  },
                  child: list3[index].images?.thumbnail != null
                      ? Image(
                          fit: BoxFit.fitWidth,
                          width: MediaQuery.of(context).size.width,
                          image: NetworkImage(
                              list3[index].images!.thumbnail.toString()))
                      : const Image(
                          image: NetworkImage(
                              "https://t3.ftcdn.net/jpg/01/73/00/58/360_F_173005809_txJU6BsjnNWGMFlEAxprFmigx9HBYrSI.jpg"))),
              Text(
                list3[index].title.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                list3[index].snippet.toString(),
                style: const TextStyle(fontSize: 15, color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                list3[index].publisher.toString(),
                style: const TextStyle(fontSize: 12, color: Colors.black),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
