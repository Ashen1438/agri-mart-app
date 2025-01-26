import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderTrackingScreen extends StatefulWidget {
  const OrderTrackingScreen({super.key});

  @override
  State<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  late GoogleMapController mapController;

  // Initial position for the map
  final LatLng _initialPosition =
      const LatLng(6.98273, 81.07685); // Coordinates of uva wellassa univercity Badulla, Sri Lanka

  // Example delivery route
  final List<LatLng> _deliveryRoute = [
    const LatLng(6.9896, 81.0551), // Start point (Badulla)
    const LatLng(6.9946, 81.0491), // Midpoint
    const LatLng(6.9980, 81.0421), // Destination
  ];

  Set<Polyline> _createRoute() {
    return {
      Polyline(
        polylineId: const PolylineId("delivery_route"),
        points: _deliveryRoute,
        color: Colors.green,
        width: 5,
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "Order Tracking",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _initialPosition,
                zoom: 14,
              ),
              onMapCreated: (controller) {
                mapController = controller;
              },
              polylines: _createRoute(),
            ),
          ),
          Container(
            color: Colors.green.shade100,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Call and Message Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        // Handle call action
                      },
                      icon: const Icon(Icons.call),
                      label: const Text("Call"),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Handle message action
                      },
                      icon: const Icon(Icons.message),
                      label: const Text("Message"),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Status Steps
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatusStep("Order Received", isActive: true),
                    _buildStatusStep("On the Way", isActive: true),
                    _buildStatusStep("Delivered", isActive: false),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget for the status step
  Widget _buildStatusStep(String text, {required bool isActive}) {
    return Column(
      children: [
        CircleAvatar(
          radius: 12,
          backgroundColor: isActive ? Colors.green : Colors.grey,
          child: isActive
              ? const Icon(Icons.check, color: Colors.white, size: 16)
              : const SizedBox.shrink(),
        ),
        const SizedBox(height: 4),
        Text(
          text,
          style: TextStyle(
            color: isActive ? Colors.green : Colors.grey,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
