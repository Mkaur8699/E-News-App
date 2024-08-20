import 'package:flutter/material.dart';

class DescPage extends StatelessWidget {
  const DescPage({super.key, required this.title, required this.imgUrl,
    required this.snippet, required this.publisher});
final String title;
final String imgUrl;
final String snippet;
final String publisher;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Description', style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(imgUrl, fit: BoxFit.fitWidth,
              width: MediaQuery.of(context).size.width,),
              const SizedBox(
                height: 10,
              ),
              Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              const SizedBox(
                height: 10,
              ),
              Text(snippet),
              Text(publisher),
            ],
          ),
        ),
      ),
    );
  }
}
