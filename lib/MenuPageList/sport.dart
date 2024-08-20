import 'package:flutter/material.dart';

import '../Screens/description_page.dart';
import '../Service/google_news_api.dart';
import '../models/sports_news_model.dart';

class SportPage extends StatefulWidget {
  const SportPage({super.key});

  @override
  State<SportPage> createState() => _SportPageState();
}

class _SportPageState extends State<SportPage> {

  List<Item6> list6 = [];

  @override
  void initState() {
    super.initState();
    // _fetchSportsDataFromGoogleApi();
    _fetchSportsDataFromCachedMemory();
  }

  _fetchSportsDataFromGoogleApi() async {
    list6 = (await GoogleNewsApi().getSportsNewsData()) ?? [];
    print(list6);
    setState(() {});
  }

  _fetchSportsDataFromCachedMemory() async{
    list6 = (await GoogleNewsApi().getCachedSportsNewsData())??[];
    print(list6);
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sports Page',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: list6.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: Column(
            children: [
              InkWell(
                  onTap: () {
                    list6[index].images!.thumbnail != null
                        ? Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DescPage(
                              title: list6[index].title.toString(),
                              imgUrl: list6[index]
                                  .images!
                                  .thumbnailProxied
                                  .toString(),
                              snippet: list6[index].snippet.toString(),
                              publisher:
                              list6[index].publisher.toString(),
                            )))
                        : ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(
                      content: Text("NUll Value"),
                      duration: Duration(milliseconds: 400),
                    ));
                  },
                  child: list6[index].images?.thumbnail != null
                      ? Image(
                      fit: BoxFit.fitWidth,
                      width: MediaQuery.of(context).size.width,
                      image: NetworkImage(
                          list6[index].images!.thumbnail.toString()))
                      : const Image(
                      image: NetworkImage(
                          "https://t3.ftcdn.net/jpg/01/73/00/58/360_F_173005809_txJU6BsjnNWGMFlEAxprFmigx9HBYrSI.jpg"))),
              Text(
                list6[index].title.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                list6[index].snippet.toString(),
                style: const TextStyle(fontSize: 15, color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                list6[index].publisher.toString(),
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
