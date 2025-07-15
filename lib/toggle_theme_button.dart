import 'package:flutter/material.dart';

//토글 아이콘 모음
List<Widget> icons = <Widget>[Icon(Icons.light_mode), Icon(Icons.dark_mode)];
//토글 리스트
List<bool> selectdToggle = <bool>[true, false];

class ToggleThemeButtons extends StatelessWidget {
  final List<bool> isSelected;
  final List<Widget> icons;
  final void Function(int) onPressed;

  const ToggleThemeButtons({
    super.key,
    required this.isSelected,
    required this.icons,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: ToggleButtons(
        onPressed: onPressed,
        constraints: const BoxConstraints(minHeight: 35, minWidth: 50),
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        selectedBorderColor: Theme.of(context).colorScheme.primary,
        borderColor: Theme.of(context).colorScheme.outline,
        selectedColor: Colors.white,
        fillColor: Theme.of(context).colorScheme.primary,
        color: Theme.of(context).colorScheme.primary,
        isSelected: isSelected,
        children: icons,
      ),
    );
  }
}
