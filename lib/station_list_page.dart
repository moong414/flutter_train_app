import 'package:flutter/material.dart';

class StationListPage extends StatelessWidget {
  const StationListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('출발역'), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            stationItem('수서'),
            stationItem('동탄'),
            stationItem('평택지제'),
            stationItem('천안아산'),
            stationItem('오송'),
            stationItem('대전'),
            stationItem('김천구미'),
            stationItem('동대구'),
            stationItem('경주'),
            stationItem('울산'),
            stationItem('부산'),
          ],
        ),
      ),
    );
  }

  Container stationItem(String stName) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey[300] ?? Colors.grey, width: 1),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Text(stName, style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
