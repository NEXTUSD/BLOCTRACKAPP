import 'package:flutter/material.dart';


import 'package:flutter_app20/ui/HomePage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Bloc/Track_bloc.dart';
import 'data/repositories/Track_repository.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trending',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(create: (BuildContext context) {
        return TrackBloc(trackRepository: TrackRepositoryImpl());
      },
        child: HomePage(),

      ),
     );

  }
}
