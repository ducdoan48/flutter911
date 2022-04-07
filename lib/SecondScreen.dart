import 'package:first_project/home.dart';
import 'package:flutter/material.dart';
import 'FlutterFormLogin.dart';

//Mỗi "stateful Widget" đc tạo thành từ 2 class sau: 1 "public" class kt từ SW + 1 "private" class để vẽ giao diện qua hàm build
class SecondScreen extends StatelessWidget {//tĩnh
  
  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
    
        Icon(icon , 
        color: color,),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
              
              
            ),
          ),
        ),
      ],
    );
  }
  
   Widget textSection = const Padding(
   padding: EdgeInsets.all(32),
  child: Text(
     'Mặt Trời chính là ngôi sao ở trung tâm Hệ Mặt Trời, chiếm khoảng 99,8% khối lượng của Hệ Mặt Trời. Trái Đất và các thiên thể khác như các hành tinh, tiểu hành tinh, thiên thạch, sao chổi, và bụi quay quanh',
   softWrap: true,
  ),
);



  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

Widget buttonSection = Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    _buildButtonColumn(color, Icons.call, 'CALL'),
    _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
    _buildButtonColumn(color, Icons.share, 'SHARE'),
  ],
);
    return MaterialApp(
      title: 'Sun Information',
      home: Scaffold(
        appBar: AppBar(
           actions: <Widget>[  
          IconButton(icon: Icon(Icons.camera_alt), onPressed: () => {}),  
          IconButton(icon: Icon(Icons.account_circle), onPressed: () => {})  
        ],  
        
        title: const Text('Layout Demo')),
        
        body:  ListView(
            children: [
            Image.asset('images/sunlight.jpg', width: 10000,height:200),
              
              titleSection(),
              
           
              buttonSection,   
              textSection,
             
               MyStatefulWidget(),
                      
               
         
             ],
          ) ,
           floatingActionButton: FloatingActionButton(  
        child: Icon(Icons.navigation),  
        backgroundColor: Colors.green,  
        foregroundColor: Colors.white,  
        onPressed: () => {
           Navigator.push(context,MaterialPageRoute(builder: (context) => FlutterFormLogin()),
  )
          
        },  
      ),
      ),
    );
  }
} 
class titleSection extends StatefulWidget {//động
 
  
  @override
  State<StatefulWidget> createState() {
    
    return _titleSection();
  }
}
class _titleSection extends State<titleSection>{
    bool _isFavorited = true;
  int _favoriteCount = 41;
      bool isChecked = false;
        Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

  @override
  Widget build(BuildContext context) {


    return Container(
  padding:  EdgeInsets.all(32),
  child: Row(
    children: [
      Expanded(
        /*1*/
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*2*/
            Container(
              padding:  EdgeInsets.only(bottom: 8),
              child:  Text(
                'Thông tin cần biết về mặt trời',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'Theo dõi đoạn text dưới đây:',
              style: TextStyle(
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
      /*3*/
      
        
        SizedBox(
         
            child: Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
          if(isChecked==true){
            _favoriteCount -= 1;
      _isFavorited = false;
          }
          else{
             _favoriteCount += 1;
      _isFavorited = true;
          }
        });
      },
    )
          ),
        
        
        SizedBox(
          width: 18,
          child: SizedBox(
            child: Text('$_favoriteCount'),
          ),
        
        ),

    ],
  ),
);
  }
}

enum SingingCharacter { lafayette, jefferson }

class MyStatefulWidget extends StatefulWidget {
  
  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  SingingCharacter? _character = SingingCharacter.lafayette;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Hữu ích'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.lafayette,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Không hữu ích'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.jefferson,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
      ],
    );
    
  }
  
}

