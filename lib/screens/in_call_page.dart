import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class InCallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Color(0xFFdae0e3)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 0.1,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: _buildKPICard('Call Duration', '12:45', Icons.timer),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: _buildKPICard('Talk Ratio', '65%', Icons.mic),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: _buildKPICard('Engagement', '8.5/10', Icons.star),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Key Analysis Section
                      Card(
                        elevation: 3,
                        color: Color(0xfffbfbfb),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Key Analysis',
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'This call highlights key engagement metrics. The talk ratio suggests an interactive discussion, and the engagement score indicates strong participation from both sides.',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Call Quality Analysis Graph
                      Card(
                        color: Color(0xfffbfbfb),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Call Quality Analysis',
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              _buildCallQualityChart(),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // End Call Button
                      Center(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // Add functionality for ending the call
                          },
                          icon: const Icon(Icons.phone_disabled, color: Colors.white),
                          label: const Text('End Call'),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20), // Add bottom padding
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildKPICard(String title, String value, IconData icon) {
    return Card(
      color: Color(0xfffbfbfb),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 28, color: Color(0xffc98b27)),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xff004567),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCallQualityChart() {
    final List<CallQualityData> chartData = [
      CallQualityData('Clinical\nKnowledge', 85, Color(0xFF4CAF50)),
      CallQualityData('Message\nDelivery', 72, Color(0xFF2196F3)),
      CallQualityData('Needs\nAnalysis', 65, Color(0xFFFFC107)),
      CallQualityData('Value\nCommunication', 78, Color(0xFF9C27B0)),
      CallQualityData('Customer\nEngagement', 88, Color(0xFFFF5722)),
      CallQualityData('Objection\nHandling', 70, Color(0xFF795548)),
    ];

    return SizedBox(
      height: 250,
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(
          labelStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        ),
        primaryYAxis: NumericAxis(
          minimum: 0,
          maximum: 100,
          interval: 20,
          labelFormat: '{value}%',
        ),
        series: <CartesianSeries>[
          BarSeries<CallQualityData, String>(
            dataSource: chartData,
            xValueMapper: (CallQualityData data, _) => data.category,
            yValueMapper: (CallQualityData data, _) => data.percentage,
            pointColorMapper: (CallQualityData data, _) => data.color,
            width: 0.7,
            borderRadius: BorderRadius.circular(10),
          )
        ],
        tooltipBehavior: TooltipBehavior(
          enable: true,
          header: '',
          canShowMarker: false,
          format: 'point.x : point.y%',
        ),
      ),
    );
  }
}

class CallQualityData {
  final String category;
  final double percentage;
  final Color color;

  CallQualityData(this.category, this.percentage, this.color);
}