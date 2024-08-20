import 'package:flutter/material.dart';

import '../Screens/description_page.dart';
import '../Service/google_news_api.dart';
import '../models/business_news_model.dart';

class BusinessPage extends StatefulWidget {
  const BusinessPage({super.key});

  @override
  State<BusinessPage> createState() => _BusinessPageState();
}

class _BusinessPageState extends State<BusinessPage> {

  List<Item4> list4 = [];

  @override
  void initState() {
    super.initState();
    // _fetchBusinessDataFromGoogleApi();
    _fetchBusinessDataFromCachedMemory();
  }

  _fetchBusinessDataFromGoogleApi() async {
    list4 = (await GoogleNewsApi().getBusinessNewsData()) ?? [];
    print(list4);
    setState(() {});
  }

  _fetchBusinessDataFromCachedMemory() async{
    list4 = (await GoogleNewsApi().getCachedBusinessNewsData())??[];
    print(list4);
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Business Page',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      //screen share ?
      body: ListView.builder(
        itemCount: list4.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: Column(
            children: [
              InkWell(
                  onTap: () {
                    list4[index].images!.thumbnail != null
                        ? Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DescPage(
                              title: list4[index].title.toString(),
                              imgUrl: list4[index]
                                  .images!
                                  .thumbnailProxied
                                  .toString(),
                              snippet: list4[index].snippet.toString(),
                              publisher:
                              list4[index].publisher.toString(),
                            )))
                        : ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(
                      content: Text("NUll Value"),
                      duration: Duration(milliseconds: 400),
                    ));
                  },
                  child: list4[index].images?.thumbnail != null
                      ? Image(
                      fit: BoxFit.fitWidth,
                      width: MediaQuery.of(context).size.width,
                      image: NetworkImage(
                          list4[index].images!.thumbnail.toString()))
                      : const Image(
                      image: NetworkImage(
                          "https://t3.ftcdn.net/jpg/01/73/00/58/360_F_173005809_txJU6BsjnNWGMFlEAxprFmigx9HBYrSI.jpg"))),
              Text(
                list4[index].title.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                list4[index].snippet.toString(),
                style: const TextStyle(fontSize: 15, color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                list4[index].publisher.toString(),
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
