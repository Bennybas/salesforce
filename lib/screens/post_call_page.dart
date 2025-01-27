import 'package:flutter/material.dart';

class PostCallPage extends StatefulWidget {
  @override
  _PostCallPageState createState() => _PostCallPageState();
}

class _PostCallPageState extends State<PostCallPage> {
  String? selectedBrand;
  String? selectedIndication;
  final TextEditingController _summaryController = TextEditingController();

  bool _isEfficacySelected = false;
  bool _isSafetySelected = false;

  final List<String> brands = ['Brand A', 'Brand B', 'Brand C'];
  final List<String> indications = ['Indication X', 'Indication Y', 'Indication Z'];

  List<Map<String, String>> recentSummaries = [];

  void _savePostCallSummary() {
    if (_summaryController.text.isNotEmpty) {
      setState(() {
        recentSummaries.add({
          'brand': selectedBrand ?? 'Not Selected',
          'indication': selectedIndication ?? 'Not Selected',
          'summary': _summaryController.text,
          'efficacy': _isEfficacySelected.toString(),
          'safety': _isSafetySelected.toString(),
          'date': DateTime.now().toString().substring(0, 16)
        });

        // Optional: Clear fields after saving
        _summaryController.clear();
        selectedBrand = null;
        selectedIndication = null;
        _isEfficacySelected = false;
        _isSafetySelected = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Color(0xFFdae0e3)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
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
                        Row(
                          children: [
                            Expanded(
                              child: DropdownButtonFormField<String>(
                                decoration: _getDropdownDecoration('Brand'),
                                value: selectedBrand,
                                hint: Text('Brand'),
                                items: brands.map((brand) {
                                  return DropdownMenuItem(
                                    value: brand,
                                    child: Text(brand),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedBrand = value;
                                  });
                                },
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: DropdownButtonFormField<String>(
                                decoration: _getDropdownDecoration('Indication'),
                                value: selectedIndication,
                                hint: Text('Indication',
                                  textAlign: TextAlign.center, ),
                                items: indications.map((indication) {
                                  return DropdownMenuItem(
                                    value: indication,
                                    child: Text(indication),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedIndication = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),

                        // Discussion Summary TextField
                        Text(
                          'Discussion Summary',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: _summaryController,
                          maxLines: 4,
                          decoration: InputDecoration(
                            hintText: 'Enter discussion summary...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Color(0xFFdae0e3)),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),

                        // Checkboxes (Vertically Arranged)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: _isEfficacySelected,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _isEfficacySelected = value ?? false;
                                    });
                                  },
                                ),
                                Text('Efficacy Data Presentation'),
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  value: _isSafetySelected,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _isSafetySelected = value ?? false;
                                    });
                                  },
                                ),
                                Text('Safety Profile Discussion'),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10),

                        // Save and Upload Button
                        ElevatedButton(
                          onPressed: _savePostCallSummary,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff004567),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            'Save and Upload',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 20),

                        // Recently Saved Summaries
                        Text(
                          'Recently Saved Summaries',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        recentSummaries.isEmpty
                            ? Center(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              'No Recent Summaries',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        )
                            : Column(
                          children: recentSummaries.map((summary) {
                            return Card(
                              elevation: 2,
                              margin: EdgeInsets.symmetric(vertical: 8),
                              child: ListTile(
                                title: Text(summary['brand']!),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Indication: ${summary['indication']}'),
                                    Text('Summary: ${summary['summary']}'),
                                    Text('Date: ${summary['date']}'),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
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

  InputDecoration _getDropdownDecoration(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18.0),
        borderSide: BorderSide(color: Color(0xFFdae0e3), width: 2.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18.0),
        borderSide: BorderSide(color: Color(0xFFdae0e3), width: 2.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18.0),
        borderSide: BorderSide(color: Color(0xFFdae0e3), width: 2.0),
      ),
    );
  }
}