import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/destination.dart';

abstract class DestinationEvent {}

class AddToTravelDestination extends DestinationEvent {
  Destination newDestination;
  AddToTravelDestination({required this.newDestination});
}

class DeleteFromTravelDestination extends DestinationEvent {
  Destination selectedShoe;
  int selectedShoeListIndex;
  DeleteFromTravelDestination(
      {required this.selectedShoe, required this.selectedShoeListIndex});
}

//-------------!SECTION

abstract class DestinationState {
  DestinationState({this.destinations});
  // List<Shoe>? favorite;
  List<Destination>? destinations;
}

class DestinationsInit extends DestinationState {
  DestinationsInit() : super(destinations: []);
}

class BasketUpdate extends DestinationState {
  BasketUpdate({super.destinations});
}
//---------------!SECTION

class BasketBloc extends Bloc<DestinationEvent, DestinationState> {
  List<Destination> dests = [];
  double? selectedSize;
  Color? selectedColor;
  Destination? currentShoe;

  BasketBloc() : super(DestinationsInit()) {
    on<AddToTravelDestination>(onAddTravelDestination);
    on<DeleteFromTravelDestination>(onDeleteFromBasket);
  }

  void onAddTravelDestination(
      AddToTravelDestination event, Emitter<DestinationState> emit) {
    Destination newSelection = event.newDestination;

    dests.add(newSelection);
    emit(BasketUpdate(destinations: dests));
  }

  void onDeleteFromBasket(
      DeleteFromTravelDestination event, Emitter<DestinationState> emit) {
    dests.removeAt(event.selectedShoeListIndex);
    emit(BasketUpdate(destinations: dests));
  }
}
