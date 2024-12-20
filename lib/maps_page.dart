import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  double latitude = -6.3577933564756774;
  double longitude = 107.29472638260857;
  double zoomLevel = 13;
  final MapController _mapController = MapController();

  LatLng currentCenter = LatLng(-6.3577933564756774, 107.29472638260857);

  Widget test() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Maps"),
      ),
      body: Container(
        width: double.infinity,
        child: FlutterMap(
          options: MapOptions(
            initialZoom: zoomLevel,
            initialCenter: LatLng(latitude, longitude),
            // onPositionChanged: (position, hasGesture) {
            //   if (position != null && position.center != null) {
            //     setState(() {
            //       currentCenter = position.center!;
            //     });
            //   }
            // },
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.app',
            ),
            MarkerLayer(
              markers: [
                Marker(
                    point: LatLng(latitude, longitude),
                    child: const Icon(
                      Icons.man_3_sharp,
                      color: Colors.red,
                      size: 32,
                    ))
              ],
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: Column(
                children: [
                  FloatingActionButton(
                    heroTag: "zoom_in",
                    mini: true,
                    onPressed: () {
                      setState(() {
                        zoomLevel += 1;
                        _mapController.move(
                          currentCenter,
                          zoomLevel,
                        );
                      });
                    },
                    child: const Icon(Icons.zoom_in),
                  ),
                  const SizedBox(height: 10),
                  FloatingActionButton(
                    heroTag: "zoom_out",
                    mini: true,
                    onPressed: () {
                      setState(() {
                        zoomLevel -= 1;
                        _mapController.move(
                          currentCenter,
                          zoomLevel,
                        );
                      });
                    },
                    child: const Icon(Icons.zoom_out),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
