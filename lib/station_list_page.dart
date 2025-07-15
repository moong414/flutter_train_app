import 'package:flutter/material.dart';

class StationListPage extends StatefulWidget {
  final String stTitle;
  final Map<int, String> selectedStationMap;
  const StationListPage({
    super.key,
    required this.stTitle,
    required this.selectedStationMap,
  });
  @override
  State<StationListPage> createState() => _StationListPageState();
}

class _StationListPageState extends State<StationListPage> {
  Column makeNewStationList(selectedStationMap) {
    var nowStation = selectedStationMap.values.toList();
    var newStationList = stationList
        .where((e) => !nowStation.contains(e))
        .toList();

    return Column(
      children: [
        for (int i = 0; i < newStationList.length; i++)
          stationItem(newStationList[i]),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.stTitle), centerTitle: false),
      body: SingleChildScrollView(
        child: makeNewStationList(widget.selectedStationMap),
      ),
    );
  }

  //역아이템
  Container stationItem(String stName) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Theme.of(context).colorScheme.outline, width: 1),
        ),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context, stName);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Text(stName, style: TextStyle(fontSize: 18)),
        ),
      ),
    );
  }
}

List<String> stationList = [
  '수서',
  '동탄',
  '평택지제',
  '천안아산',
  '오송',
  '대전',
  '김천구미',
  '동대구',
  '경주',
  '울산',
  '부산',
];
