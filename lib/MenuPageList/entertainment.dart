import 'package:flutter/material.dart';
import 'package:news_app/models/entertainment_news_model.dart';
import '../Screens/description_page.dart';
import '../Service/google_news_api.dart';
// import '../models/entertainment_news_model.dart';

class EntertainmentPage extends StatefulWidget {
  const EntertainmentPage({super.key});

  @override
  State<EntertainmentPage> createState() => _EntertainmentPageState();
}

class _EntertainmentPageState extends State<EntertainmentPage> {

  List<Item2> list2 = [];

  @override
  void initState() {
    super.initState();
    // _fetchEntertainmentDataFromGoogleApi();
    _fetchEntertainmentDataFromCachedMemory();
  }

  _fetchEntertainmentDataFromGoogleApi() async {
    list2 = (await GoogleNewsApi().getEntertainmentNewsData())??[];
    print(list2);
    setState(() {

    });
  }

  _fetchEntertainmentDataFromCachedMemory() async{
    list2 = (await GoogleNewsApi().getCachedEntertainmentNewsData())??[];
    print(list2);
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entertainment Page', style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      //screen share ?
      body: ListView.builder(
        itemCount: list2.length,
        itemBuilder: (context, index) =>
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Column(
                children: [
                  InkWell(
                      onTap: () {
                        list2[index].images!.thumbnail != null
                            ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DescPage(
                                      title: list2[index].title.toString(),
                                      imgUrl: list2[index]
                                          .images!
                                          .thumbnailProxied
                                          .toString(),
                                      snippet: list2[index].snippet.toString(),
                                      publisher:
                                      list2[index].publisher.toString(),
                                    )))
                            : ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("NUll Value"),
                          duration: Duration(milliseconds: 400),
                        ));
                      },
                      child: list2[index].images?.thumbnail != null
                          ? Image(
                          fit: BoxFit.fitWidth,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          image: NetworkImage(
                              list2[index].images!.thumbnail.toString()))
                          : const Image(
                          image: NetworkImage(
                              "https://t3.ftcdn.net/jpg/01/73/00/58/360_F_173005809_txJU6BsjnNWGMFlEAxprFmigx9HBYrSI.jpg"))),
                  Text(
                    list2[index].title.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    list2[index].snippet.toString(),
                    style: const TextStyle(fontSize: 15, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    list2[index].publisher.toString(),
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
