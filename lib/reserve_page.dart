import 'package:flutter/material.dart';
import 'package:flutter_train_app/util.dart';

class ReservePage extends StatefulWidget {
  const ReservePage({
    super.key,
    required this.selectedStationMap,
    required this.selectedSeatMap,
  });
  final Map<int, String> selectedStationMap;
  final Map<int, Set<int>> selectedSeatMap;

  @override
  State<ReservePage> createState() => _ReservePageState();
}

class _ReservePageState extends State<ReservePage> {
  //메인페이지로 이동 함수
  void toMainBtn() {
    int count = 0;
    Navigator.popUntil(context, (_) => count++ == 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('내 예약'), centerTitle: true),
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
                Container(
                  height: 120,
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
                            child: Text('출발역', style: TextStyle(fontSize: 16)),
                          ),
                        ),
                        Text(
                          '출발역',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: Icon(
                    Icons.arrow_circle_down_outlined,
                    size: 50,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Container(
                  height: 120,
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
                            child: Text('출발역', style: TextStyle(fontSize: 16)),
                          ),
                        ),
                        Text(
                          '출발역',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                reserveEtcRow(context, Icons.event_available , '예약시간', 20181645),
                SizedBox(height: 12),
                reserveEtcRow(context, Icons.person , '예약인원', '2명'),
                SizedBox(height: 12),
                reserveEtcRow(context, Icons.event_seat , '좌석정보', '1-2'),
                Spacer()
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

  Row reserveEtcRow(BuildContext context, IconData etcIconName, String etcTitle, dynamic etcInfo) {
    return Row(
      children: [
        Icon(
          etcIconName,
          size: 24,
          color: Theme.of(context).colorScheme.primary,
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
        Text('$etcInfo', style: TextStyle(fontSize: 17)),
      ],
    );
  }
}
