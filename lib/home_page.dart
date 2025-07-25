import 'package:flutter/material.dart';
import 'package:flutter_train_app/seat_page.dart';
import 'package:flutter_train_app/station_list_page.dart';
import 'package:flutter_train_app/toggle_theme_button.dart';
import 'package:flutter_train_app/util.dart';

class HomePage extends StatefulWidget {
  final bool isDarkMode;
  final void Function(bool) onToggleTheme;
  const HomePage({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //선택된 역 담는 맵
  Map<int, String> selectedStationMap = {0: '선택', 1: '선택'};

  //역선택 함수
  void goToStationList(int num, String stTitle) async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StationListPage(
          stTitle: stTitle,
          selectedStationMap: selectedStationMap,
        ),
      ),
    );
    if (result != null) {
      setState(() {
        selectedStationMap[num] = result;
      });
    }
  }

  //역선택 표시 위젯
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
                color: Theme.of(context).colorScheme.onSurfaceVariant,
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
      appBar: AppBar(
        title: Text('기차 예매'),
        centerTitle: false,
        actions: [
          ToggleThemeButtons(
            isSelected: selectdToggle,
            icons: icons,
            onPressed: (int index) {
              setState(() {
                for (int i = 0; i < selectdToggle.length; i++) {
                  selectdToggle[i] = i == index;
                }
              });
              // 모드 전환 호출
              widget.onToggleTheme(index == 1); // index 1이면 다크모드
            },
          ),
        ],
      ),
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
                    selectStationBox(0, '출발역'),
                    Container(
                      width: 2,
                      height: 50,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    selectStationBox(1, '도착역'),
                  ],
                ),
              ),
              SizedBox(height: 20),
              purpleMainButton(
                text: '좌석선택',
                onPressed: () {
                  if (!selectedStationMap.values.contains('선택')) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SeatPage(selectedStationMap: selectedStationMap),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
