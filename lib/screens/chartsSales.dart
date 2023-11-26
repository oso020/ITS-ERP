import 'package:dashboard/model/classCodeScreen.dart';
import 'package:dashboard/screens/anmtiongif.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DrawCharts extends StatefulWidget {
  String link;
  String namePage;
  String name;

  DrawCharts({
    required this.link,
    required this.namePage,
    required this.name,
  });

  @override
  _DrawChartsState createState() => _DrawChartsState();
}

class _DrawChartsState extends State<DrawCharts> {
  TooltipBehavior? tooltipBehavior;
  double minVisibleX = 0.0;
  double maxVisibleX = 5.0; // Adjust this to match your data range

  @override
  void initState() {
    tooltipBehavior = TooltipBehavior(enable: true);
    Provider.of<ChartsApp>(context, listen: false).getItemHomedata(widget.link);
    super.initState();
  }

  // Function to reset the chart's visible range
  void zoomout() {
    setState(() {
      maxVisibleX += 0.1; // Adjust this to match your data range
    });
  }

  void zoomin() {
    setState(() {
      maxVisibleX -= 0.4; // Adjust this to match your data range
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Consumer<ChartsApp>(
      builder: (context, model, child) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              title: Text(
                widget.namePage,
                style: TextStyle(
                  fontSize: screenSize.width / 18,
                  fontFamily: 'arabic',
                  color: Colors.blueGrey,
                ),
              ),
              automaticallyImplyLeading: false,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.blueGrey,
                ),
                onPressed: () {
                  setState(() {
                    model.chartData.clear();
                    Navigator.pop(context);
                  });
                },
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.zoom_out,
                    color: Colors.blueGrey,
                    size: screenSize.width / 12,
                  ),
                  onPressed: zoomout,
                ),
                IconButton(
                  icon: Icon(
                    Icons.zoom_in,
                    color: Colors.blueGrey,
                    size: screenSize.width / 12,
                  ),
                  onPressed: zoomin,
                ),
                // Add a reset zoom button
              ],
            ),
            body: Center(
              child: model.chartData.isEmpty
                  ? const GifAnimation()
                  : SizedBox(
                    height: screenSize.height/1.2,
                    width: screenSize.width/1.05,
                    child: SfCartesianChart(
                        legend: const Legend(isVisible: true),
                        series: <ChartSeries<SalesData, String>>[
                          LineSeries<SalesData, String>(
                            name: widget.name,
                            isVisibleInLegend: false,
                            dataSource: model.chartData,
                            xValueMapper: (SalesData sales, _) => sales.year,
                            yValueMapper: (SalesData sales, _) => sales.sales,
                            pointColorMapper: (SalesData sales, _) =>
                                Colors.blueAccent, // Customize point color
                            dataLabelSettings:
                                const DataLabelSettings(isVisible: true),
                            enableTooltip: true,
                            color: Colors.blueAccent,
                          ),
                        ],
                        primaryXAxis: CategoryAxis(
                          visibleMinimum: minVisibleX,
                          visibleMaximum: maxVisibleX,
                        ),
                        primaryYAxis: NumericAxis(
                          labelFormat:
                              '{value}.LE', // Use the currency symbol EGP
                          numberFormat: NumberFormat.simpleCurrency(
                              decimalDigits: 0, name: ''),
                        ),
                        zoomPanBehavior: ZoomPanBehavior(
                          enablePanning: true, 
                          maximumZoomLevel: maxVisibleX// Enable panning
                        ),
                        tooltipBehavior: tooltipBehavior,
                      ),
                  ),
            ),
          ),
        );
      },
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final dynamic sales;
}
