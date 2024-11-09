//import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: FlutterSmartDialog.init(),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Future<void> requestPermission() async {
  //   final permission = Permission.location;
  //
  //   if (await permission.isDenied) {
  //     await permission.request();
  //   }
  // }
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   requestPermission();
  // }

  List<String> banner = [
    "https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Dulquer_Salmaan_at_Karwaan_promotions_%28cropped%29.jpg/330px-Dulquer_Salmaan_at_Karwaan_promotions_%28cropped%29.jpg",
  "https://gratisography.com/wp-content/uploads/2024/01/gratisography-cyber-kitty-800x525.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR16wLlveM8XGFPUk6dZ8MorrQDNeYTg0qiwA&s"
  ];//
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Permissions"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 240,
            child: PageView.builder(
              controller: controller,
              itemCount: banner.length,
              itemBuilder: (_, index) {
                return Container(
                  height: 230,
                  child: Image.network("${banner[index]}",fit: BoxFit.cover,),
                );
              },
            ),
          ),
          SmoothPageIndicator(
            controller: controller,
            count: banner.length,
            effect: const WormEffect(
              dotHeight: 16,
              dotWidth: 16,
              type: WormType.thinUnderground,
            ),
          ),
          // CarouselSlider.builder(
          //   itemCount: banner.length,
          //   itemBuilder:
          //       (BuildContext context, int itemIndex, int pageViewIndex) =>
          //           Container(
          //     child: Image.network(
          //       "${banner[itemIndex]}",
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          //   options: CarouselOptions(
          //     height: 400,
          //     aspectRatio: 16 / 9,
          //     viewportFraction: 0.8,
          //     initialPage: 0,
          //     enableInfiniteScroll: true,
          //     reverse: false,
          //     autoPlay: true,
          //     autoPlayInterval: Duration(seconds: 3),
          //     autoPlayAnimationDuration: Duration(milliseconds: 800),
          //     autoPlayCurve: Curves.fastOutSlowIn,
          //     enlargeCenterPage: true,
          //     enlargeFactor: 0.3,
          //     scrollDirection: Axis.horizontal,
          //   ),
          // )
          ElevatedButton(onPressed: () async {
            SmartDialog.showLoading();
            await Future.delayed(Duration(seconds: 5));
            SmartDialog.dismiss();
          }, child: Text("show smart")),
          ElevatedButton(onPressed: (){
            SmartDialog.show(builder: (context) {
              return Container(
                height: 80,
                width: 180,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Text('Loading', style: TextStyle(color: Colors.white)),
                  ],
                ),
              );
            });
          }, child: Text("loading"))
        ],
      ),
    );
  }
}
