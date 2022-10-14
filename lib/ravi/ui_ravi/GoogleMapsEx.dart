import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:location/location.dart';

class GoogleMapsEx extends StatefulWidget {
  const GoogleMapsEx({super.key});

  @override
  State<GoogleMapsEx> createState() => _GoogleMapsExState();
}

class _GoogleMapsExState extends State<GoogleMapsEx> {
  //Completer<GoogleMapController> _controller = Completer();
  GoogleMapController? _controller;
  
  Location currentLocation = Location();
  Set<Marker> _markers={};


@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
        },
        markers: _markers,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: getLocation,
        label: Text('Current Location'),
        icon: Icon(Icons.gps_fixed),
      ),
    );;
  }

  void getLocation() async{
    var location = await currentLocation.getLocation();

    currentLocation.onLocationChanged.listen((LocationData loc){
      _controller?.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
        target: LatLng(loc.latitude ?? 0.0,loc.longitude?? 0.0),
        zoom: 19.151926040649414,
      )));
      print(loc.latitude);
      print(loc.longitude);
      _markers.add(Marker(markerId: MarkerId('Home'),
            position: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0)
        ));
      setState(() {
        
      });
       });
  }

  Future<void> _goToTheLake() async {
  //  final GoogleMapController controller = await _controller.future;
    _controller?.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}