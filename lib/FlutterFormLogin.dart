import 'package:first_project/home.dart';
import 'package:flutter/material.dart';
import 'home.dart';

class FlutterFormLogin extends StatelessWidget{
//static final nameRoute = '/Login';
  @override
  Widget build(BuildContext context) {
  //final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
   final appTile = 'Flutter Form Login';
   return MaterialApp(//
     title: appTile,
     
      initialRoute: '/',
      routes: {
        // ExtractArgumentsScreen.routeName: (context) => //đăng kí 
        //     const ExtractArgumentsScreen(),
        // When navigating to the "/" route, build the FirstScreen widget.
        '/homepage': (context) =>  HomePage(),
        '/': (context) => _FlutterFormLogin(),
        // When navigating to the "/second" route, build the SecondScreen widget.
      
      },
      

   );

    
  }
}

class _FlutterFormLogin extends StatefulWidget {  
  @override  
  _FlutterFormLoginState createState() {  
    return _FlutterFormLoginState();  
  }  
}  
class _FlutterFormLoginState extends State<_FlutterFormLogin> {  
  bool _showPass = false;
  TextEditingController _userController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  var _userNameErr = "Tài khoản không hợp lệ";
  var _passErr = "Mật khẩu phải trên 6 kí tự ";
  var _userInvalid = false;
  var _passInvalid = false;

  @override  
  Widget build(BuildContext context) {  
    // Build a Form widget using the _formKey created above.  
    
    return Scaffold(
        body: Container(
          padding: EdgeInsets.fromLTRB(30, 100, 30, 0) ,
          constraints: BoxConstraints.expand(),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
              Padding(

                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Container(
                  width: 70,
                  height: 70,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffd8d8d8)),
                child: FlutterLogo()),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,0,0,60),
                child: Text(
                  "Hello\nWelcome Back", 
                style: TextStyle(
                  fontWeight: FontWeight.bold, 
                  color: Colors.black, 
                  fontSize: 30)
                  ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,0,0,40),
                child: TextField(
                  style:TextStyle(fontSize: 18, color: Colors.black),
                  controller: _userController,
                  decoration: InputDecoration(
                  labelText: "USERNAME",
                  errorText: _userInvalid ? _userNameErr : null,//nếu ko hợp lệ thì show errortext, còn hợp lệ thì = null (ko có tbao lỗi)
                  labelStyle: 
                    TextStyle(color: Colors.grey, fontSize: 20)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,0,0,40),
                child: Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: <Widget> [
                    TextField(
                      obscureText: !_showPass, //biến chữ thành *****
                      style:TextStyle(fontSize: 20, color: Colors.black),
                      controller: _passController,
                      decoration: InputDecoration(
                        errorText: _passInvalid ? _passErr : null,
                      
                      labelText: "PASSWORD",
                      labelStyle: 
                        TextStyle(color: Colors.grey, fontSize: 20)),
                    ),
                  GestureDetector(
                    onTap: onToggleShowPass,// hàm onToggleShowPass
                    child: Text(
                      _showPass ? "HIDE" : "SHOW", style: TextStyle(fontSize: 15, color:Colors.blue, fontWeight: FontWeight.bold)),
                  ),
                  
                  ] 
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,0,0,0,),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: RaisedButton(
                  shape:RoundedRectangleBorder (borderRadius: BorderRadius.all(Radius.circular(8))),//shape: hình dạng
                  color: Colors.blue,
                  onPressed: onSignInClicked,
                  
                  child: Text("SIGN IN", style: TextStyle(fontSize:20, fontWeight: FontWeight.bold, color: Colors.white)),
                 
                  ),
                ),
              ),
             Container(
                  width: double.infinity,
                  height: 130,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "NEW USER? SIGN UP", style: TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.bold)),
                        Text(
                        "FORGOT PASSWORD", style: TextStyle(color: Colors.blue, fontSize: 15, fontWeight: FontWeight.bold)),
                      ],
                  ),

                ),
            ],

          ),


          
        ),
    );
     
       
          

    
  }  
 
//fucntion
void onToggleShowPass (){
 setState(() {
   _showPass = !_showPass;
 });
}
void onSignInClicked (){
setState(() {
  if(_userController.text.length < 6 || !_userController.text.contains("@")){// nếu user nhập vào nhỏ hơn 6 hoặc ko có ki tự @ thì ko hợp lệ
    _userInvalid = true;

  }
  else{
    _userInvalid = false; // hợp lệ
  }
  
  if(_passController.text.length<6){
    _passInvalid = true;
  }
  else{
    _passInvalid = false;
  }


  if(!_userInvalid && !_passInvalid ){ // user hợp lệ và password hợp lệ
   Navigator.pushNamed(context, '/homepage',arguments: ScreenArguments(_userController.text));
   
    //Navigator.push(context, MaterialPageRoute(builder: gotoHome());
    
  }
});
}
// Widget gotoHome(BuildContext context){
//   return HomePage();
// }
}
class ScreenArguments {
  final String title;
  ScreenArguments(this.title);
}
// class ExtractArgumentsScreen extends StatelessWidget {
//   const ExtractArgumentsScreen({Key? key}) : super(key: key);

//   static const routeName = '/456';

//   @override
//   Widget build(BuildContext context) {
//     // Extract the arguments from the current ModalRoute
//     // settings and cast them as ScreenArguments.
//     final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(args.title),
//       ),
  
//     );
//   }
// }
