import 'package:http/http.dart' as http;
class DataService {
  Future<String> makeRequestToApi() async {
    //https://www.youtube.com/
   final uri = Uri.https('jsonplaceholder.typicode.com','posts') ;
  final response = await http.get(uri);
return response.body;
  }
}