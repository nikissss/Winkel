import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class OrderTrackingMap extends StatefulWidget {
  const OrderTrackingMap({super.key});

  @override
  State<OrderTrackingMap> createState() => _OrderTrackingMapState();
}

class _OrderTrackingMapState extends State<OrderTrackingMap> {
  // Sample delivery route coordinates
  final List<LatLng> deliveryRoute = [
    LatLng(27.6925, 85.3440), // Starting point: Tinkune
    LatLng(27.6600, 85.4300), // Waypoint 1 (example point in between)
    LatLng(27.6295, 85.5267), // Destination: Dhulikhel
  ];

  // Initialize current position to the starting point (Tinkune)
  late LatLng currentPosition = deliveryRoute.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Tracking'),
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: currentPosition,
          initialZoom: 11.0, // Adjusted zoom to better show the route
        ),
        children: [
          // Base map layer
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
          // Polyline layer for delivery route
          PolylineLayer(
            polylines: [
              Polyline(
                points: deliveryRoute,
                strokeWidth: 4.0,
                color: Colors.blue,
              ),
            ],
          ),
          // Markers layer
          MarkerLayer(
            markers: [
              // Starting point marker
              buildMarker(
                deliveryRoute.first,
                Icons.store,
                Colors.green,
              ),
              // Destination marker
              buildMarker(
                deliveryRoute.last,
                Icons.location_on,
                Colors.red,
              ),
              // Current position marker
              buildMarker(
                currentPosition,
                Icons.delivery_dining,
                Colors.blue,
                showCircle: true,
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _simulateMovement,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }

  // Helper method to build markers
  CustomMarker buildMarker(LatLng point, IconData icon, Color color,
      {bool showCircle = false}) {
    return CustomMarker(
      point: point,
      child: SizedBox(
        width: 40,
        height: 40,
        child: Stack(
          children: [
            if (showCircle)
              Container(
                decoration: BoxDecoration(
                  color: color.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
              ),
            Center(
              child: Icon(
                icon,
                color: color,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _simulateMovement() {
    // Simple simulation of delivery movement along the route
    int currentIndex = deliveryRoute.indexOf(currentPosition);
    if (currentIndex < deliveryRoute.length - 1) {
      setState(() {
        currentPosition = deliveryRoute[currentIndex + 1];
      });
    }
  }
}

// Custom marker class
class CustomMarker extends Marker {
  CustomMarker({
    required LatLng point,
    required Widget child,
  }) : super(
          width: 40,
          height: 40,
          point: point,
          child: child,
        );
}
