import 'package:flutter/material.dart';
import 'package:flutter_train_app/util.dart';

class ReservePage extends StatefulWidget {
  const ReservePage({super.key, required this.selectedStationMap});
  final Map<int, String> selectedStationMap;

  @override
  State<ReservePage> createState() => _ReservePageState();
}

class _ReservePageState extends State<ReservePage> {
  //예약박스 함수

  //예약박스 UI
  Padding reservedBox(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.outline,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                children: [
                  reservedStationInfo(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Container(
                      width: 2,
                      height: 15,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                  reservedStationInfo(),
                ],
              ),
              SizedBox(height: 12),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Container(
                        color: Theme.of(context).colorScheme.tertiary,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
                          child: Text('좌석정보'),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text('1-1', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //예약된 역 정보 UI
  Expanded reservedStationInfo() {
    return Expanded(
      child: Row(
        children: [
          Text('출발역'),
          SizedBox(width: 5),
          Text(
            '출발역 이름',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  //메인페이지로 이동 함수
  void toMainBtn() {
    int count = 0;
    Navigator.popUntil(context, (_) => count++ == 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('내 예약'), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(children: [reservedBox(context)]),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: purpleMainButton(text: '메인으로 이동', onPressed: toMainBtn),
        ),
      ),
    );
  }
}