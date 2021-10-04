import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:zapit/ui/widget/response_handler.dart';

import 'coin_details_viewmodel.dart';

class CoinDetailsView extends StatelessWidget {
  final String coinSymbol;
  const CoinDetailsView({Key? key, required this.coinSymbol}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CoinDetailsViewModel>.reactive(
      onModelReady: (viewModel) => viewModel.fetchCoinDetails(coinSymbol),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(coinSymbol),
        ),
        body: ResponseHandler(
          isBusy: model.isBusy,
          error: model.modelError,
          hasError: model.hasError,
          child: Column(
            children: [
              Spacer(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, bottom: 60),
                  child: LineChart(
                    LineChartData(
                      lineBarsData: [
                        LineChartBarData(
                          spots: model.coinDetailsResponse?.data?.data
                              ?.map(
                                (coinValue) => FlSpot(coinValue.time?.toDouble() ?? 0, coinValue.close ?? 0),
                              )
                              .toList(),
                          dotData: FlDotData(show: false),
                        )
                      ],
                      titlesData: FlTitlesData(
                        show: true,
                        topTitles: SideTitles(showTitles: false),
                        rightTitles: SideTitles(showTitles: false),
                        leftTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 40,
                          checkToShowTitle: (_,__,____,_____,______)=>true,
                        ),
                        bottomTitles: SideTitles(
                          showTitles: true,
                          margin: 5,
                          rotateAngle: 300,
                          getTextStyles: (_, __) => TextStyle(fontSize: 8),
                          getTitles: (value) {
                            return DateFormat.yMMMMd('en_US').format(DateTime.fromMillisecondsSinceEpoch(value.toInt() * 1000));
                          },
                        ),
                        
                      ),
                      borderData: FlBorderData(
                  show: true,
                  border: Border.all(
                      color: Colors.black,
                      width: 0.5,
                  ),
                ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => CoinDetailsViewModel(),
    );
  }
}
