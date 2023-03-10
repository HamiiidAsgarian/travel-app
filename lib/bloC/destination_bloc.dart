import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/destination.dart';

abstract class DestinationEvent {}

class AddToTravelDestination extends DestinationEvent {
  Destination newDestination;
  AddToTravelDestination({required this.newDestination});
}

class DeleteFromTravelDestination extends DestinationEvent {
  int selectedDestinationListIndex;
  DeleteFromTravelDestination({required this.selectedDestinationListIndex});
}

///-------------!State SECTION

abstract class DestinationState {
  DestinationState({this.destinations});
  List<Destination>? destinations;
}

class DestinationsInit extends DestinationState {
  DestinationsInit() : super(destinations: []);
}

class BasketUpdate extends DestinationState {
  BasketUpdate({super.destinations});
}
//---------------!bloC SECTION

class DestinationBloc extends Bloc<DestinationEvent, DestinationState> {
  List<Destination> dests = [];
  DestinationBloc() : super(DestinationsInit()) {
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
    dests.removeAt(event.selectedDestinationListIndex);
    emit(BasketUpdate(destinations: dests));
  }
}
