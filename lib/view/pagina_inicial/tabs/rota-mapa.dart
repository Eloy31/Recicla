import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_tappable_polyline/flutter_map_tappable_polyline.dart';
import 'package:geolocator/geolocator.dart';
import 'package:reciclagem/model/cooperativa.dart';
import 'package:latlong/latlong.dart';

class RotaMapa extends StatefulWidget {
  final Cooperativa cooperativa;

  RotaMapa(this.cooperativa, {Key key}) : super(key: key);
  @override
  _RotaMapaState createState() => _RotaMapaState(this.cooperativa);
}

class _RotaMapaState extends State<RotaMapa> {
  final Cooperativa cooperativa;

  /*Get localização*/
  Position _currentPosition;

  _RotaMapaState(this.cooperativa);

  List<LatLng> _points = [];

  _determinarPosicao() async {
    await Geolocator
        .getCurrentPosition()
        .then((Position position) async {
      setState(() {
        // Store the position in the variable
        _points.add(LatLng(position.latitude, position.longitude));
        _points.add(LatLng(cooperativa.latitude, cooperativa.longitude));
        _currentPosition = position;
      });
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _determinarPosicao();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(_currentPosition.latitude, _currentPosition.longitude),
          zoom: 11.0,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
          ),
         PolylineLayerOptions(
            // Will only render visible polylines, increasing performance
              polylineCulling: true,
              polylines: [
                Polyline(
                  // An optional tag to distinguish polylines in callback
                  points: _points,
                  color: Colors.red,
                  strokeWidth: 3.0,
                ),
              ],
         ),
        ],
      ),
    );
  }
}