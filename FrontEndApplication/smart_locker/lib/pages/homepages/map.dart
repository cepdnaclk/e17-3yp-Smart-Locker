import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Set<Marker> _markers = {};
  BitmapDescriptor mapMarker = BitmapDescriptor.defaultMarker;
  @override
  void initState() {
    super.initState();
    setCustomMarker();
  }

  void setCustomMarker() async {
    // Custom marcker can use here
    mapMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/LockerIcon.png');
    //mapMarker = await BitmapDescriptor.defaultMarker;
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      // Can fetch from a api and update the _markers
      _markers.add(
        Marker(
          markerId: MarkerId("id-1"),
          position: LatLng(7.252321246065113, 80.59256273092281),
          infoWindow: InfoWindow(title: "UoP Efac"),
          icon: mapMarker,
          // An ontap function can implement here
          onTap: () {
            Navigator.pushNamed(context, '/lockerlist');
          },
        ),
      );
      _markers.add(
        Marker(
          markerId: MarkerId("id-2"),
          position: LatLng(7.2633009032347084, 80.59304870962823),
          infoWindow: InfoWindow(title: "Peradeniya"),
          icon: mapMarker,
          onTap: () {
            Navigator.pushNamed(context, '/lockerlist');
          },
        ),
      );
    });
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
      body: Center(
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(7.252321246065113, 80.59256273092281),
            zoom: 16,
          ),
          onMapCreated: _onMapCreated,
          markers: _markers,
        ),
      ),
    );
  }
}
