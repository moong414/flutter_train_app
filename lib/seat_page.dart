import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_train_app/reserve_page.dart';
import 'package:flutter_train_app/util.dart';

class SeatPage extends StatefulWidget {
  final Map<int, String> selectedStationMap;
  const SeatPage({super.key, required this.selectedStationMap});

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  //현재 선택된 역 함수
  Expanded selectedRoute(int num) {
    return Expanded(
      child: Center(
        child: Text(
          (widget.selectedStationMap[num]?.toString() ?? '선택'),
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }

  //행정보 UI
  Padding seatColInfo({String spel = ''}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
      child: SizedBox(width: 50, child: Center(child: Text(spel))),
    );
  }

  //행 UI
  Row seatRow(int rowIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        seatRowItem(rowIndex, 'A'),
        seatRowItem(rowIndex, 'B'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
          child: SizedBox(width: 50, child: Center(child: Text('$rowIndex'))),
        ),
        seatRowItem(rowIndex, 'C'),
        seatRowItem(rowIndex, 'D'),
      ],
    );
  }

  //좌석 선택 함수
  Map<int, Set<String>> selectedSeatMap = {};
  void isSeatedMethod(int rowIndex, String seatIndex) {
    if (selectedSeatMap.containsKey(rowIndex)) {
      if (selectedSeatMap[rowIndex]!.contains(seatIndex)) {
        selectedSeatMap[rowIndex]!.remove(seatIndex);
      } else {
        selectedSeatMap[rowIndex]!.add(seatIndex);
      }
    } else {
      selectedSeatMap.putIfAbsent(rowIndex, () => <String>{});
      selectedSeatMap[rowIndex]!.add(seatIndex);
    }
    setState(() {});
  }

  //좌석 UI
  Padding seatRowItem(int rowIndex, String seatIndex) {
    //해당 좌석이 선택된 좌석인지 확인
    bool isSelected = selectedSeatMap[rowIndex]?.contains(seatIndex) ?? false;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
      child: GestureDetector(
        onTap: () {
          isSeatedMethod(rowIndex, seatIndex);
        },
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.tertiaryContainer,
          ),
        ),
      ),
    );
  }

  //예매하기 버튼 함수
  void reserveBtn() {
    if (selectedSeatMap.isNotEmpty) {
      //selectedSeatMap이 비어있지 않으면 쿠퍼티노 다이얼로그 노출
      showMyCupertinoDialog(context);
    }
  }

  //쿠퍼티노 다이얼로그
  void showMyCupertinoDialog(BuildContext context) {
    String confirmSeat = selectedSeatMap.entries
        .map((e) {
          return '${e.key}열 ${e.value.join(", ")}';
        })
        .join(' / ')
        .toString();

    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('예매 하시겠습니까?'),
          content: Text('좌석 $confirmSeat'),
          actions: [
            CupertinoDialogAction(
              child: Text('취소'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              isDestructiveAction: true,
              child: Text('확인'),
              onPressed: () {
                DateTime pushedTime = DateTime.now();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReservePage(
                      selectedStationMap: widget.selectedStationMap,
                      selectedSeatMap: selectedSeatMap,
                      pushedTime: pushedTime,
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('좌석선택'), centerTitle: true),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    selectedRoute(0),
                    Icon(Icons.arrow_circle_right_outlined, size: 30),
                    selectedRoute(1),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        SizedBox(width: 4),
                        Text('선택됨'),
                      ],
                    ),
                    SizedBox(width: 20),
                    Row(
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        SizedBox(width: 4),
                        Text('선택안됨'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        seatColInfo(spel: 'A'),
                        seatColInfo(spel: 'B'),
                        seatColInfo(),
                        seatColInfo(spel: 'C'),
                        seatColInfo(spel: 'D'),
                      ],
                    ),
                    //좌석표시
                    for (int i = 1; i <= 20; i++) seatRow(i),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: purpleMainButton(text: '예매 하기', onPressed: reserveBtn),
        ),
      ),
    );
  }
}
