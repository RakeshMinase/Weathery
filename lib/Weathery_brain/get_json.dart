import 'package:http/http.dart' as http;
import 'dart:convert';

class getData {
  getData(this.url);

  final String url;

  Future getJson() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}