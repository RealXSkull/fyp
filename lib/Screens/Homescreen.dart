// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names, prefer_final_fields, unnecessary_new, use_key_in_widget_constructors, avoid_print, non_constant_identifier_names, sized_box_for_whitespace, must_call_super, unnecessary_import, depend_on_referenced_packages, dead_code, unnecessary_null_comparison, prefer_conditional_assignment

// import 'package:fyp/LoginScreen.dart';
// import 'package:fluttertoast/fluttertoast.dart';

import 'package:card_swiper/card_swiper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fyp/Controllers/data_controller.dart';
import 'package:fyp/Screens/SearchScreen.dart';
import 'package:fyp/Screens/inventory.dart';
import '../classes/CardItem.dart';
import 'package:fyp/Bars/NavBar.dart';
import '../classes/images.dart';
import 'package:get/get.dart';
import '../classes/global.dart' as global;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class HomePage {
  String title;
  String icon;
  Color color;
  Function func;
  HomePage(this.title, this.icon, this.color, this.func);
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    fetchimage();
  }

  final data_controller controller = Get.put(data_controller());

  final user = FirebaseAuth.instance.currentUser!;

  TextEditingController SearchController = TextEditingController();
  String name = "";
  List<CardItem> item = [
    CardItem(
        image: 'assets/icons/all_icon.jpg', Title: 'ALL', Subtitle: '\$100'),
    CardItem(
        image: 'assets/icons/all_icon.jpg', Title: 'ALL', Subtitle: '\$100'),
    CardItem(
        image: 'assets/icons/all_icon.jpg', Title: 'ALL', Subtitle: '\$100'),
    CardItem(
        image: 'assets/icons/all_icon.jpg', Title: 'ALL', Subtitle: '\$100'),
    CardItem(
        image: 'assets/icons/all_icon.jpg', Title: 'ALL', Subtitle: '\$100'),
    CardItem(
        image: 'assets/icons/all_icon.jpg', Title: 'ALL', Subtitle: '\$100'),
  ];

  Widget Searchbar() {
    return Container(
      height: 40,
      alignment: Alignment.center,
      color: Colors.red,
      child: TextFormField(
        controller: SearchController,
        decoration: InputDecoration(
            suffixIcon: Icon(Icons.search),
            filled: true,
            fillColor: Colors.white,
            hintText: 'Search Anything..',
            hintStyle: TextStyle(color: Colors.grey)),
        textInputAction: TextInputAction.search,
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SearchScreen()));
        },
      ),
    );
  }

  Widget invoscreenbtn() {
    return Container(
      height: 40,
      width: double.infinity,
      child: ElevatedButton.icon(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlue),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ))),
        label: Text('update invo'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const inventory()),
          );
        },
        icon: Icon(
          Icons.lock,
          size: 24,
        ),
      ),
    );
  }

  List<int> data = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1];
  Widget Buildcards(CardItem item) => Container(
        width: 200,
        child: Column(
          children: [
            Expanded(
                child: AspectRatio(
              aspectRatio: 4 / 3,
              child: Image.asset(
                item.image,
                fit: BoxFit.cover,
              ),
            )),
            Text(
              item.Title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              item.Subtitle,
              style: TextStyle(
                fontSize: 12,
              ),
            )
          ],
        ),
      );

  Widget builditemlist(BuildContext context, int index) {
    return SizedBox(
      width: 300,
      height: 250,
      child: Card(
        margin: EdgeInsets.all(12),
        elevation: 8,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Column(
            children: [
              Text('All'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Text('\$cos'),
                  Expanded(
                    child: Image.asset(
                      'assets/icons/all_icon.jpg',
                      width: 150,
                      height: 210,
                      fit: BoxFit.fill,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Map> categories = [
    {'Name': 'All', 'iconpath': 'assets/icons/all_icon.jpg'},
    {'Name': 'Ram', 'iconpath': 'assets/icons/all_icon.png'},
    // {'Name': 'PSU', 'iconpath': 'assets/icons/all_icon.png'},
    // {'Name': 'GPU', 'iconpath': 'assets/icons/all_icon.png'},
    // {'Name': 'Processor', 'iconpath': 'assets/icons/all_icon.png'},
    // {'Name': 'Storage', 'iconpath': 'assets/icons/all_icon.png'},
  ];

  int maxLength = 11;
  String contactno = "";
  bool obscureTextt = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      drawer: NavBar(),
      appBar: AppBar(
        title: Text('Home Page'),
        backgroundColor: Color.fromARGB(255, 48, 10, 55),
        actions: [
          IconButton(
            onPressed: () {
              // _PickFile();
            },
            icon: Image.asset(
              'assets/shopping-cart.png',
              width: 26,
            ),
          )
        ],
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color.fromARGB(255, 17, 7, 150),
                    Color.fromARGB(255, 106, 5, 5)
                  ])),
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Searchbar(),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Text(
                          "Categories",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        AspectRatio(
                          aspectRatio: 6 / 3,
                          child: Swiper(
                            autoplay: true,
                            // itemWidth: 250,
                            itemCount: cards.length,
                            itemBuilder: (context, index) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image(
                                  image: AssetImage(cards[index]),
                                  fit: BoxFit.fill,
                                ),
                              );
                              OnTap(index) {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => Review()));
                              }
                            },
                            viewportFraction: 0.8,
                            scale: 0.8,
                            pagination: SwiperPagination(),
                            // layout: SwiperLayout.STACK,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        invoscreenbtn(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  fetchimage() async {
    final ref =
        FirebaseStorage.instance.ref().child("DisplayPicture").child(user.uid);
    global.url = await ref.getDownloadURL();

    if (global.url.isEmpty) {
      global.url =
          "https://firebasestorage.googleapis.com/v0/b/pc-builder-2c0a4.appspot.com/o/DisplayPicture%2Fdefaultimage.jpg?alt=media&token=af41bdaf-f5f4-4f0d-ad96-78734f8eb73a";
    }
    // print(" this is done ${global.topUserPostsRef}");
    // print(global.url);
    // print(user.uid);
  }
}
