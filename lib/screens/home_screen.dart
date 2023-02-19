// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:travel_app_example/models/destination.dart';
import 'package:travel_app_example/screens/favorites_screen.dart';

import '../bloC/destination_bloc.dart';
import '../core/consts.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  final List<Destination> data;
  final List<String> tabTitles;

  const HomeScreen({
    Key? key,
    required this.data,
    required this.tabTitles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabTitles.length,
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppConsts.mainBlue,
            actions: [
              Container(
                padding: const EdgeInsets.only(right: 15),
                child: Center(
                  child: Badge(
                      alignment: AlignmentDirectional.centerStart,
                      label: SizedBox(
                          width: 10,
                          height: 10,
                          child: Center(child:
                              BlocBuilder<DestinationBloc, DestinationState>(
                            builder: (context, state) {
                              return Text(
                                  state.destinations!.length.toString());
                            },
                          ))),
                      backgroundColor: AppConsts.mainRed,
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
              ),
            ],
            leading: IconButton(
                onPressed: () {}, icon: const Icon(Icons.menu_outlined)),
          ),
          body: Column(
            children: [Header(tabTitles: tabTitles), Body(data: data)],
          )),
    );
  }
}

class Header extends StatelessWidget {
  final List<String> tabTitles;
  const Header({
    super.key,
    required this.tabTitles,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 0, bottom: 25),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppConsts.mainBlue, AppConsts.secondBlue])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TabBar(
              physics: const BouncingScrollPhysics(),
              isScrollable: true,
              indicatorPadding: const EdgeInsets.all(5),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppConsts.thirdBlue,
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
                Text("Travel",
                    style: TextStyle(color: Colors.white, fontSize: 25)),
                Text("around the world",
                    style: TextStyle(color: Colors.white, fontSize: 25)),
              ],
            ),
          ),
          TextField(
            decoration: InputDecoration(
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
                      color: Color.fromARGB(255, 24, 24, 24), fontSize: 20),
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
                            ontap: (Destination itemData) =>
                                onTapCArd(itemData, contex));
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

  onTapCArd(Destination itemData, context) {
    BlocProvider.of<DestinationBloc>(context)
        .add(AddToTravelDestination(newDestination: itemData));

    AppConsts.snackbar(
        context, "Destination Added Successfully", AppConsts.mainGreen);
  }
}
