import 'package:craftui/constants/apptheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../services/locationService.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  late Future<String?> locationFuture;
  String? location;

  @override
  void initState() {
    super.initState();
    locationFuture = fetchUserLocation();
  }

  Future<String?> fetchUserLocation() async {
    final locationService = LocationService();
    final userCity = await locationService.getUserCity();
    setState(() {
      location = userCity ?? 'Unknown';
    });
    return location;
  }

  @override
  Widget build(BuildContext context) {
    final apptheme = AppTheme();

    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 24),
                child: Text(
                  'Hi, Monica!',
                  style: apptheme.appfonttheme(
                    fontWeight: FontWeight.w400,
                    fontSize: 22,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // Put the Watch video and The location in their places
                children: [
                  const Expanded(
                    flex: 2,
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Text("Test"),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 24),
                          child: Opacity(
                            opacity: 0.8,
                            child: Text(
                              'Current location',
                              style: apptheme.appfonttheme(
                                fontWeight: FontWeight.w300,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 24),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                  'assets/icons/location-marker.svg'),
                              FutureBuilder<String?>(
                                future: locationFuture,
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const SizedBox(
                                        height: 10,
                                        width: 10,
                                        child: CircularProgressIndicator());
                                  } else if (snapshot.hasError) {
                                    return const Text(
                                        'Error retrieving location');
                                  } else {
                                    final locationData = snapshot.data;
                                    return Text(
                                      ' $locationData',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
