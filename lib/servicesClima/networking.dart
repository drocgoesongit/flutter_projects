import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper{
  NetworkHelper({required this.url});

  final String url;

  Future getData() async {
    print("inside network helper");
    http.Response response = await http.get(Uri.parse(url));
    var data = response.body;

    if(response.statusCode == 200){
      print('successful request');
    } else {
      print("bad request.");
    }

    return jsonDecode(data);

  }


}