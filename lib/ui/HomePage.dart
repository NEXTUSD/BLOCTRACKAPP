import 'package:flutter/material.dart';
import 'package:flutter_app20/Bloc/Track_Event.dart';
//import 'package:flutter_app20/Bloc/Track_Event.dart';
import 'package:flutter_app20/Bloc/Track_bloc.dart';
import 'package:flutter_app20/Bloc/Track_state.dart';
import 'package:flutter_app20/data/Model/api_result_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:flutter_app20/main.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //TrackBloc trackBloc;

  //get tracklist => null;

  @override
  void initState() {
    super.initState();
    _loadTracks();


  }

  _loadTracks() async {

    context.bloc<TrackBloc>().add(TrackEvent.fetchTrack);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Trending", style: TextStyle(fontWeight: FontWeight.bold),),

        ),
        body: Container(
          child: _body(),
        )

    );
  }

  _body()
  {
    return Column(
      children: [
        BlocBuilder<TrackBloc, TrackState>(
        builder: (BuildContext context, TrackState state)
        {
          if (State is TrackErrorState){
          return Text("error");
        }
          if (state is TrackLoadedState){
            List<TrackList> tracklist = state.trackList;
            return buildTrackList(tracklist);

        }
          return CircularProgressIndicator();



    })
      ]
    );


  }







  Widget buildTrackList(List<TrackList> tracklist) {
    return Expanded(
      child: ListView.builder(
          itemCount: tracklist.length,
          itemBuilder: (_, index) {
            TrackList trackList = tracklist[index];
            return Text(trackList.title);
          }
      ),
    );
  }}