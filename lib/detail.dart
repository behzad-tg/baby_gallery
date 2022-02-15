import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

// class DetailPage extends StatefulWidget {
//   final String image;
//   final String title;
//   const DetailPage({ Key? key, required this.image, required this.title }) : super(key: key);

//   @override
//   _DetailPageState createState() => _DetailPageState();
// }

// class _DetailPageState extends State<DetailPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
      
//     );
//   }
// }
List<dynamic> commentList = [
    {
      'replay' : false,
      'profile' : 'https://www.citygorentalsmalta.com/wp-content/uploads/2021/04/istockphoto-531547724-612x612-1.jpg',
      'name' : 'Tom Simon',
      'comment' : 'this pictor is beautiful.'
    },
    {
      'replay' : true,
      'profile' : 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/face-wash-2-1561136582.jpg?resize=480:*',
      'name' : 'Sara Johanson',
      'comment' : 'thanks'
    },
    {
      'replay' : false,
      'profile' : 'https://image.freepik.com/free-photo/headshot-dark-skinned-male-with-serious-expression_273609-28350.jpg',
      'name' : 'Mohammad Saber',
      'comment' : 'soo nice.'
    },
    {
      'replay' : false,
      'profile' : 'https://static-bebeautiful-in.unileverservices.com/Unlock-flawless-skin_MobileHomeFeature.jpg',
      'name' : 'Sonia Camen',
      'comment' : 'you are a good mom.'
    },
    {
      'replay' : true,
      'profile' : 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/face-wash-2-1561136582.jpg?resize=480:*',
      'name' : 'Sara Johanson',
      'comment' : 'thanks'
    }
  ];

class DetailPage extends StatelessWidget {
  final String image;
  final String title;
  final int heroIndex;
  const DetailPage({ Key? key, required this.image, required this.title, required this.heroIndex }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 0),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      constraints: const BoxConstraints(),
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      onPressed: ()=> Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back,color: Colors.black,
                      
                      )
                    )
                  ],
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: Hero(
                    tag: 'img$heroIndex',
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: image,
                      fit: BoxFit.cover,
                    ),
                  )
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: const[
                      Icon(Icons.favorite,color: Colors.red,size: 30),
                      SizedBox(width: 5),
                      Text('1.4k',style: TextStyle(fontSize: 12)),
                      SizedBox(width: 20),
                      Icon(Icons.mode_comment,color: Colors.blue,size: 25),
                      SizedBox(width: 5),
                      Text('20',style: TextStyle(fontSize: 12)),
                      SizedBox(width: 20),
                      Icon(Icons.remove_red_eye,color: Colors.grey,size: 25),
                      SizedBox(width: 5),
                      Text('2.5k',style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const Text(
                        '2020/07/10',
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'In life, it just doesn’t get much happier than the arrival of a new baby. One moment, there is simply the dream of this unknown, but already-loved person. The next moment—Waaaaaah! Here he is, old-soul eyes blinking in the sudden light. Here she is, tiny clenched fists still holding tight to the wonder of the place she’s just come from…',
                      style: TextStyle(
                        color: Colors.black,
                        
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    comments(commentList[0]['replay'],'assets/images/men1.jpg',commentList[0]['name'],commentList[0]['comment']),
                    comments(commentList[1]['replay'],'assets/images/women1.jpg',commentList[1]['name'],commentList[1]['comment']),
                    comments(commentList[2]['replay'],'assets/images/women2.jpg',commentList[2]['name'],commentList[2]['comment']),
                    comments(commentList[3]['replay'],'assets/images/men2.jpg',commentList[3]['name'],commentList[3]['comment']),
                    comments(commentList[4]['replay'],'assets/images/women1.jpg',commentList[4]['name'],commentList[4]['comment']),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container comments(bool replay,String profile, String name, String comment) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: EdgeInsets.only(
        bottom: 5,
        left: replay ? 40 : 0,
      ),
      decoration:  BoxDecoration(
        color: Colors.grey[200],
        borderRadius: const BorderRadius.all(Radius.circular(10))
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 30,
            height: 30,
            child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: Image.asset(
              profile,
              fit: BoxFit.cover,
            ),
            )
          ),
          const SizedBox(width: 5),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                Text(comment,style: const TextStyle(color: Colors.black54)),
                const SizedBox(height: 10),
                Row(
                  children: const [
                    Text('like',style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(width: 15),
                    Text('reply',style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}