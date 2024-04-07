import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final Function(int) onItemSelected;
  final Color selectedItemColor;

  const CustomBottomNavigationBar({
    required this.onItemSelected,
    required this.selectedItemColor,
  });

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
      child: BottomNavigationBar(
        elevation: 3,
        iconSize: 24,
        showUnselectedLabels: false,
        showSelectedLabels: false,

        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          widget.onItemSelected(index);
        },
        selectedItemColor: widget.selectedItemColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.graphic_eq),
            label: "Another Screen",
          ),
        ],
      ),
    );
  }
}
