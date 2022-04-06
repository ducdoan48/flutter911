import 'package:flutter/material.dart';
class FlutterFormDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   final appTile = 'Flutter Form Demo';
   return MaterialApp(//
     title: appTile,
     home: Scaffold(
       appBar: AppBar(
         title: Text(appTile),
       ),
       body: MyCustomForm(),

     ),

   );

    
  }
}

class MyCustomForm extends StatefulWidget {  
  @override  
  MyCustomFormState createState() {  
    return MyCustomFormState();  
  }  
}  
class MyCustomFormState extends State<MyCustomForm> {  
  // Create a global key that uniquely identifies the Form widget  
  // and allows validation of the form.  
  final _formKey = GlobalKey<FormState>();  //khóa toàn cục, giữ một FormState và có thể sử dụng để truy xuất widget biểu mẫu
  
  @override  
  Widget build(BuildContext context) {  
    // Build a Form widget using the _formKey created above.  
    return Center(
      child :Container(
    width: 300,
             height: 300,
      child: Form(  
      key: _formKey,  
      child: Column(  
        crossAxisAlignment: CrossAxisAlignment.center,  
        children: <Widget>[  
          TextFormField(  
            decoration: const InputDecoration(// InputDecoration:cung cấp các trường biểu mẫu  
              icon: const Icon(Icons.person),  
              hintText: 'Enter your name',  
              labelText: 'Name',  
            ),  
            
          ),  
          TextFormField(  
            decoration: const InputDecoration(  
              icon: const Icon(Icons.phone),  
              hintText: 'Enter a phone number',  
              labelText: 'Phone',  
            ),  
          ),  
          TextFormField(  
            decoration: const InputDecoration(  
            icon: const Icon(Icons.calendar_today),  
            hintText: 'Enter your date of birth',  
            labelText: 'Dob',  
            ),  
           ),  
          Center(child: Container(
              padding: const EdgeInsets.only( top: 40.0),  
              
              child: RaisedButton(  
                child: const Text('Submit',
                style: TextStyle(color: Colors.white)),  
                  onPressed: () =>{}, 
                  color: Colors.blue, 
                
                
                
                  
                  
              )
          ),),  
        ],  
      ),  
    )  
    )
    );
  }  
} 