import 'package:ai_retouch/features/remove_object/presentation/widget/task_bar_remove_object.dart';
import 'package:ai_retouch/features/remove_object/presentation/widget/toggle_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ToolRemoveObjectWidget extends StatefulWidget {
  const ToolRemoveObjectWidget({super.key});

  @override
  State<ToolRemoveObjectWidget> createState() => _ToolRemoveObjectWidgetState();
}

class _ToolRemoveObjectWidgetState extends State<ToolRemoveObjectWidget> {
  Widget _currentWidget = const SizedBox();

  void _updateWidget(Widget newWidget){
    setState(() {
      _currentWidget = newWidget;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40.w,
          width: double.infinity,
          color: Colors.blue,
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              SizedBox(width: 20.w,),
              Text(
                'Advanced Eraser',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.sp,
                ),
              ),
              SizedBox(width: 200.w,),
              const ToggleIconWidget(),
            ],
          )
        ),
        Container(
          width: double.infinity,
          height: 50.w,
          color: Colors.grey.withOpacity(0.1),
          child:
            Row(
              children: [
                SizedBox(width: 20.w,),
                Container(
                  width: 30.w,
                  height: 30.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.3),
                      width: 1.5,
                    )
                  ),
                  child: Icon(
                    Icons.brush_outlined,
                    color: Colors.grey.withOpacity(0.3),
                    size: 20.sp,
                  ),
                ),
                SizedBox(width: 90.w,),
                Container(
                  width: 120.w,
                  height: 30.w,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),  // Màu nền
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      width: 1.5,
                      color: Colors.grey.withOpacity(0.1),
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 5.w),
                      Image.asset(
                        'assets/images/icon_eraser.png',
                        width: 30.w,
                        height: 30.w,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 2.w,),
                      Text(
                        'Remove',
                        style: TextStyle(
                          color: Colors.grey.withOpacity(0.3),
                          fontSize: 20.sp,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(width: 60.w,),
                Container(
                  width: 30.w,
                  height: 30.w,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.3),
                        width: 1.5,
                      )
                  ),
                  child: Icon(
                    Icons.compare,
                    color: Colors.white,
                    size: 20.sp,
                  ),
                )
              ],
            )
          ),
        SizedBox(
          height: 40.w,
          child:_currentWidget,
        ),
        SizedBox(
          height: 60.w,
          child: TaskBarRemoveObject(
            onButtonPressed: _updateWidget,
          ),
        )
      ],
    );
  }
}
