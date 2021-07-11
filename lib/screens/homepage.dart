import 'package:api_practice/services/api_handler.dart';
import 'package:flutter/material.dart';
import 'package:api_practice/models/stock_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<StockData> _stockData;

  @override
  void initState() {
    super.initState();
    _stockData = APIHandler().getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stocks'),
      ),
      body: Container(
        child: FutureBuilder<StockData>(
          future: _stockData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.stockInfo.length,
                itemBuilder: (context, index) {
                  var stock = snapshot.data!.stockInfo[index];
                  var perChan = stock.percentageChange.toStringAsFixed(2);
                  var newChange;
                  Color colorVal;
                  if (perChan.substring(0, 1) == '-') {
                    newChange = '- ${(perChan.substring(1))}';
                    colorVal = Colors.red;
                  } else {
                    newChange = '+ $perChan';
                    colorVal = Colors.green;
                  }

                  return Column(
                    children: [
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    stock.symbol,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    stock.securityName,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    stock.lastTradedPrice.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: colorVal,
                                    ),
                                    child: Text(
                                      newChange,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Divider(),
                    ],
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
