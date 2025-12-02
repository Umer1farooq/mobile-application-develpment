import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../services/location_service.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;
  LatLng? _current;
  final loc = LocationService();

  @override
  void initState() {
    super.initState();
    _loc();
  }

  void _loc() async {
    try {
      final pos = await loc.getCurrentLocation();
      setState(() => _current = LatLng(pos.latitude, pos.longitude));
      mapController?.animateCamera(CameraUpdate.newLatLngZoom(_current!, 16));
    } catch (e) {
      // show error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Live Map')),
      body: _current == null
          ? Center(child: CircularProgressIndicator())
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _current!,
                zoom: 16,
              ),
              myLocationEnabled: true,
              onMapCreated: (c) => mapController = c,
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.my_location),
        onPressed: _loc,
      ),
    );
  }
}
