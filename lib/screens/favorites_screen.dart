import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app_example/widgets/widgets.dart';

import '../bloC/destination_bloc.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF5082ff),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 20),
            child: Badge(
                alignment: AlignmentDirectional.centerStart,
                label: SizedBox(
                    width: 10,
                    height: 10,
                    child:
                        Center(child: BlocBuilder<BasketBloc, DestinationState>(
                      builder: (context, state) {
                        return Text(state.destinations!.length.toString());
                      },
                    ))),
                backgroundColor: const Color.fromARGB(255, 255, 7, 7),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite, size: 30))),
          ),
        ],
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(25),
              child: const Text(
                "Destination Basket",
                style: TextStyle(fontSize: 30),
              ),
            ),
            BlocBuilder<BasketBloc, DestinationState>(
              builder: (context, state) {
                return Expanded(
                  // height: 500,
                  // padding:
                  //     const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
                  child: (state.destinations != null)
                      ? ListView.builder(
                          itemCount: state.destinations!.length,
                          itemBuilder: (context, index) {
                            return Stack(
                              alignment: AlignmentDirectional.bottomEnd,
                              children: [
                                DestinationCards(
                                    data: state.destinations![index],
                                    ontap: (item) {
                                      BlocProvider.of<BasketBloc>(context).add(
                                          AddToTravelDestination(
                                              newDestination: item));
                                    }),
                                Positioned(
                                  top: 0,
                                  right: 50,
                                  child: IconButton(
                                      onPressed: () {
                                        BlocProvider.of<BasketBloc>(context)
                                            .add(DeleteFromTravelDestination(
                                                selectedShoe:
                                                    state.destinations![index],
                                                selectedShoeListIndex: index));

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                          backgroundColor: Colors.red,
                                          content: Text(
                                              "✔ Item has been deleted successfully"),
                                          duration: Duration(seconds: 3),
                                        ));
                                      },
                                      icon: const Icon(
                                        Icons.close,
                                        size: 30,
                                        color: Colors.red,
                                      )),
                                ),
                              ],
                            );
                          })
                      : const Center(
                          child: Icon(Icons.close),
                        ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
