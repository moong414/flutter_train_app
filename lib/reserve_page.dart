import 'package:flutter/material.dart';
import 'package:flutter_train_app/util.dart';

class ReservePage extends StatefulWidget {
  const ReservePage({super.key, required this.selectedStationMap});
  final Map<int, String> selectedStationMap;

  @override
  State<ReservePage> createState() => _ReservePageState();
}

class _ReservePageState extends State<ReservePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('내 예약'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.outline,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(padding: EdgeInsets.all(10), child: Row(children: [
                  Text('출발역'),
                  SizedBox(width: 5,),
                  Text('출발역 이름', style: TextStyle(fontSize: 18),),
                ],)),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: purpleMainButton(
            text: '메인 페이지로 이동',
            onPressed: () {
              // 삭제 로직
              int count = 0;
              Navigator.popUntil(context, (_) => count++ == 3);
            },
          ),
        ),
      ),
    );
  }
}
