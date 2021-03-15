import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/extension_api.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:latlong/latlong.dart';
import 'package:reciclagem/components/popup.dart';
import 'package:reciclagem/controller/cooperativa_controller.dart';
import 'package:reciclagem/model/cooperativa.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map extends StatefulWidget {
  final GlobalKey<_MapState> _mapPageStateKey = GlobalKey<_MapState>();
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  CooperativaController _cooperativaController = new CooperativaController();

  static const _markerSize = 40.0;
  List<Marker> _markers = [];
  List<Cooperativa> _cooperativas = [];

  // Used to trigger showing/hiding of popups.
  final PopupController _popupLayerController = PopupController();

  @override
  void initState() {
    super.initState();
    _cooperativaController.findAll().then((value) =>
        _addPontosCooperativa(value));
  }

  void _addPontosCooperativa(List<Cooperativa> cooperativas) {
    _cooperativas = cooperativas;
    for (final e in cooperativas) {
      _markers.add(
          Marker(
            point: LatLng(e.latitude, e.longitude),
            width: _markerSize,
            height: _markerSize,
            builder: (_) => Icon(Icons.location_on, size: _markerSize),
            anchorPos: AnchorPos.align(AnchorAlign.top),
          )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: new MapOptions(
        zoom: 15.0,
        center: LatLng(-15.7801, -47.9292),
        plugins: [PopupMarkerPlugin()],
        onTap: (_) =>
            _popupLayerController
                .hidePopup(), // Hide popup when the map is tapped.
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
          subdomains: ['a', 'b', 'c'],
        ),
        PopupMarkerLayerOptions(
          markers: _markers,
          popupSnap: PopupSnap.top,
          popupController: _popupLayerController,
          popupBuilder: (BuildContext _, Marker marker) => Popup(marker,
              _cooperativas.singleWhere((e) => e.longitude ==
                  marker.point.longitude &&
                  e.latitude == marker.point.latitude)),
        ),
      ],
    );
  }
}
