import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:reciclagem/controller/cooperativa_controller.dart';
import 'package:reciclagem/model/cooperativa.dart';

class Mapa extends StatefulWidget {
  @override
  _MapaState createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  Completer<GoogleMapController> _controller = Completer();
  CooperativaController _cooperativaController = new CooperativaController();
  static const LatLng _latlong = const LatLng(-15.7801, -47.9292);
  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  Map<int, Marker> pontos = new Map();

  void _addPontosCooperativa(List<Cooperativa> cooperativas) {
    for (final c in cooperativas) {
      _addPonto(c);
    }
  }

  void _addPonto(Cooperativa e) {
    final Marker marker = Marker(position: LatLng(e.latitude, e.longitude),markerId: MarkerId(e.identificador), onTap: (){_configurandoModalBottomSheetCooperativa(e);});
    setState(() {
      int tam = pontos.length;
      pontos[tam] = marker;
    });
  }

  void _configurandoModalBottomSheetCooperativa(Cooperativa cooperativa){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc){
          return Container(
            child: Wrap(children: <Widget>[
              ListTile(
                  title: new Text(cooperativa.identificador),
                  onTap: () => {}
              ),
              ListTile(
                leading: new Icon(Icons.add_call),
                title: new Text(cooperativa.contato),
                onTap: () => { },
              ),
              ListTile(
                leading: new Icon(Icons.assignment_ind),
                title: new Text(cooperativa.responsavel),
                onTap: () => {},
              ),
              ListTile(
                title: new Text(cooperativa.setorHabitacional + '     ' + cooperativa.cep),
                onTap: () => { },
              ),
            ],
            ),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    _cooperativaController.findAll().then((value) => _addPontosCooperativa(value));
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
