// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

StockData stockFromJson(String str) => StockData.fromJson(json.decode(str));

String stockToJson(StockData data) => json.encode(data.toJson());

class StockData {
  StockData({
    required this.stockInfo,
  });

  List<StockInfo> stockInfo;

  factory StockData.fromJson(Map<String, dynamic> json) => StockData(
        stockInfo: List<StockInfo>.from(
            json["stockInfo"].map((x) => StockInfo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "stockInfo": List<dynamic>.from(stockInfo.map((x) => x.toJson())),
      };
}

class StockInfo {
  StockInfo({
    required this.securityId,
    required this.securityName,
    required this.symbol,
    required this.indexId,
    required this.openPrice,
    required this.highPrice,
    required this.lowPrice,
    required this.totalTradeQuantity,
    required this.totalTradeValue,
    required this.lastTradedPrice,
    required this.percentageChange,
    required this.lastUpdatedDateTime,
    required this.lastTradedVolume,
    required this.previousClose,
  });

  String securityId;
  String securityName;
  String symbol;
  num indexId;
  num openPrice;
  num highPrice;
  num lowPrice;
  num totalTradeQuantity;
  dynamic totalTradeValue;
  num lastTradedPrice;
  num percentageChange;
  DateTime lastUpdatedDateTime;
  dynamic lastTradedVolume;
  num previousClose;

  // void printData() {
  //   print(percentageChange);
  // }

  // void formatPer() {
  //   String newpercentageChange = num.parse(percentageChange.toStringAsFixed(2));
  //   if (newpercentageChange.substring(0,1) == '+'){

  //   }
  // }

  factory StockInfo.fromJson(Map<String, dynamic> json) => StockInfo(
        securityId: json["securityId"],
        securityName: json["securityName"],
        symbol: json["symbol"],
        indexId: json["indexId"],
        openPrice: json["openPrice"],
        highPrice: json["highPrice"],
        lowPrice: json["lowPrice"],
        totalTradeQuantity: json["totalTradeQuantity"],
        totalTradeValue: json["totalTradeValue"],
        lastTradedPrice: json["lastTradedPrice"],
        percentageChange: json["percentageChange"].toDouble(),
        lastUpdatedDateTime: DateTime.parse(json["lastUpdatedDateTime"]),
        lastTradedVolume: json["lastTradedVolume"],
        previousClose: json["previousClose"],
      );

  Map<String, dynamic> toJson() => {
        "securityId": securityId,
        "securityName": securityName,
        "symbol": symbol,
        "indexId": indexId,
        "openPrice": openPrice,
        "highPrice": highPrice,
        "lowPrice": lowPrice,
        "totalTradeQuantity": totalTradeQuantity,
        "totalTradeValue": totalTradeValue,
        "lastTradedPrice": lastTradedPrice,
        "percentageChange": percentageChange,
        "lastUpdatedDateTime": lastUpdatedDateTime.toIso8601String(),
        "lastTradedVolume": lastTradedVolume,
        "previousClose": previousClose,
      };
}
