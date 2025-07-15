import 'package:flutter/material.dart';
import 'package:flutter_train_app/util.dart';
import 'package:intl/intl.dart';

class ReservePage extends StatefulWidget {
  const ReservePage({
    super.key,
    required this.selectedStationMap,
    required this.selectedSeatMap,
    required this.pushedTime
  });
  final Map<int, String> selectedStationMap;
  final Map<int, Set<String>> selectedSeatMap;
  final DateTime pushedTime;

  @override
  State<ReservePage> createState() => _ReservePageState();
}

class _ReservePageState extends State<ReservePage> {
  //예약된 역 정보 UI
  Container reservedStationBox(BuildContext context, String stTitle, int num) {
    return Container(
      height: 140,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiary,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: Text(stTitle, style: TextStyle(fontSize: 16)),
              ),
            ),
            Text(
              widget.selectedStationMap[num] ?? '선택',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
  
  //하단 정보 노출 UI
  Row reserveEtcRow(
    BuildContext context,
    IconData etcIconName,
    String etcTitle,
    dynamic etcInfo,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          etcIconName,
          size: 24,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
        SizedBox(width: 8),
        Text(
          etcTitle,
          style: TextStyle(
            fontSize: 16,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        SizedBox(width: 15),
        Expanded(child: Text('$etcInfo', style: TextStyle(fontSize: 17))),
      ],
    );
  }

  //하단 예약시간 구하는 함수
  String getReserveTime(){
    String formattedTime = DateFormat('yyyy-MM-dd HH:mm').format(widget.pushedTime);
    return formattedTime;
  }

  //하단 예약인원 구하는 함수
  String getReserveMembers(){
    int seatNum = 0;
    for (var set in widget.selectedSeatMap.values) {
      seatNum += set.length;
    }
    return '$seatNum 명';
  }

  //하단 좌석정보 구하는 함수
  String getReserveSeats(){
    var seats = widget.selectedSeatMap.entries.map((e){
      List<String> sortedSeats = e.value.toList();
      sortedSeats.sort();//오름차순 정렬
      return '${e.key}열 ${sortedSeats.map((s) => '$s석').join(", ")}';
    }).join(' / ').toString();
    return seats;
  }

  //메인페이지로 이동 함수
  void toMainBtn() {
    int count = 0;
    Navigator.popUntil(context, (_) => count++ == 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('내 예약'), centerTitle: false),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.outline,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(17),
            child: Column(
              children: [
                reservedStationBox(context, '출발역', 0),
                SizedBox(
                  height: 100,
                  child: Icon(
                    Icons.arrow_circle_down_outlined,
                    size: 50,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                reservedStationBox(context, '도착역', 1),
                SizedBox(height: 20),
                reserveEtcRow(context, Icons.event_available, '예약시간', getReserveTime()),
                SizedBox(height: 12),
                reserveEtcRow(context, Icons.person, '예약인원', getReserveMembers()),
                SizedBox(height: 12),
                reserveEtcRow(context, Icons.event_seat, '좌석정보', getReserveSeats()),
                Spacer(),
              ],
            ),
          ),
        ),
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
