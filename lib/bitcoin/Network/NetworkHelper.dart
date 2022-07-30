import 'dart:convert';
import 'package:http/http.dart' as http;

const  String apiKey = "6F375F8A-39ED-4456-88D6-B03C6B03969B";

// asset_id_quote
class NetworkHelperForCurrency{
  NetworkHelperForCurrency({required this.crypto, required this.countryCurrency});

  String crypto;
  String countryCurrency;

  Future getData() async {
    String uri = 'https://rest.coinapi.io/v1/exchangerate/$crypto/$countryCurrency?apikey=$apiKey';
    http.Response response = await http.get(Uri.parse(uri));
    var data = response.body;
    var converted = jsonDecode(data);

    if(response.statusCode == 200){
      print("Request for conversion of currency is successful");
      print(converted['rate']);
    } else {
      print("The uri was $uri");
      print("There was an issue making the request for currency exchange rate.");
    }

    return converted['rate'];
  }

}