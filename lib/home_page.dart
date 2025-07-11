import 'package:flutter/material.dart';
import 'package:flutter_train_app/seat_page.dart';
import 'package:flutter_train_app/station_list_page.dart';
import 'package:flutter_train_app/util.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //선택된 역 담는 맵
  Map<int, String> selectedStationMap = {1: '선택', 2: '선택'};

  //역선택 함수
  void goToStationList(int num, String stTitle) async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StationListPage(stTitle: stTitle, selectedStationMap: selectedStationMap),
      ),
    );

    if (result != null) {
      setState(() {
        selectedStationMap[num] = result;
      });
    }
  }

  //역선택 표시 위젯용 함수
  Expanded selectStationBox(int num, String stTitle) {
    return Expanded(
      child: GestureDetector(
        onTap: () => goToStationList(num, stTitle),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              stTitle,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              selectedStationMap[num] ?? '선택',
              style: TextStyle(fontSize: 40),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('기차 예매'), centerTitle: true),
      body: Container(
        width: double.infinity,
        color: Theme.of(context).colorScheme.secondaryContainer,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.tertiary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    selectStationBox(1, '출발역'),
                    Container(width: 2, height: 50, color: Theme.of(context).colorScheme.outline),
                    selectStationBox(2, '도착역'),
                  ],
                ),
              ),
              SizedBox(height: 20),
              purpleMainButton(
                text: '좌석선택',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SeatPage(selectedStations: selectedStationMap),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
