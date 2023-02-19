import 'package:flutter/material.dart';
import 'package:travel_app_example/models/destination.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> data = [
      {
        'title': "The grand canion",
        'imageURl': "imageURl",
        'rate': 4,
        'price': 60,
        'categories': ['History', 'Culture'],
        'tourNumber': 2,
        'capacity': 5,
      },
      {
        'title': "The grand canion",
        'imageURl': "imageURl",
        'rate': 4,
        'price': 60,
        'categories': ['History', 'Culture'],
        'tourNumber': 2,
        'capacity': 5,
      },
      {
        'title': "The grand canion",
        'imageURl': "imageURl",
        'rate': 4,
        'price': 60,
        'categories': ['History', 'Culture'],
        'tourNumber': 2,
        'capacity': 5,
      }
    ];
    List<Destination> modeledData =
        data.map((e) => Destination.fromJson(e)).toList();
    return const MaterialApp(home: HomeScreen());
  }
}

List tabTitles = ["trending", 'Future', 'New'];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color(0xFF5082ff),
            actions: const [Icon(Icons.favorite)],
            leading: IconButton(
                onPressed: () {}, icon: const Icon(Icons.menu_outlined)),
          ),
          body: Column(
            children: const [Header(), Body()],
          )),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      // color: Colors.blue,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Place arround you",
                  style: TextStyle(
                      color: Color.fromARGB(255, 24, 24, 24), fontSize: 18),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "View All",
                    style: TextStyle(
                        color: Color.fromARGB(255, 68, 68, 68), fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(children: [
              Center(child: ListView.builder(itemBuilder: (contex, index) {
                return const DestinationCards();
              })),
              const Center(
                child: Text("2"),
              ),
              const Center(
                child: Text("3"),
              )
            ]),
          ),
        ],
      ),
    ));
  }
}

class DestinationCards extends StatelessWidget {
  const DestinationCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("ok");
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        // height: 150,
        // color: Colors.red,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          image:
                              NetworkImage("https://picsum.photos/300/300"))),
                ),
                Expanded(
                  child: Container(
                    height: 150,
                    // color: Colors.brown,
                    margin: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                  "Titleaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaddddd",
                                  style: TextStyle(fontSize: 20),
                                  overflow: TextOverflow.ellipsis),
                              const SizedBox(height: 10),
                              Row(
                                children: List.generate(
                                    5,
                                    (index) => const Icon(Icons.star_border,
                                        color: Colors.amber)),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("start from"),
                              const SizedBox(height: 10),
                              RichText(
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                        text: "\$60",
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                        text: '/Person',
                                        style: TextStyle(color: Colors.grey)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              height: 35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFf2f2f2)),
              child: Row(
                children: const [
                  BoletPointText(),
                  BoletPointText(),
                  BoletPointText(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BoletPointText extends StatelessWidget {
  const BoletPointText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: RichText(
        text: const TextSpan(
          children: [
            TextSpan(
                text: "● ",
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
            TextSpan(
                text: 'History culture', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 0, bottom: 25),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF5082ff), Color(0xFF76abfb)])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TabBar(
              physics: const BouncingScrollPhysics(),
              isScrollable: true,
              indicatorPadding: const EdgeInsets.all(5),
              indicator: BoxDecoration(
                // border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xFF739dff),
              ),
              tabs: tabTitles.isNotEmpty
                  ? tabTitles
                      .map((e) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Tab(text: e),
                          ))
                      .toList()
                  : [const SizedBox()]),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("travel",
                    style: TextStyle(color: Colors.white, fontSize: 25)),
                Text("around the world",
                    style: TextStyle(color: Colors.white, fontSize: 25)),
              ],
            ),
          ),
          TextField(
            decoration: InputDecoration(
                // hintText: 'Hello',
                label: const Text(
                  'Search your destination ...',
                  style: TextStyle(color: Colors.white),
                ),
                prefixIcon: const Icon(
                  Icons.pin_drop_rounded,
                  color: Colors.white,
                ),
                filled: true,
                fillColor: const Color(0xFFaacafd),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide.none,
                )),
          ),
        ],
      ),
    );
  }
}
