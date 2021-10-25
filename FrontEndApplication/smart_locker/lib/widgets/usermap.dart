import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_locker/service/dataservice.dart';

class UserMap extends StatefulWidget {
  final int index;
  const UserMap({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  _UserMapState createState() => _UserMapState();
}

class _UserMapState extends State<UserMap> {
  // function for Acceessing Location
  LocationData? currentLocation;
  bool _userlocationready = false;
  bool _allowService = true;
  // Function for Build Map
  bool _mapLoading = true;

  void _getCurrentPosition() async {
    setState(() {
      _mapLoading = true;
      _allowService = true;
      _userlocationready = false;
    });
    Location location = new Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        Fluttertoast.showToast(msg: "Location Permission is denied");
        setState(() {
          _allowService = false;
        });
        return;
      }
    }

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        Fluttertoast.showToast(msg: "Please Keep your location on");
        setState(() {
          _allowService = false;
        });
        return;
      }
    }

    _locationData = await location.getLocation();
    setState(() {
      currentLocation = _locationData;
      _userlocationready = true;
      _allowService = true;
    });
  }
  //---------------------------------------------

  Set<Marker> _markers = {};
  BitmapDescriptor mapMarker = BitmapDescriptor.defaultMarker;

  void setCustomMarker() async {
    // Custom marcker can use here
    mapMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/LockerBlue.png');
    //mapMarker = await BitmapDescriptor.defaultMarker;
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      // Can fetch from a api and update the _markers
      _markers.add(
        Marker(
          markerId: MarkerId(
              DataService.userLockers[widget.index].LocationID.toString()),
          position: LatLng(
            double.parse(
                DataService.userLockers[widget.index].Latitude.toString()),
            double.parse(
                DataService.userLockers[widget.index].Longitude.toString()),
          ),
          infoWindow: InfoWindow(
              title: DataService.userLockers[widget.index].LocationDescription),
          icon: mapMarker,
          // An ontap function can implement here
        ),
      );

      _mapLoading = false;
    });
  }
  //-----------------------------------------

  @override
  void initState() {
    super.initState();
    setCustomMarker();
    _getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          (_userlocationready && _allowService)
              ? GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(currentLocation!.latitude!.toDouble(),
                        currentLocation!.longitude!.toDouble()),
                    zoom: 17,
                  ),
                  onMapCreated: _onMapCreated,
                  markers: _markers,
                )
              : Container(),
          (_allowService == false)
              ? GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(7.252321246065113, 80.59256273092281),
                    zoom: 17,
                  ),
                  onMapCreated: _onMapCreated,
                  markers: _markers,
                )
              : Container(),
          (_mapLoading)
              ? Container(
                  color: Colors.grey[100],
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
