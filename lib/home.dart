import 'package:flutter/material.dart';
import 'SecondScreen.dart';
import 'FlutterFormLogin.dart';
  class HomePage extends StatelessWidget {
    //static final nameRoute = '/home';
      @override
      Widget build(BuildContext context) {
         final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
        return MaterialApp(
          title: 'ListViews',
          debugShowCheckedModeBanner: false,
          
          theme: ThemeData(
            primarySwatch: Colors.teal,
          ),
          home: Scaffold(
            appBar: AppBar(  
        title: Text(args.title),  
        backgroundColor: Colors.blue,  
        actions: <Widget>[  
          IconButton(icon: Icon(Icons.camera_alt), onPressed: () => {}),  
          IconButton(icon: Icon(Icons.account_circle), onPressed: () => {})  
        ],  
      ),  
      floatingActionButton: FloatingActionButton(  
        child: Icon(Icons.navigation),  
        backgroundColor: Colors.green,  
        foregroundColor: Colors.white,  
        onPressed: () => {
           Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => FlutterFormLogin()),
  )
        },  
      ),  
            body: BodyLayout(),
          ),
        );
      }
    }

    class BodyLayout extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return _myListView(context);
      }
    }

    // replace this function with the code in the examples
   Widget _myListView(BuildContext context) {

      return ListView(
        children: <Widget>[
          ListTile(
            
            leading:  CircleAvatar(
              backgroundImage: AssetImage('images/sun.jpg'),
            ),
            title: Text('Sun'),
            trailing: Icon(Icons.keyboard_arrow_right),// add  icon vào phần cuối của item
           subtitle: Text('93 million miles away'),
            onTap: () {
               Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SecondScreen()),
  );
            },
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('images/moon.jpg'),
            ),
            title: Text('Moon'),
            trailing: Icon(Icons.keyboard_arrow_right),
             subtitle: Text('82 million miles away'),
              onTap: () {
            },
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('images/star.jpg'),
            ),
            title: Text('Star'),
            trailing: Icon(Icons.keyboard_arrow_right),
             subtitle: Text('813 million miles away'),
              onTap: () {
            },
             
          ),
        ],
      );
   }
   class ExtractArgumentsScreen extends StatelessWidget {
  const ExtractArgumentsScreen({Key? key}) : super(key: key);

  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute
    // settings and cast them as ScreenArguments.
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
  
    );
  }
}