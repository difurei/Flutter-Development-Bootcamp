import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = 'N2I0OWE0ZDdmYzE4NDVkZTg0YjQxYTdlNGRjNGU0ZTY';

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url), headers:  {'x-ba-key':'$apiKey'});

    if(response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    }
    else {
      print("Request failed with status code ${response.statusCode}");
    }
  }
}