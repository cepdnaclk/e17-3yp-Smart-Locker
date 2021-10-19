import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_locker/models/LocationsModel.dart';
import 'package:smart_locker/models/PurchasedLockersModel.dart';
import 'package:smart_locker/pages/purchase/lockerlist.dart';
import 'package:smart_locker/service/dataservice.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
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

  Future<http.Response> locationClick(String locationID) async {
    final String apiUrl = DataService.ip + "/api/mapclick/" + locationID;

    final response = await http.get(Uri.parse(apiUrl), headers: {
      "x-auth-token": DataService.jwt,
    });
    return response;
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      // Can fetch from a api and update the _markers
      List<LocationsModel> locations = DataService.user.locations!;
      locations.forEach((location) {
        _markers.add(
          Marker(
            markerId: MarkerId(location.LocationID!),
            position: LatLng(
              double.parse(location.Latitude!),
              double.parse(location.Longitude!),
            ),
            infoWindow: InfoWindow(title: location.LocationDescription),
            icon: mapMarker,
            onTap: () async {
              String? locationID = location.LocationID;
              final http.Response response = await locationClick(locationID!);
              if (response.statusCode == 200) {
                var r = json.decode(response.body);
                setState(() {
                  DataService.avilableLockers =
                      List<PurchasedLockersModel>.from(r["availableLockers"]
                          .map((model) =>
                              PurchasedLockersModel.fromJson(model)));
                });
              }
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (
                  context,
                ) =>
                        LockerList(
                          lockerList: DataService.avilableLockers,
                          location: location.LocationDescription!,
                        )),
              );
            },
          ),
        );
      });
      // _markers.add(
      //   Marker(
      //     markerId: MarkerId("id-1"),
      //     position: LatLng(7.252321246065113, 80.59256273092281),
      //     infoWindow: InfoWindow(title: "UoP Efac"),
      //     icon: mapMarker,
      //     // An ontap function can implement here
      //     onTap: () {
      //       Navigator.pushNamed(context, '/lockerlist');
      //     },
      //   ),
      // );
      // _markers.add(
      //   Marker(
      //     markerId: MarkerId("id-2"),
      //     position: LatLng(7.2633009032347084, 80.59304870962823),
      //     infoWindow: InfoWindow(title: "Peradeniya"),
      //     icon: mapMarker,
      //     onTap: () {
      //       Navigator.pushNamed(context, '/lockerlist');
      //     },
      //   ),
      // );
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
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Map',
          style: TextStyle(fontSize: 22, color: Colors.black87),
        ),
      ),
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
