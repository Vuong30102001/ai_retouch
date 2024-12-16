import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ToggleIconWidget extends StatefulWidget {
  const ToggleIconWidget({super.key});

  @override
  State<ToggleIconWidget> createState() => _ToggleIconWidgetState();
}

class _ToggleIconWidgetState extends State<ToggleIconWidget> {
  bool _isToggled = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: (){
          setState(() {
            _isToggled = !_isToggled;
          });
        },
        child: Icon(
          _isToggled ? Icons.toggle_on_outlined : Icons.toggle_off_outlined,
          color: _isToggled ? Colors.green : Colors.grey,
          size: 40.sp,
        ),
      ),
    );
  }
}
