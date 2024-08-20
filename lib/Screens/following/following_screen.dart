import 'package:flutter/material.dart';

class FollowingScreen extends StatefulWidget {
  const FollowingScreen({super.key});

  @override
  State<FollowingScreen> createState() => _FollowingScreenState();
}

class _FollowingScreenState extends State<FollowingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        leading: const Icon(Icons.search),
        title: const Text('Followings'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Text('Recently Followed'),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey,
                        ),
                        child: const Icon(Icons.library_books_outlined),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Library',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Column(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey,
                        ),
                        child: const Icon(Icons.save_alt),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Saved Stories',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(thickness: 10),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Follow Your Interests',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert_outlined),
                  ),
                ],
              ),
              const Text(
                'Choose topics that\'ll appear in your For You news feed and under what you\'re Following',
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  buildInterestContainer(
                    icon: Icons.toys_outlined,
                    color: Colors.purpleAccent,
                    text: 'Entertainment',
                  ),
                  buildInterestContainer(
                    icon: Icons.live_tv,
                    color: Colors.red,
                    text: 'TV',
                  ),
                  buildInterestContainer(
                    icon: Icons.energy_savings_leaf,
                    color: Colors.amberAccent,
                    text: 'Nutrition',
                  ),
                  buildInterestContainer(
                    icon: Icons.sports_basketball_sharp,
                    color: Colors.orange,
                    text: 'Sports',
                  ),
                  buildInterestContainer(
                    icon: Icons.biotech,
                    color: Colors.black,
                    text: 'Technology',
                  ),
                  buildInterestContainer(
                    icon: Icons.science_outlined,
                    color: Colors.purple,
                    text: 'Science',
                  ),
                  buildInterestContainer(
                    icon: Icons.note_alt_rounded,
                    color: Colors.green,
                    text: 'Economy',
                  ),
                  buildInterestContainer(
                    icon: Icons.business_center_rounded,
                    color: Colors.brown,
                    text: 'Business',
                  ),
                  buildInterestContainer(
                    icon: Icons.rocket,
                    color: Colors.red,
                    text: 'Space',
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('See more topics'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Done'),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(thickness: 1),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade300),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Follow your favourite sources',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Choose sources from Newsstand to see more of them in your news feed. Manage them under Following.',
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.black,
                        ),
                        child: const Text('Go to Newsstand'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInterestContainer(
      {required IconData icon, required Color color, required String text}) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon, color: color),
          const SizedBox(width: 5),
          Text(text),
        ],
      ),
    );
  }
}
