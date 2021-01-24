import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:reciclagem/model/cooperativa.dart';

class Mapa extends StatefulWidget {
  @override
  _MapaState createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _latlong = const LatLng(-15.7801, -47.9292);
  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  Map<int, Marker> pontos = new Map();

  void _addPontosCooperativa(List<Cooperativa> cooperativas) {
    cooperativas.map((e) => {_addPonto(e)});
  }

  void _addPonto(Cooperativa e) {
    final Marker marker = Marker(position: LatLng(e.latitude, e.longitude),markerId: MarkerId(e.identificador), onTap: (){_configurandoModalBottomSheet(e);});
    setState(() {
      int tam = pontos.length;
      pontos[tam] = marker;
    });
  }

  void _configurandoModalBottomSheet(Cooperativa cooperativa){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc){
          return Container(
            child: Wrap(children: <Widget>[
              ListTile(
                  leading: new Icon(Icons.music_note),
                  title: new Text('Músicas'),
                  onTap: () => {}
              ),
              ListTile(
                leading: new Icon(Icons.videocam),
                title: new Text('Videos'),
                onTap: () => { },
              ),
              ListTile(
                leading: new Icon(Icons.satellite),
                title: new Text('Tempo'),
                onTap: () => {},
              ),
            ],
            ),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
/*    _addPonto(-15.802388916561254, -48.04011769489368, "bonanza");
    _addPonto(-15.796212389047973, -48.01454878186181, "padaria lixosa");*/

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _latlong,
                zoom: 11.0,
              ),
              markers: Set<Marker>.of(pontos.values),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topRight,
                child: FloatingActionButton(
                  onPressed: () => print('Botão pressionado'),
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                  backgroundColor: Colors.green,
                  child: const Icon(Icons.map, size: 36.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
