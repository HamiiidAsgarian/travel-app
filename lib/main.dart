import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app_example/models/destination.dart';
import 'package:travel_app_example/screens/home_screen.dart';

import 'bloC/destination_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> tabData = ["Trending", 'Futured', 'New'];
    List<Map<String, dynamic>> data = [
      {
        'title': "The Grand Canyon",
        'imageURl': "https://picsum.photos/300/300",
        'rate': 4,
        'price': 60,
        'categories': ['History', 'Cultural'],
        'tourNumber': 2,
        'capacity': 3,
      },
      {
        'title': "Bali Tourism",
        'imageURl': "https://picsum.photos/200/200",
        'rate': 3,
        'price': 145,
        'categories': ['History', 'Culture', 'SeeSighting'],
        'tourNumber': 1,
        'capacity': 5,
      },
      {
        'title': "Costa Rica Toursim",
        'imageURl': "https://picsum.photos/500/500",
        'rate': 4,
        'price': 20,
        'categories': ['History'],
        'tourNumber': 5,
        'capacity': 1,
      }
    ];
    List<Destination> modeledData =
        data.map((e) => Destination.fromJson(e)).toList();
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => DestinationBloc(),
          ),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomeScreen(data: modeledData, tabTitles: tabData)));
  }
}
