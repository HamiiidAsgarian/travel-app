import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app_example/core/consts.dart';
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
          Container(
            padding: const EdgeInsets.only(right: 15),
            child: Center(
              child: Badge(
                  alignment: AlignmentDirectional.centerStart,
                  label: SizedBox(
                      width: 10,
                      height: 10,
                      child: Center(
                          child: BlocBuilder<DestinationBloc, DestinationState>(
                        builder: (context, state) {
                          return Text(state.destinations!.length.toString());
                        },
                      ))),
                  backgroundColor: const Color.fromARGB(255, 255, 7, 7),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite, size: 30))),
            ),
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
            BlocBuilder<DestinationBloc, DestinationState>(
              builder: (context, state) {
                return Expanded(
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
                                      // BlocProvider.of<DestinationBloc>(context)
                                      //     .add(AddToTravelDestination(
                                      //         newDestination: item));
                                    }),
                                Positioned(
                                  top: 0,
                                  right: 50,
                                  child: IconButton(
                                      onPressed: () =>
                                          onPressDelete(context, index),
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

  void onPressDelete(context, index) {
    {
      BlocProvider.of<DestinationBloc>(context).add(DeleteFromTravelDestination(
        selectedDestinationListIndex: index,
      ));
      AppConsts.snackbar(
          context, "Destination Deleted Successfully", AppConsts.mainRed);
    }
  }
}
