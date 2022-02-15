// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:project1/animations.dart';
import 'package:project1/detail.dart';
import 'package:transparent_image/transparent_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // ignore: non_constant_identifier_names
  List<dynamic> babyGallery = [
    {
      'title' : 'Vew Born',
      'image' : 'http://yaffa-cdn.s3.amazonaws.com/yaffadsp/images/dmImage/StandardImage/Zahli_PotatoSack_Smile.jpg'
    },
    {
      'title' : 'Smaile',
      'image' : 'https://exploringyourmind.com/wp-content/uploads/2018/08/baby-smiling.jpg'
    },
    {
      'title' : 'Pregnant',
      'image' : 'https://www.oneindia.com/img/2021/01/3082417vnwkyva2-1611991498.jpg'
      // 'image' : 'https://devostock.com/static12/preview2/stock-photo-devostock-sleeping-baby-naked-nude-closed-eyes-4k-177013.jpg'
    },
    {
      'title' : 'Christmas',
      'image' : 'https://wallpapercave.com/wp/wp5129227.jpg'
    },
    {
      'title' : 'kid',
      'image' : 'https://image.freepik.com/free-photo/joyful-preteen-kid-with-curly-hair-laughing-camera-studio-shot-carefree-little-girl-isolated-pink-background_197531-13694.jpg'
    },
    
    {
      'title' : 'Bath',
      'image' : 'https://i.pinimg.com/originals/7f/ec/b3/7fecb305e5b44b83ee42e8fc4ba482ea.jpg'
    },
    {
      'title' : 'cut',
      'image' : 'https://wallpaperaccess.com/full/393929.jpg'
    },
    {
      'title' : 'foot',
      'image' : 'https://www.chronicle.co.zw/wp-content/uploads/sites/3/2014/06/Baby_Feet_2.jpg'
    },
    {
      'title' : 'sleepy',
      'image' : 'https://coolwallpapers.me/picsup/2744989-baby-4k-windows-hd-wallpaper-free-download.jpg'
    },
    {
      'title' : 'Mama',
      'image' : 'https://m.media-amazon.com/images/I/41tgo2ej39L.jpg'
    },
  ];

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'sans'
      ),
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              expandedHeight: 200,
              leading: const FadeAnimation(
                0,
                Icon(Icons.menu)
              ),
              actions: const [
                FadeAnimation(
                  0, 
                  Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Icon(Icons.notifications_rounded),
                ),
              )
              ],
              flexibleSpace: FlexibleSpaceBar( 
                background: FadeAnimation(
                  0,
                  Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(bottom: 30),
                  child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25)
                  ),
                  child: Image.asset('assets/images/baby.jpg',
                    fit: BoxFit.cover,
                    ),
                  ),
                ),
                ),
              ),
              
              bottom: AppBar(
                toolbarHeight: 70,
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                title: FadeAnimation(
                  0.1, 
                  Container(
                    margin: const EdgeInsets.only(left: 10,right: 10,bottom: 0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      boxShadow: [
                        BoxShadow(color: Colors.black26,offset: Offset(0, 7),blurRadius: 10,spreadRadius: -10)
                      ]
                    ),
                    child: Row(
                      children: const [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: 30),
                              border: InputBorder.none,
                              hintText: 'Search here',
                              hintStyle: TextStyle(color: Colors.black26),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 15),
                          child: Icon(Icons.search,color: Colors.black26,size: 25,),
                        )
                      ],
                    ),
                  ),
                )
              ),
            ),
            const SliverToBoxAdapter(
              child: FadeAnimation(
                0.2, 
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                  child: Text(
                    'All Categories',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    ),
                ),
              )
            ),
            SliverStaggeredGrid.countBuilder(
              crossAxisCount: 2,
              itemCount: babyGallery.length,
              staggeredTileBuilder: (index) {
                return StaggeredTile.count(1, index.isEven ? 1.6 : 1);
              },
              itemBuilder: (BuildContext context, int index){
                return FadeAnimation(
                  0.5, 
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>
                        DetailPage(
                          image: babyGallery[index]['image'],
                          title: babyGallery[index]['title'],
                          heroIndex: index
                        )));
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        boxShadow: [
                          BoxShadow(color: Colors.black26,offset: Offset(0, 7),blurRadius: 10,spreadRadius: -10)
                        ]
                      ),
                      child: Stack(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: double.infinity,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(20)),
                              child: Hero(
                                tag: 'img$index',
                                child: FadeInImage.memoryNetwork(
                                  placeholder: kTransparentImage,
                                  image: babyGallery[index]['image'],
                                  fit: BoxFit.cover,
                                  ),
                              )
                              )
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),topRight: Radius.circular(20)),
                              ),
                              child: Text(
                                babyGallery[index]['title'],
                                style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 15),
                                ),
                            )
                          )
                        ],
                      ),
                    ),
                  )
                );
              },
            )
          ],
        ),
      ),

    );
  }
}