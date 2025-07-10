import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SeatPage extends StatefulWidget {
  const SeatPage({super.key});

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
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
                    Expanded(
                      child: Center(
                        child: Text(
                          '수서',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple,
                          ),
                        ),
                      ),
                    ),
                    Icon(Icons.arrow_circle_right_outlined, size: 30),
                    Expanded(
                      child: Center(
                        child: Text(
                          '수서',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple,
                          ),
                        ),
                      ),
                    ),
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
                            color: Colors.purple,
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
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 2,
                            vertical: 4,
                          ),
                          child: SizedBox(
                            width: 50,
                            child: Center(child: Text('A')),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 2,
                            vertical: 4,
                          ),
                          child: SizedBox(
                            width: 50,
                            child: Center(child: Text('B')),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 2,
                            vertical: 4,
                          ),
                          child: SizedBox(width: 50),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 2,
                            vertical: 4,
                          ),
                          child: SizedBox(
                            width: 50,
                            child: Center(child: Text('C')),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 2,
                            vertical: 4,
                          ),
                          child: SizedBox(
                            width: 50,
                            child: Center(child: Text('D')),
                          ),
                        ),
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
          child: SizedBox(
            width: double.infinity,
            height: 56,
            child: reserveSeat(),
          ),
        ),
      ),
    );
  }

  //행 함수
  Row seatRow(int rowIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        seatRowItem(rowIndex, 1),
        seatRowItem(rowIndex, 2),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
          child: SizedBox(width: 50, child: Center(child: Text('$rowIndex'))),
        ),
        seatRowItem(rowIndex, 3),
        seatRowItem(rowIndex, 4),
      ],
    );
  }

  //좌석 선택 함수
  Map<int, Set<int>> selectedSeatMap = {};
  void isSeatedMethod(int rowIndex, int seatIndex) {
    if (selectedSeatMap.containsKey(rowIndex)) {
      if (selectedSeatMap[rowIndex]!.contains(seatIndex)) {
        selectedSeatMap[rowIndex]!.remove(seatIndex);
      } else {
        selectedSeatMap[rowIndex]!.add(seatIndex);
      }
    } else {
      selectedSeatMap.putIfAbsent(rowIndex, () => <int>{});
      selectedSeatMap[rowIndex]!.add(seatIndex);
    }

    setState(() {});
  }

  Padding seatRowItem(int rowIndex, int seatIndex) {
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
            color: isSelected ? Colors.purple : Colors.grey[300],
          ),
        ),
      ),
    );
  }

  //예매하기 버튼
  ElevatedButton reserveSeat() {
    return ElevatedButton(
      onPressed: reserveBtn,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Text(
        '예매 하기',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  //예매하기 버튼 함수
  void reserveBtn() {
    if (selectedSeatMap.isNotEmpty) {
      showMyCupertinoDialog(context);
    }
  }

  //쿠퍼티노 다이얼로그
  void showMyCupertinoDialog(BuildContext context) {
    String confirmSeat = selectedSeatMap.entries.map((e) {
      return '${e.key} - ${e.value.join(",")}';
    }).join('').toString();

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
                // 삭제 로직
                int count = 0;
                Navigator.popUntil(context, (_) => count++ == 2);
              },
            ),
          ],
        );
      },
    );
  }
}
