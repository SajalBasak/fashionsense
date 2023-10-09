import 'package:fashionsense/const/app_colors.dart';
import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PickupPoints extends StatefulWidget {
  const PickupPoints({Key? key}) : super(key: key);

  @override
  _PickupPointsState createState() => _PickupPointsState();
}

class _PickupPointsState extends State<PickupPoints> {
  Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId('1'),
        position: LatLng(23.780041, 90.417346),
      ));
      _markers.add(Marker(
        markerId: MarkerId('2'),
        position: LatLng(23.764608, 90.404030),
      ));
      _markers.add(Marker(
        markerId: MarkerId('3'),
        position: LatLng(23.786041, 90.400497),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Our Pickup Points"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.kPrimaryColor,
        elevation: 0,
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        markers: _markers,
        initialCameraPosition: CameraPosition(
          target: LatLng(23.780041, 90.417346),
          zoom: 14,
        ),
      ),
    );
  }
}
