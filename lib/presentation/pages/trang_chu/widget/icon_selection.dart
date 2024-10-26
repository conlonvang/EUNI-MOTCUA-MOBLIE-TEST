import 'package:euni_core_ui/euni_core_ui.dart';
import 'package:flutter/material.dart';

class IconSelection extends StatefulWidget {
  final Color color;
  final IconData icon;
  final String title;
  final Function() onTap;
  const IconSelection({super.key, required this.color, required this.icon, required this.title, required this.onTap});

  @override
  State<IconSelection> createState() => _IconSelectionState();
}

class _IconSelectionState extends State<IconSelection> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: widget.color,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              width: 90.w,
              height: 90.h,
              child: Center(
                child: Icon(
                  widget.icon,
                  size: 40.sp,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Flexible(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 130.w,
                maxHeight: 40.h,
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    shadows: const <Shadow>[
                      Shadow(
                        offset: Offset(5, 5),
                        blurRadius: 10.0,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
