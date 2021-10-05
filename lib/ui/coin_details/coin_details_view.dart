import 'package:cached_network_image/cached_network_image.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:zapit/core/constants/constants.dart';
import 'package:zapit/core/model/coins_list_model.dart';
import 'package:zapit/ui/widget/response_handler.dart';

import 'coin_details_viewmodel.dart';

class CoinDetailsView extends StatelessWidget {
  final CoinInfo coinInfo;
  const CoinDetailsView({Key? key, required this.coinInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CoinDetailsViewModel>.reactive(
      onModelReady: (viewModel) => viewModel.fetchCoinDetails(coinInfo.name ?? 'N/A'),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(coinInfo.fullName ?? 'N/A'),
        ),
        body: ResponseHandler(
          isBusy: model.isBusy,
          error: model.modelError,
          hasError: model.hasError,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        label('Name', coinInfo.name ?? 'N/A'),
                        SizedBox(
                          height: 8,
                        ),
                        label('Full Name', coinInfo.fullName ?? 'N/A'),
                      ],
                    ),
                    Spacer(),
                    CachedNetworkImage(
                      height: 50,
                      width: 50,
                      imageUrl: coinInfo.imageUrl != null ? '$imageBaseUrl${coinInfo.imageUrl}' : 'https://www.helptechco.com/files/1215BP6.png',
                    ),
                  ],
                ),
                Divider(),
                Text(
                  'Historical Price Data',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                  SizedBox(
                          height: 16,
                        ), 
                Align(
                  alignment: Alignment.centerRight,
                  child: Text('From ${model.timeFrom} to ${model.timeTo}',style: TextStyle(fontSize: 9),)),
                  SizedBox(
                          height: 8,
                        ),
                         Expanded(
                  child: LineChart(
                    LineChartData(
                      gridData: FlGridData(drawHorizontalLine: false, drawVerticalLine: false),
                      lineBarsData: [
                        LineChartBarData(
                          belowBarData: BarAreaData(
                            show: true,
                            gradientFrom: Offset(1, 0),
                            gradientTo: Offset(1, 1),
                            gradientColorStops: [0.1, 0.8],
                            spotsLine: BarAreaSpotsLine(
                              show: true,
                              flLineStyle: FlLine(
                                color: Colors.grey,
                                dashArray: [1, 3],
                                strokeWidth: 1,
                              ),
                            ),
                            colors: [
                              Colors.blue.withOpacity(0.8),
                              Colors.blue.withOpacity(0.05),
                            ],
                          ),
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
                          // checkToShowTitle: (_, __, ____, _____, value) => true,
                        ),
                        bottomTitles: SideTitles(
                          showTitles: true,
                          margin: 5,
                          interval: 5,
                          checkToShowTitle: (_, __, ____, _____, value) {
                            return model.coinDetailsResponse?.data?.data?.any((element) => element.time == value) ?? false;
                          },
                          getTextStyles: (_, __) => TextStyle(fontSize: 8),
                          getTitles: (value) {
                            return model.getDateFromEpoch(value);
                          },
                        ),
                      ),
                      borderData: FlBorderData(
                        show: true,
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black,
                            width: 0.5,
                          ),
                          top: BorderSide(
                            color: Colors.black,
                            width: 0.5,
                          ),
                          left: BorderSide(
                            color: Colors.black,
                            width: 0.5,
                          ),
                          right: BorderSide(
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
      ),
      viewModelBuilder: () => CoinDetailsViewModel(),
    );
  }

  Widget label(String title, String value) {
    return Text('$title : $value');
  }
}
