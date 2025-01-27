import 'package:flutter/material.dart';

class PreCallPage extends StatefulWidget {
  @override
  _PreCallPageState createState() => _PreCallPageState();
}

class _PreCallPageState extends State<PreCallPage> {
  String? selectedDrugBrand;
  String? selectedHCP;

  final List<String> drugBrands = ['Brand A', 'Brand B', 'Brand C'];
  final List<String> hcpList = ['Dr. Smith', 'Dr. Johnson', 'Dr. Williams'];

  final List<Map<String, String>> newsItems = [
    {
      'title': 'Breakthrough in Medical Research',
      'description': 'New study shows promising results in treatment effectiveness.',
      'date': 'Jan 24, 2025'
    },
    {
      'title': 'Healthcare Innovation Summit',
      'description': 'Leading experts gather to discuss future of medical technology.',
      'date': 'Jan 22, 2025'
    },
    {
      'title': 'Patient Care Improvement',
      'description': 'New protocols implemented to enhance patient experience.',
      'date': 'Jan 20, 2025'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(

        slivers: [
          // News Section
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(16),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: newsItems.map((news) =>
                      Container(
                        width: 250,
                        margin: EdgeInsets.only(right: 16),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Color(0xFF89bc0e2),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 2,
                              )
                            ]
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              news['title']!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              news['description']!,
                              style: TextStyle(
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              news['date']!,
                              style: TextStyle(
                                color: Color(0xff707273),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      )
                  ).toList(),
                ),
              ),
            ),
          ),

          // Main Content
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child:ClipRRect(
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
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 20),
                      // Dropdown Rows
                      Row(
                        children: [
                      Expanded(
                      child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                          border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.0),
                                borderSide: BorderSide(
                                  color: Color(0xFFdae0e3), // Default border color
                                  width: 2.0,
                                ),
                              ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    borderSide: BorderSide(
                                      color: Color(0xFFdae0e3), // Border color when not focused
                                      width: 2.0,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    borderSide: BorderSide(
                                      color: Color(0xFFdae0e3), // Border color when focused
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                              value: selectedDrugBrand ?? 'Brand A',
                              items: drugBrands.map((brand) {
                                return DropdownMenuItem(
                                  value: brand,
                                  child: Text(
                                    brand,
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedDrugBrand = value;
                                });
                              },
                            ),
                          ),

                          SizedBox(width: 16),
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                borderSide: BorderSide(
                                  color: Color(0xFFdae0e3), // Default border color
                                  width: 2.0,
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                borderSide: BorderSide(
                                  color: Color(0xFFdae0e3), // Border color when not focused
                                  width: 2.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                borderSide: BorderSide(
                                  color: Color(0xFFdae0e3), // Border color when focused
                                  width: 2.0,
                                ),
                              ),
                            ),
                            value: selectedHCP ?? hcpList[0],
                            items: hcpList.map((hcp) {
                              return DropdownMenuItem(
                                value: hcp,
                                child: Text(
                                  hcp,
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedHCP = value;
                              });
                            },
                          ),
                        ),
                        ],
                      ),
                      SizedBox(height: 20),

                      // KPI Insights
                      Center(
                        child: Wrap(
                          spacing: 16.0,
                          runSpacing: 16.0,
                          alignment: WrapAlignment.center,
                          children: [
                            SizedBox(
                              width: 150,
                              child: _buildKPICard('Total\nBrand Calls', '124', Icons.call),
                            ),
                            SizedBox(
                              width: 150,
                              child: _buildKPICard('Total\nPatients', '856', Icons.people),
                            ),
                            SizedBox(
                              width: 150,
                              child: _buildKPICard('HCP\nPenetration', '68%', Icons.percent),
                            ),
                            SizedBox(
                              width: 150,
                              child: _buildKPICard('Market\nShare', '22%', Icons.pie_chart),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),

                      // Key Evidence Message
                      Card(
                        elevation: 3,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xfffbfbfb),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Color(0xFFdae0e3), // Border color
                              width: 1, // Border width
                            ),
                          ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Key Evidence Message',
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Recent clinical studies have shown significant improvements in patient outcomes. A randomized, double-blind trial demonstrated favorable results compared to standard care.',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                      ),
                      SizedBox(height: 20),

                      // Previous Conversation History
                      Text(
                        'Previous Conversation History',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Conversation History Items
                      _buildConversationHistoryItem(
                        date: '2024-01-15',
                        topic: 'Treatment Efficacy',
                        summary: 'Discussed recent clinical trial results',
                        feedback: 'Positive',
                      ),
                      _buildConversationHistoryItem(
                        date: '2024-01-14',
                        topic: 'Patient Management',
                        summary: 'Explored new treatment protocols',
                        feedback: 'Neutral',
                      ),
                      _buildConversationHistoryItem(
                        date: '2024-01-13',
                        topic: 'Research Updates',
                        summary: 'Reviewed latest research findings',
                        feedback: 'Positive',
                      ),
                    ],
                  ),
                ),
              ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKPICard(String title, String value, IconData icon) {
    return Card(
      elevation: 3,
      child: Container(
          decoration: BoxDecoration(
            color: Color(0xfffbfbfb),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Color(0xFFdae0e3), // Border color
              width: 1, // Border width
            ),
          ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 24, color: Color(0xffc98b27)),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xff004567),
              ),
            ),
          ],
        ),
      ),
      )
    );
  }

  Widget _buildConversationHistoryItem({
    required String date,
    required String topic,
    required String summary,
    required String feedback,
  }) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xfffbfbfb),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Color(0xFFdae0e3), // Border color
            width: 1, // Border width
          ),
        ),
      child: ListTile(
        title: Text(
          topic,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Date: $date'),
            Text('Summary: $summary'),
            Text(
              'Feedback: $feedback',
              style: TextStyle(
                color: feedback == 'Positive'
                    ? Colors.green
                    : feedback == 'Neutral'
                    ? Colors.grey
                    : Colors.red,
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}