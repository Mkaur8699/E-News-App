import 'package:flutter/material.dart';

import '../Screens/description_page.dart';
import '../Service/google_news_api.dart';
import '../models/science_news_model.dart';

class SciencePage extends StatefulWidget {
  const SciencePage({super.key});

  @override
  State<SciencePage> createState() => _SciencePageState();
}

class _SciencePageState extends State<SciencePage> {

  List<Item7> list7 = [];

  @override
  void initState() {
    super.initState();
    // _fetchScienceDataFromGoogleApi();
    _fetchScienceDataFromCachedMemory();
  }

  _fetchScienceDataFromGoogleApi() async {
    list7 = (await GoogleNewsApi().getScienceNewsData()) ?? [];
    print(list7);
    setState(() {});
  }

  _fetchScienceDataFromCachedMemory() async{
    list7 = (await GoogleNewsApi().getCachedScienceNewsData())??[];
    print(list7);
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Science Page',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      //screen share ?
      body: ListView.builder(
        itemCount: list7.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: Column(
            children: [
              InkWell(
                  onTap: () {
                    list7[index].images!.thumbnail != null
                        ? Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DescPage(
                              title: list7[index].title.toString(),
                              imgUrl: list7[index]
                                  .images!
                                  .thumbnailProxied
                                  .toString(),
                              snippet: list7[index].snippet.toString(),
                              publisher:
                              list7[index].publisher.toString(),
                            )))
                        : ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(
                      content: Text("NUll Value"),
                      duration: Duration(milliseconds: 400),
                    ));
                  },
                  child: list7[index].images?.thumbnail != null
                      ? Image(
                      fit: BoxFit.fitWidth,
                      width: MediaQuery.of(context).size.width,
                      image: NetworkImage(
                          list7[index].images!.thumbnail.toString()))
                      : const Image(
                      image: NetworkImage(
                          "https://t3.ftcdn.net/jpg/01/73/00/58/360_F_173005809_txJU6BsjnNWGMFlEAxprFmigx9HBYrSI.jpg"))),
              Text(
                list7[index].title.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                list7[index].snippet.toString(),
                style: const TextStyle(fontSize: 15, color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                list7[index].publisher.toString(),
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
