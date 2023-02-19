import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app_example/models/destination.dart';
import 'package:travel_app_example/screens/favorites_screen.dart';

import '../bloC/destination_bloc.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  final List<Destination> data;

  const HomeScreen({this.data = const [], super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color(0xFF5082ff),
            actions: [
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 10),
                child: Badge(
                    alignment: AlignmentDirectional.centerStart,
                    label: SizedBox(
                        width: 10,
                        height: 10,
                        child: Center(
                            child: BlocBuilder<BasketBloc, DestinationState>(
                          builder: (context, state) {
                            return Text(state.destinations!.length.toString());
                          },
                        ))),
                    backgroundColor: const Color.fromARGB(255, 255, 7, 7),
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const FavoriteScreen()));
                        },
                        icon: const Icon(Icons.favorite, size: 30))),
              ),
            ],
            leading: IconButton(
                onPressed: () {}, icon: const Icon(Icons.menu_outlined)),
          ),
          body: Column(
            children: [const Header(), Body(data: data)],
          )),
    );
  }
}

class Body extends StatelessWidget {
  final List<Destination> data;

  const Body({
    required this.data,
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
              Center(
                  child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (contex, index) {
                        return DestinationCards(
                            data: data[index],
                            ontap: (Destination itemData) {
                              BlocProvider.of<BasketBloc>(context).add(
                                  AddToTravelDestination(
                                      newDestination: itemData));

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                backgroundColor: Colors.green,
                                content:
                                    Text("✔ Item has been Added successfully"),
                                duration: Duration(seconds: 3),
                              ));
                            });
                      })),

              ///uNUSED TABS
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

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List tabTitles = ["trending", 'Future', 'New'];

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
