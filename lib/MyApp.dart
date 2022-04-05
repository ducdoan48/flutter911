import 'package:flutter/material.dart';
//Mỗi "stateful Widget" đc tạo thành từ 2 class sau: 1 "public" class kt từ SW + 1 "private" class để vẽ giao diện qua hàm build
class MyApp extends StatefulWidget {
 
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
    
  }
}

//Expanded: mở rộng ko gian theo phương ngang
class _MyAppState extends State<MyApp> {
  
  bool _isFavorited = true;
  int _favoriteCount = 41;

Widget textSection = const Padding(
  padding: EdgeInsets.all(32),
  child: Text(
    'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
    'Alps. Situated 1,578 meters above sea level, it is one of the '
    'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
    'half-hour walk through pastures and pine forest, leads you to the '
    'lake, which warms to 20 degrees Celsius in the summer. Activities '
    'enjoyed here include rowing, and riding the summer toboggan run.',
    softWrap: true,
  ),
);
Widget titleSection = Container(
  padding : const EdgeInsets.all(32),
  
  child: Row( //tạo 1 hàng
    children: [
     
    Expanded(
        child: Column(//tạo 1 cột
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom:8), //khoảng cách với bên dưới nó
              child: const Text('Oeschinen Lake Campground', 
              style: TextStyle(fontWeight: FontWeight.bold),

           ),
            ),
            Text(
              'Kandersteg, Switzerland',
              style: TextStyle(
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
      /*3*/
      Icon(
        Icons.star,
        color: Colors.red[500],
      ),
      const Text('911'),
    ],
  ),
);
 
  @override
  Widget build(BuildContext context) {
   Color color = Theme.of(context).primaryColor;
   
//Từng button 1
Widget buttonSection = Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,//MainAxisAlignment.spaceEvenly: chia đều ko gian giữa các button
  children: [
    _buildButtonColumn(color, Icons.call, 'CALL'),
    _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
    _buildButtonColumn(color, Icons.share, 'SHARE'),
  ],
);
    return MaterialApp(
      title : 'Flutter layout demo',
      
      home: Scaffold(
        appBar: AppBar(
          title : const Text('Flutter layout demo'),
        
         ),
         body:  ListView(
             children: [
             Image.asset('images/1.jpg', width: 10000,height:200),

               titleSection,
               buttonSection,
               textSection,
             ],
           ) ,
           )
          
        
      );
  }
  //tạo 1 cái chung cho cả 3 button
  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,//min :Column sẽ có một chiều cao vừa đủ cho tất cả các widget con của nó.
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
  
}


