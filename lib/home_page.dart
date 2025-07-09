import 'package:flutter/material.dart';
import 'package:flutter_train_app/seat_page.dart';
import 'package:flutter_train_app/station_list_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('기차 예매'), centerTitle: true),
      body: Container(
        width: double.infinity,
        color: Colors.grey[200],
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    SelectStaionBox(stTitle: '출발역'),
                    Container(width: 2, height: 50, color: Colors.grey[400]),
                    SelectStaionBox(stTitle: '도착역'),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SeatPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    '좌석선택',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SelectStaionBox extends StatefulWidget {
  final String stTitle;
  const SelectStaionBox({super.key, required this.stTitle});

  @override
  State<SelectStaionBox> createState() => _SelectStaionBoxState();
}

class _SelectStaionBoxState extends State<SelectStaionBox> {
  String? selectedStation = '선택';

  void goToStationList() async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const StationListPage()),
    );

    if(result != null){
      setState((){
        selectedStation = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: goToStationList,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.stTitle,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(selectedStation ?? '선택', style: TextStyle(fontSize: 40)),
          ],
        ),
      ),
    );
  }
}
