import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
// import 'package:mapbox_gl/mapbox_gl.dart';

class MapScreen extends StatelessWidget {
  // final CameraPosition _initialCameraPosition = const CameraPosition(
  // target: LatLng(10.5933788, 76.5975366),
  // zoom: 14.0,
  // );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapbox Map'),
      ),
      body: MapWidget(),
      // body: MapboxMap(
      //   accessToken: const String.fromEnvironment(
      //       "pk.eyJ1Ijoiaml0aGluamFuYXJkaGFuYW4iLCJhIjoiY202OHcweDV6MDZtbDJrcXRsdzdyNmpvbSJ9.2K69HselCgR9Dp85Wcn3oQ"), // Mapbox access token
      //   initialCameraPosition: _initialCameraPosition,
      //   myLocationEnabled: true, // Enable user's location
      //   compassEnabled: true, // Show compass
      //   zoomGesturesEnabled: true, // Allow zooming
      // ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:mapbox_gl/mapbox_gl.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:mapbox_turn_by_turn/screens/prepare_ride.dart';

// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   LatLng currentLocation = LatLng(0, 0); // Default location
//   String currentAddress = 'Loading...'; // Placeholder for the address
//   late CameraPosition _initialCameraPosition;

//   @override
//   void initState() {
//     super.initState();
//     fetchLocationAndAddress();
//   }

//   Future<void> fetchLocationAndAddress() async {
//     try {
//       // Replace 'locations' with your Firestore collection name
//       final DocumentSnapshot snapshot = await FirebaseFirestore.instance
//           .collection('locations')
//           .doc('user1')
//           .get();

//       if (snapshot.exists) {
//         final data = snapshot.data() as Map<String, dynamic>;
//         setState(() {
//           currentLocation = LatLng(data['latitude'], data['longitude']);
//           currentAddress = data['address'] ?? 'Unknown address';
//           _initialCameraPosition = CameraPosition(
//             target: currentLocation,
//             zoom: 14,
//           );
//         });
//       }
//     } catch (e) {
//       print('Error fetching location and address: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Mapbox Map
//           MapboxMap(
//             accessToken: dotenv.env['MAPBOX_ACCESS_TOKEN'],
//             initialCameraPosition: _initialCameraPosition,
//             myLocationEnabled: true,
//           ),
//           // Address and Button Card
//           Positioned(
//             bottom: 0,
//             child: SizedBox(
//               width: MediaQuery.of(context).size.width,
//               child: Card(
//                 clipBehavior: Clip.antiAlias,
//                 child: Padding(
//                   padding: const EdgeInsets.all(15),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       const Text('You are currently here:'),
//                       Text(
//                         currentAddress,
//                         style: const TextStyle(color: Colors.indigo),
//                       ),
//                       const SizedBox(height: 20),
//                       // ElevatedButton(
//                       //   onPressed: () => Navigator.push(
//                       //     context,
//                       //     MaterialPageRoute(
//                       //       builder: (_) => const PrepareRide(),
//                       //     ),
//                       //   ),
//                       //   style: ElevatedButton.styleFrom(
//                       //     padding: const EdgeInsets.all(20),
//                       //   ),
//                       //   child: Row(
//                       //     mainAxisAlignment: MainAxisAlignment.center,
//                       //     children: const [
//                       //       Text('Where do you wanna go today?'),
//                       //     ],
//                       //   ),
//                       // ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
