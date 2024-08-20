import 'package:flutter/material.dart';

class NewsstandScreen extends StatefulWidget {
  const NewsstandScreen({super.key});

  @override
  State<NewsstandScreen> createState() => _NewsstandScreenState();
}

class _NewsstandScreenState extends State<NewsstandScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.search),
        title: const Text('Newsstand'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Suggested Sources',
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'News Showcase',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Text('Stories selected by Newsroom Editors'),
              const SizedBox(
                height: 20,
              ),
              Card(
                color: Colors.black12,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'THE SIASAT DAILY',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          OutlinedButton(
                              onPressed: () {},
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.star_border,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Follow',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              )),
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        height: 40,
                        color: Colors.grey.shade600,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Top Stories of the Day'),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Hyderabad sees over 46K home registratons in 2024',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.grey.shade800,
                      ),
                      const Text(
                        'Jaya Bachan questions Speaker Dhankar\'s tone, leaves him fuming',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.grey.shade800,
                      ),
                      const Text(
                        'Mohammad Siraj alotted 600 sq yard plot in Jubilee Hills',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                thickness: 10,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Entertainment',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Food and Drink',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Health and Fitness',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Home and Garden',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'News and Politics',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Science and Technology',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Special Interest',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Sports',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              Center(
                  child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white),
                child: const Text('More Sports'),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
