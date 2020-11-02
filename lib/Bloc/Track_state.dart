import 'package:flutter_app20/data/Model/api_result_model.dart';
import 'package:equatable/equatable.dart';
//import 'package:flutter_app20/exception/exception.dart';
import 'package:meta/meta.dart';

abstract class TrackState extends Equatable {
  String get message => null;

  //get error => null;




}

class TrackInitialState extends TrackState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class TrackLoadingState extends TrackState {

  @override
  // TODO: implement props
  List<Object> get props => [];

  List<TrackList> get tracklist => tracklist;
}

// ignore: must_be_immutable
class TrackLoadedState extends TrackState {

  List<TrackList> trackList;

  TrackLoadedState({@required this.trackList});

  @override
  // TODO: implement props
  List<Object> get props => [trackList];
}

class TrackErrorState extends TrackState {

  final error;

  TrackErrorState({this.error});
  @override
  // TODO: implement props
  List<Object> get props => null;

}