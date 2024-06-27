import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(Nearby());
}

class Nearby extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nearby Police Stations',
      home: MapScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;

  final LatLng _initialLocation = const LatLng(30.7333, 76.7794);

  final List<Marker> _markers = [];

  @override
  void initState() {
    super.initState();
    _markers.add(
      Marker(
        markerId: MarkerId('id'),

        position: _initialLocation,
        infoWindow: InfoWindow(
          title: 'Chandigarh',
          snippet: 'Sample Marker',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nearby Police Stations'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _initialLocation,
          zoom: 12.0,
        ),
        markers: Set.from(_markers),
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
      ),
    );
  }
}
