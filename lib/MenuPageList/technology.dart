import 'package:flutter/material.dart';
import 'package:news_app/Screens/description_page.dart';
import 'package:news_app/Service/google_news_api.dart';

import '../models/technology_news_model.dart';

class TechnologyPage extends StatefulWidget {
  const TechnologyPage({super.key});

  @override
  State<TechnologyPage> createState() => _TechnologyPageState();
}

class _TechnologyPageState extends State<TechnologyPage> {
  List<Item8> list8 = [];

  @override
  void initState() {
    super.initState();
    // _fetchTechnologyDataFromGoogleAPi();
    _fetchTechnologyDataFromCachedMemory();
  }

  _fetchTechnologyDataFromGoogleAPi() async {
    list8 = (await GoogleNewsApi().getTechnologyNewsData()) ?? [];
    print(list8);
    setState(() {});
  }

  _fetchTechnologyDataFromCachedMemory() async {
    list8 = (await GoogleNewsApi().getCachedTechnologyNewsData()) ?? [];
    print(list8);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Technology Page',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: list8.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  list8[index].images!.thumbnail != null
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DescPage(
                              title: list8[index].title.toString(),
                              imgUrl: list8[index]
                                  .images!
                                  .thumbnailProxied
                                  .toString(),
                              snippet: list8[index].snippet.toString(),
                              publisher: list8[index].publisher.toString(),
                            ),
                          ),
                        )
                      : ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Null value'),
                            duration: Duration(milliseconds: 400),
                          ),
                        );
                },
                child: list8[index].images?.thumbnail != null
                    ? Image(
                        fit: BoxFit.fitWidth,
                        width: MediaQuery.of(context).size.width,
                        image: NetworkImage(
                            list8[index].images!.thumbnail.toString()))
                    : const Image(
                        image: NetworkImage(
                            'https://t3.ftcdn.net/jpg/01/73/00/58/360_F_173005809_txJU6BsjnNWGMFlEAxprFmigx9HBYrSI.jpg'),
                      ),
              ),
              Text(
                list8[index].title.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                list8[index].snippet.toString(),
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                list8[index].publisher.toString(),
                style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
