import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_bloc_app/src/blocs/electronics_bloc/electronics_bloc_bloc.dart';
import 'package:multi_bloc_app/src/blocs/jewelery_bloc/jewelery_bloc_bloc.dart';
import 'package:multi_bloc_app/src/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi Bloc App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ElectronicsBloc(),
          ),
          BlocProvider(
            create: (context) => JeweleryBloc(),
          ),
        ],
        child: const HomePage(),
      ),
    );
  }
}
