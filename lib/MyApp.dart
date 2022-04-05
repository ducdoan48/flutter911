import 'package:flutter/material.dart';
//Mỗi "stateful Widget" đc tạo thành từ 2 class sau: 1 "public" class kt từ SW + 1 "private" class để vẽ giao diện qua hàm build
class MyApp extends StatelessWidget {//tĩnh
  
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
     'Công Ty TNHH Zensho Hà Nội System Center, Mã số thuế: 0109140291, Địa chỉ: Tầng 4, Toà nhà Trung Tâm Sáng Tạo 3D Việt Nam, Số 3 Phố Duy, Phường Dịch Vọng ...',
   softWrap: true,
  ),
);


Widget _buildCard() {
  return SizedBox(
    height: 210,
    child: Card(
      child: Column(
        children: [
          ListTile(
            title: const Text(
              '03 Duy Tân',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: const Text('Bắc Từ Liêm, Hà Nội'),
            leading: Icon(
              Icons.restaurant_menu,
              color: Colors.blue[500],
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text(
              '(408) 555-1212',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            leading: Icon(
              Icons.contact_phone,
              color: Colors.blue[500],
            ),
          ),
          ListTile(
            title: const Text('zensho@gmail.com'),
            leading: Icon(
              Icons.contact_mail,
              color: Colors.blue[500],
            ),
          ),
        ],
      ),
    ),
  );
}
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
      title: 'Layout Demo',
      home: Scaffold(
        appBar: AppBar(
           actions: <Widget>[  
          IconButton(icon: Icon(Icons.camera_alt), onPressed: () => {}),  
          IconButton(icon: Icon(Icons.account_circle), onPressed: () => {})  
        ],  
        
        title: const Text('Layout Demo')),
        
        body:  ListView(
            children: [
            Image.asset('images/1.jpg', width: 10000,height:200),
              
              titleSection(),
              
           
              buttonSection,   
              textSection,
              _buildCard(),
               MyStatefulWidget(),
                      
               
         
             ],
          ) ,
           floatingActionButton: FloatingActionButton(  
        child: Icon(Icons.navigation),  
        backgroundColor: Colors.green,  
        foregroundColor: Colors.white,  
        onPressed: () => {},  
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
                'Oeschinen Lake Campground',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
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

