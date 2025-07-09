import 'package:flutter/material.dart';

class SeatPage extends StatelessWidget {
  const SeatPage({super.key});

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
                        SizedBox(width: 50, child: Center(child: Text('A'))),
                        SizedBox(width: 50, child: Center(child: Text('B'))),
                        SizedBox(width: 50),
                        SizedBox(width: 50, child: Center(child: Text('C'))),
                        SizedBox(width: 50, child: Center(child: Text('D'))),
                      ],
                    ),
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
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                '예매 하기',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }

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

  Padding seatRowItem(int rowIndex, int ItemIndex) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey[300],
          ),
        ),
      );
  }
}
