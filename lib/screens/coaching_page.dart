import 'package:flutter/material.dart';

class CoachingPage extends StatefulWidget {
  @override
  _CoachingPageState createState() => _CoachingPageState();
}

class _CoachingPageState extends State<CoachingPage> {
  int _selectedIndex = 0;
  final Color buttonColor = Color(0xFF004567);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0),
          child:Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Color(0xFFdae0e3))
          ),
          child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Navigation Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNavButton('Training', 0),
                  _buildNavButton('AI Avatar', 1),
                  _buildNavButton('Assessment', 2),

                ],

              ),
              SizedBox(height: 20),

              // Content based on selected index
              _selectedIndex == 0
                  ? _buildTrainingContent()
                  : _selectedIndex == 1
                  ? _buildAIAssessmentContent()
                  : _buildAssessmentContent(),
            ],
          ),

          ),
        ),
        ),
      ),
    );
  }

  Widget _buildNavButton(String text, int index) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: _selectedIndex == index ? buttonColor : Colors.grey[300],
        foregroundColor: _selectedIndex == index ? Colors.white : Colors.black,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
      onPressed: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Text(text),
    );
  }

  Widget _buildTrainingContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Video Player Placeholder
        Container(
          height: 200,
          color: Colors.grey[300],
          child: Center(
            child: Icon(Icons.play_circle_filled, size: 50),
          ),
        ),
        SizedBox(height: 20),

        // Training Modules
        _buildModuleCard(
          title: 'Understanding Customer Needs',
          duration: '15 mins',
          description: 'Learn to identify and analyze customer pain points',
        ),
        SizedBox(height: 16),
        _buildModuleCard(
          title: 'Value Proposition',
          duration: '20 mins',
          description: 'Master the art of presenting solution value',
        ),
      ],
    );
  }

  Widget _buildModuleCard({
    required String title,
    required String duration,
    required String description,
  }) {
    return Card(
      elevation: 4,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(duration),
            SizedBox(height: 8),
            Text(description),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: Text('Start Module', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAIAssessmentContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Scores
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildScoreCard('Communication Score', '85%'),
            _buildScoreCard('Clinical Accuracy', '90%'),
            _buildScoreCard('Engagement Level', '88%'),
          ],
        ),
        SizedBox(height: 30),

        // Feedback Section
        Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildFeedbackItem(
                  'Excellent Clinical Knowledge',
                  'Demonstrated strong understanding of mechanism of action and clinical data',
                  Colors.green,
                ),
                SizedBox(height: 16),
                _buildFeedbackItem(
                  'Strong Value Communication',
                  'Effectively communicated patient benefits and clinical value',
                  Colors.blue,
                ),
                SizedBox(height: 16),
                _buildFeedbackItem(
                  'Area for Improvement',
                  'Consider addressing safety concerns more proactively',
                  Colors.orange,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {},
          child: Text('Start New Assessment', style: TextStyle(color: Colors.white)),
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            padding: EdgeInsets.symmetric(vertical: 15),
          ),
        ),
      ],
    );
  }

  Widget _buildScoreCard(String title, String score) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Text(title, style: TextStyle(fontSize: 14)),
            Spacer(),
            Text(
              score,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeedbackItem(String title, String description, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.circle, size: 12, color: color),
            SizedBox(width: 8),
            Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(description),
        ),
      ],
    );
  }

  Widget _buildAssessmentContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Skill Assessment',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text('Track your progress and identify areas for improvement'),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildAssessmentMetric('Overall Score', '85%'),
                    _buildAssessmentMetric('Completed Modules', '12/15'),
                    _buildAssessmentMetric('Time Invested', '24h'),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 30),
        Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Progress by Module',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                _buildProgressItem('Customer Needs Analysis', 'Completed', Colors.green),
                _buildProgressItem('Value Proposition', 'In Progress', Colors.orange),
                _buildProgressItem('Objection Handling', 'Not Started', Colors.grey),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAssessmentMetric(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(label),
      ],
    );
  }

  Widget _buildProgressItem(String module, String status, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(module),
          Chip(
            label: Text(status),
            backgroundColor: color.withOpacity(0.2),
            labelStyle: TextStyle(color: color),
          ),
        ],
      ),
    );
  }
}