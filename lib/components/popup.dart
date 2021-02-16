import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_mapbox_navigation/library.dart';
import 'package:geolocator/geolocator.dart';
import 'package:reciclagem/model/cooperativa.dart';

class Popup extends StatefulWidget {
  final Marker marker;
  final Cooperativa cooperativa;

  Popup(this.marker, this.cooperativa, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PopupState(this.marker, this.cooperativa);
}

class _PopupState extends State<Popup> {
  final Marker _marker;
  final Cooperativa _cooperativa;
  final List<WayPoint> _wp = [];

  /*Configuração rota*/
  MapBoxNavigation _directions;
  MapBoxOptions _options;

  String _instruction = "";
  bool _arrived = false;
  bool _isMultipleStop = false;
  double _distanceRemaining, _durationRemaining;
  MapBoxNavigationViewController _controller;
  bool _routeBuilt = false;
  bool _isNavigating = false;

  int _currentIcon = 0;

  _PopupState(this._marker, this._cooperativa);

  _determinarPosicao() async {
    await Geolocator
        .getCurrentPosition()
        .then((Position position) async {
      setState(() {
        // Store the position in the variable
        _wp.add(WayPoint(name: "início", latitude: position.latitude, longitude: position.longitude));
        _wp.add(WayPoint(name: "destino", latitude: _cooperativa.latitude, longitude: _cooperativa.longitude));
      });
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _directions = MapBoxNavigation(onRouteEvent: _onEmbeddedRouteEvent);
    _determinarPosicao();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _cardDescription(context),
          ],
        ),
      ),
    );
  }

  Widget _cardDescription(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        constraints: BoxConstraints(minWidth: 100, maxWidth: 200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              _cooperativa.identificador,
              overflow: TextOverflow.fade,
              softWrap: false,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
            Text(
              "Responsável: ${_cooperativa.responsavel}",
              style: const TextStyle(fontSize: 12.0),
            ),
            Text(
              _cooperativa.setorHabitacional + ' ' + _cooperativa.cep,
              style: const TextStyle(fontSize: 12.0),
            ),
            Text(
              "Contato: ${_cooperativa.contato}",
              style: const TextStyle(fontSize: 12.0),
            ),
            RaisedButton(
            child: Text("Construir a rota"),
            onPressed: () async {
              await _directions.startNavigation(
                  wayPoints: _wp,
                  options: MapBoxOptions(
                      mode:
                      MapBoxNavigationMode.drivingWithTraffic,
                      simulateRoute: true,
                      language: "pt",
                      units: VoiceUnits.metric));
            },// handle your onTap here
              ),
          ],
        ),
      ),
    );
  }
  Future<void> _onEmbeddedRouteEvent(e) async {
    _distanceRemaining = await _directions.distanceRemaining;
    _durationRemaining = await _directions.durationRemaining;

    switch (e.eventType) {
      case MapBoxEvent.progress_change:
        var progressEvent = e.data as RouteProgressEvent;
        _arrived = progressEvent.arrived;
        if (progressEvent.currentStepInstruction != null)
          _instruction = progressEvent.currentStepInstruction;
        break;
      case MapBoxEvent.route_building:
      case MapBoxEvent.route_built:
        setState(() {
          _routeBuilt = true;
        });
        break;
      case MapBoxEvent.route_build_failed:
        setState(() {
          _routeBuilt = false;
        });
        break;
      case MapBoxEvent.navigation_running:
        setState(() {
          _isNavigating = true;
        });
        break;
      case MapBoxEvent.on_arrival:
        _arrived = true;
        if (!_isMultipleStop) {
          await Future.delayed(Duration(seconds: 3));
          await _controller.finishNavigation();
        } else {}
        break;
      case MapBoxEvent.navigation_finished:
      case MapBoxEvent.navigation_cancelled:
        setState(() {
          _routeBuilt = false;
          _isNavigating = false;
        });
        break;
      default:
        break;
    }
    setState(() {});
  }
}