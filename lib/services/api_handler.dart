import 'dart:convert';
import 'package:api_practice/constants/strings.dart';
import 'package:api_practice/models/stock_data.dart';
import 'package:http/http.dart' as http;

class APIHandler {
  Future<StockData> getData() async {
    var client = http.Client();
    var response = await client.get(Uri.parse(Strings.stock_url));
    print('I am here');
    if (response.statusCode == 200) {
      return StockData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load stockData');
    }
  }
}
