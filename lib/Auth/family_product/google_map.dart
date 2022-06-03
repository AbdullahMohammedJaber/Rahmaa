import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rahmaa/Data/famileCubit/family_cubit.dart';

class GoogleMapScreen extends StatefulWidget {
  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  Completer<GoogleMapController> _controller = Completer();
  var markers = HashSet<Marker>();
  @override
  void initState() {
    FamilyCubit.get(context).getCurrentLocation();

    super.initState();
    FamilyCubit.get(context).getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FamilyCubit, FamilyState>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        body: state is GetCurrentPossetionLoacationLoaded
            ? Center(
                child: CircularProgressIndicator(),
              )
            : GoogleMap(
                mapType: MapType.hybrid,
                initialCameraPosition: CameraPosition(
                  target: LatLng(FamilyCubit.get(context).loca.lat,
                      FamilyCubit.get(context).loca.long),
                  zoom: 18,
                ),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                  setState(() {
                    markers.add(
                      Marker(
                        markerId: MarkerId("1"),
                        position: LatLng(FamilyCubit.get(context).loca.lat,
                            FamilyCubit.get(context).loca.long),
                      ),
                    );
                  });
                },
                markers: markers,
              ),
      ),
    );
  }
}
