import 'package:carousel_slider/carousel_slider.dart';

import 'package:craftui/components/card.dart';
import 'package:craftui/components/custombottomnav.dart';
import 'package:craftui/components/halfinoutcard.dart';
import 'package:craftui/components/leftcard.dart';
import 'package:craftui/components/rightcard.dart';
import 'package:craftui/components/searchbar.dart';
import 'package:craftui/components/servicescard.dart';
import 'package:craftui/components/simplecolumnimage.dart';
import 'package:craftui/constants/appDimensions.dart';
import 'package:craftui/constants/apptheme.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../services/locationService.dart';

//Why Am I making one big component because it saves me time to finish this Assignment Refactor them will be future wor

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  late Future<String?> locationFuture;
  String? location;
  late Future<String?> displayNameFuture;
  @override
  void initState() {
    super.initState();
    locationFuture = fetchUserLocation(); //Fetch Location from the start
    displayNameFuture = retrieveDisplayName(); //Also fetch the display name
  }

  Future<String?> retrieveDisplayName() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      await currentUser.reload(); // Refresh user data from Firebase
      currentUser = FirebaseAuth.instance.currentUser; // Get updated user data
      return currentUser?.displayName;
    }
    return null;
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
      bottomNavigationBar: const CustomBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        onPressed: () {
          // Handle the button press here
        },
        child: Image.asset('assets/icons/Logo__2_-removebg-preview.png'),
      ),
      body: Container(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: const EdgeInsets.only(left: 24),
                      child: FutureBuilder<String?>(
                          future: displayNameFuture,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Container(
                                color: Colors.brown,
                              );
                            } else if (snapshot.hasError) {
                              return Text(
                                  'Error: ${snapshot.error}'); // Show an error message if there was an error
                            } else {
                              final displayName = snapshot.data;
                              return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(left: 24),
                                      child: Text(
                                        'Hi, $displayName!',
                                        style: apptheme.appfonttheme(
                                          color: apptheme.splashscreenbg,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 22,
                                        ),
                                      ),
                                    ),
                                  ]);
                            }
                          })),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment
                        .end, // Put the Watch video and The location in their places
                    children: [
                      Expanded(
                        flex: 8,
                        child: Container(
                          margin: const EdgeInsets.only(top: 20, left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Opacity(
                                opacity: 0.8,
                                child: Text(
                                  'Current location',
                                  style: apptheme.appfonttheme(
                                    fontWeight: FontWeight.w300,
                                    color: apptheme.splashscreenbg,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Row(
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
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        //How it work button
                        flex: 3,
                        child: Column(children: [
                          Container(
                            margin: const EdgeInsets.only(top: 13, right: 15),
                            child: SvgPicture.asset("assets/icons/play.svg"),
                          ),
                          Container(
                            child: Text(
                              "How it works?",
                              style: apptheme.appfonttheme(
                                  fontWeight: FontWeight.w300, fontSize: 13),
                            ),
                          )
                        ]),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: CarouselSlider(
                      //Implemented Carousel Slider a Library refer for further usage
                      options: CarouselOptions(
                        aspectRatio: 13 / 5,
                        viewportFraction: 0.9,
                        initialPage: 0,
                        enableInfiniteScroll: false,
                        reverse: false,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        scrollDirection: Axis.horizontal,
                      ),
                      items: [
                        Stack(children: [
                          Container(
                            //First Checkbox
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.red,
                              image: const DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                      "assets/top-view-food-frame-with-copy-space.png")),
                            ),
                          ),
                          Positioned(
                            top: 15,
                            left: 12,
                            child: SizedBox(
                              width:
                                  165, // Set width as half of the available width
                              child: Text(
                                'Enjoy your first order, the taste of our delicious food!',
                                style: apptheme.appfonttheme(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                                textAlign: TextAlign.start,
                                softWrap: true,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 15,
                            left: 12,
                            child: DottedBorder(
                              dashPattern: const [5, 10],
                              color: const Color(0xFF7B7B7B),
                              borderPadding: EdgeInsets.zero,
                              child: ClipRRect(
                                child: Center(
                                  child: Container(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    margin: const EdgeInsets.only(top: 20),
                                    child: Text("FIRSTPLATE01",
                                        style: apptheme.appfonttheme(
                                          color: const Color(0xFFF7E5B7),
                                          letterSpacing: 2,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        )),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ]),
                        Stack(children: [
                          Container(
                            //First Checkbox
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.red,
                              image: const DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                      "assets/top-view-food-frame-with-copy-space.png")),
                            ),
                          ),
                          Positioned(
                            top: 15,
                            left: 12,
                            child: SizedBox(
                              width: 165,
                              child: Text(
                                'Enjoy your first order, the taste of our delicious food!',
                                style: apptheme.appfonttheme(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                                textAlign: TextAlign.start,
                                softWrap: true,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 15,
                            left: 12,
                            child: DottedBorder(
                              dashPattern: const [5, 10],
                              color: const Color(0xFF7B7B7B),
                              borderPadding: EdgeInsets.zero,
                              child: ClipRRect(
                                //ClipRRect cause It dosent work without it
                                child: Center(
                                  child: Container(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    margin: const EdgeInsets.only(top: 20),
                                    child: Text("FIRSTPLATE01",
                                        style: apptheme.appfonttheme(
                                          color: const Color(0xFFF7E5B7),
                                          letterSpacing: 2,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        )),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ]),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 0, 25, 0),
                    child: CustomSearchBar(
                      hintext: "Search food or events",
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, top: 25),
                    child: Text(
                      "Start Crafting",
                      style: apptheme.appfonttheme(
                          fontSize: 20, color: apptheme.splashscreenbg),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: SizedBox(
                            child: CustomCard(
                                //Custom card in Components
                                imageUrl:
                                    "assets/plate-food-with-different-dishes-including-chicken-rice-other-food 1.png",
                                text: "Default Platters"),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: CustomCard(
                              imageUrl:
                                  "assets/plate-food-with-different-dishes-including-chicken-rice-other-food 1.png",
                              text: "Craft your own design"),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(left: 5),
                          child: HalfInOutCard(
                              title: "Default Menu 1",
                              imageUrl:
                                  "assets/unsplash_Lv174o7fn7Y (2)-modified.png")),
                      Container(
                          child: HalfInOutCard(
                              title: "Default menu 2",
                              imageUrl:
                                  "assets/unsplash_Lv174o7fn7Y (2)-modified.png")),
                    ],
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 20, left: 20),
                      child: Text(
                        "Top Categories",
                        style: apptheme.appfonttheme(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    //Another Simple Image column
                    margin: const EdgeInsets.only(left: 10),
                    child: const SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: [
                        SimpleColumnImage(
                            imageUrl: "assets/image 36.png",
                            subtitle: "Starters"),
                        SimpleColumnImage(
                            imageUrl: "assets/cocktail-377960_1280.png",
                            subtitle: "Drinks"),
                        SimpleColumnImage(
                            imageUrl: "assets/image 29.png", subtitle: "Rice"),
                        SimpleColumnImage(
                            imageUrl: "assets/21251374_6316253.png",
                            subtitle: "Curry"),
                        SimpleColumnImage(
                            imageUrl: "assets/pngwing 1).png",
                            subtitle: "Starters"),
                      ]),
                    ),
                  ),
                  Container(
                    //Simple Row with Horzontal Scrolling
                    margin: const EdgeInsets.only(left: 20, top: 20, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Starters",
                          style: apptheme.appfonttheme(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                        Text("More Main Courses",
                            style: apptheme.appfonttheme(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: apptheme.splashscreenbg))
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width:
                                150, // Set a specific width for the CustomCard widget
                            child: CustomCard(
                              imageUrl:
                                  "assets/skewer-ge0fa720c7_1920 1 (1).png",
                              text: "Grilled Chicken",
                            ),
                          ),
                          const SizedBox(width: 20),
                          SizedBox(
                            width:
                                150, // Set a specific width for the CustomCard widget
                            child: CustomCard(
                              imageUrl:
                                  "assets/sweet-and-sour-pork-g648b845ef_1920 1 (1).png",
                              text: "Mashroom Fry",
                            ),
                          ),
                          const SizedBox(width: 20),
                          SizedBox(
                            width:
                                150, // Set a specific width for the CustomCard widget
                            child: CustomCard(
                              imageUrl:
                                  "assets/pakora-g016fcaf99_1920 1 (1).png",
                              text: "Veggies Fry",
                            ),
                          ),
                          const SizedBox(width: 20),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, top: 20, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Starters",
                          style: apptheme.appfonttheme(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                        Text("More Main Courses",
                            style: apptheme.appfonttheme(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: apptheme.splashscreenbg))
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width:
                                150, // Set a specific width for the CustomCard widget
                            child: CustomCard(
                              imageUrl:
                                  "assets/mario-raj-n1z3gc9gJ8I-unsplash 1.png",
                              text: "Biryani",
                            ),
                          ),
                          const SizedBox(width: 20),
                          SizedBox(
                            width:
                                150, // Set a specific width for the CustomCard widget
                            child: CustomCard(
                              imageUrl: "assets/dough-gee6359546_1920.png",
                              text: "Bread",
                            ),
                          ),
                          const SizedBox(width: 20),
                          SizedBox(
                            width:
                                150, // Set a specific width for the CustomCard widget
                            child: CustomCard(
                              imageUrl: "assets/rice-g960e2cdb7_1920 1 (1).png",
                              text: "Plain Rice",
                            ),
                          ),
                          const SizedBox(width: 20),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Services",
                      style: apptheme.appfonttheme(
                          fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(children: [
                          ServicesCard(
                            imageUrl:
                                "assets/pexels-cup-of-couple-8015154 1 (1).png",
                          ),
                          ServicesCard(
                            imageUrl: "assets/Mask group.png",
                          )
                        ])),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Text(
                      "How does it work",
                      style: apptheme.appfonttheme(
                          fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 24),
                    child: Column(children: [
                      RightCard(
                        imageUrl: 'assets/Group 739 (1).svg',
                        title: "Customize Menu",
                        subtitle:
                            "Select items for a single event or multiple events",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      LeftCard(
                        imageUrl: "assets/Group 2198 (1).svg",
                        title: "Choose Services",
                        subtitle:
                            "Select the type of services from varying cutlery, mode of serving options, & more",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RightCard(
                        imageUrl: 'assets/Frame 2270 (1).svg',
                        title: "Dynamic Pricing",
                        subtitle:
                            "Price per plate varies with no. of items in a plate and no. of plates selected",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      LeftCard(
                        imageUrl: "assets/Group 738 (1).svg",
                        title: "Track Your Order",
                        subtitle:
                            "Track the order status and seek help from the executives anytime",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RightCard(
                        imageUrl: 'assets/Frame 2271.svg',
                        title: "Taste Your Samples",
                        subtitle:
                            "Explode your taste bud with samples of what you order(on request for eligible orders)",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      LeftCard(
                        imageUrl: "assets/Frame 22711.svg",
                        title: "Enjoy Food and Services",
                        subtitle:
                            "Enjoy event with delicious and customized food",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ]),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, top: 30),
                    child: SizedBox(
                      width: AppDimensions.screenWidth(context) * 0.9,
                      height: 100,
                      child: Text(
                        "Delicious food with professional service !",
                        style: apptheme.appfonttheme(
                            fontSize: 25, fontWeight: FontWeight.w400),
                        softWrap: true,
                      ),
                    ),
                  )
                  //End here
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
