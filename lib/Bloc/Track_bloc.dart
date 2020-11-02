//mport 'dart:math';

//mport 'dart:io';

import 'package:bloc/bloc.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter_app20/Bloc/Track_Event.dart';

import 'package:flutter_app20/Bloc/Track_state.dart';
import 'package:flutter_app20/data/Model/api_result_model.dart';
import 'package:flutter_app20/data/repositories/Track_repository.dart';
//import 'package:flutter_app20/exception/exception.dart';
//import 'package:meta/meta.dart';
//import 'h';

import 'Track_Event.dart';

class TrackBloc extends Bloc<TrackEvent, TrackState> {

  TrackRepository trackRepository;
  List<TrackList> trackList;

  TrackRepository repositories;




 TrackBloc({this.trackRepository}) : super(TrackInitialState());
  @override
  Stream<TrackState> mapEventToState(TrackEvent event) async* {
    switch (event) {
      case TrackEvent.fetchTrack:
        yield TrackLoadingState();
       // try {
          trackList = await trackRepository.getTrackList();

          yield TrackLoadedState(trackList: trackList);
        break;
        }

        //on SocketException {
          //yield TrackErrorState(
           // error: NoInternetException('No Internet'),
          //);
        //}
        //catch (e) {
          //yield TrackErrorState(
            //error: UnknownException('Unknown Error'),
          //);
        //}

        }

    }

