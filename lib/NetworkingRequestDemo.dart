import 'package:flutter/material.dart';
import 'data_service.dart';


class NetworkingRequestDemo extends StatelessWidget {
 

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: _NetworkingRequestDemo(),
      
    );
  }
}
class _NetworkingRequestDemo extends StatefulWidget {
 
  @override
  State<_NetworkingRequestDemo> createState() => _NetworkingRequestDemoState();
}

class _NetworkingRequestDemoState extends State<_NetworkingRequestDemo> {
  final _dataService = DataService();
  var _response;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:Center(
        child: Builder(
          builder: ( _) {
            if(_response != null){
              return Text(_response);
            }
            else{
            return ElevatedButton(
              child: Text('Make Request'),
              onPressed: _makeRequest,

            );
            }
            
          }
        ) ,
        ),
      )
    );
  }
  void _makeRequest() async{
    final response = await _dataService.makeRequestToApi();
    setState(() => { _response = response
      
    });
}
}




