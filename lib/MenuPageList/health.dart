import 'package:flutter/material.dart';

import '../Screens/description_page.dart';
import '../Service/google_news_api.dart';
import '../models/health_news_model.dart';

class HealthPage extends StatefulWidget {
  const HealthPage({super.key});

  @override
  State<HealthPage> createState() => _HealthPageState();
}

class _HealthPageState extends State<HealthPage> {

  List<Item5> list5 = [];

  @override
  void initState() {
    super.initState();
    // _fetchHealthDataFromGoogleApi();
    _fetchHealthDataFromCachedMemory();
  }

  _fetchHealthDataFromGoogleApi() async {
    list5 = (await GoogleNewsApi().getHealthNewsData()) ?? [];
    print(list5);
    setState(() {});
  }

  _fetchHealthDataFromCachedMemory() async{
    list5 = (await GoogleNewsApi().getCachedHealthNewsData())??[];
    print(list5);
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Health Page',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      //screen share ?
      body: ListView.builder(
        itemCount: list5.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: Column(
            children: [
              InkWell(
                  onTap: () {
                    list5[index].images!.thumbnail != null
                        ? Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DescPage(
                              title: list5[index].title.toString(),
                              imgUrl: list5[index]
                                  .images!
                                  .thumbnailProxied
                                  .toString(),
                              snippet: list5[index].snippet.toString(),
                              publisher:
                              list5[index].publisher.toString(),
                            )))
                        : ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(
                      content: Text("NUll Value"),
                      duration: Duration(milliseconds: 400),
                    ));
                  },
                  child: list5[index].images?.thumbnail != null
                      ? Image(
                      fit: BoxFit.fitWidth,
                      width: MediaQuery.of(context).size.width,
                      image: NetworkImage(
                          list5[index].images!.thumbnail.toString()))
                      : const Image(
                      image: NetworkImage(
                          "https://t3.ftcdn.net/jpg/01/73/00/58/360_F_173005809_txJU6BsjnNWGMFlEAxprFmigx9HBYrSI.jpg"))),
              Text(
                list5[index].title.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                list5[index].snippet.toString(),
                style: const TextStyle(fontSize: 15, color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                list5[index].publisher.toString(),
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
