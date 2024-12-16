import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrushRemoveObject extends StatefulWidget {
  const BrushRemoveObject({super.key});

  @override
  State<BrushRemoveObject> createState() => _BrushRemoveObjectState();
}

class _BrushRemoveObjectState extends State<BrushRemoveObject> {
  double _currentSlider = 20;
  List<bool> _selected = List.generate(2, (index) => false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selected[0] = !_selected[0];
                    if(_selected[0] = true){
                      _selected[1] = false;
                    }
                  });
                },
                child: Container(
                  width: 40.w,
                  height: 40.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: _selected[0] ? Colors.blue : Colors.grey.withOpacity(0.1),
                  ),
                  child: Icon(
                    Icons.brush_outlined,
                    size: 25.sp,
                    color: _selected[0] ? Colors.white : Colors.grey.withOpacity(0.8),
                  ),
                ),
              ),
              Container(
                  height: 40.w,
                  width: 250.w,
                  child: Center(
                    child: Slider(
                        value: _currentSlider,
                        max: 100,
                        divisions: 99,
                        onChanged: (double value){
                          setState(() {
                            _currentSlider = value;
                          });
                        }
                    ),
                  )
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selected[1] = !_selected[1];
                    if(_selected[1] = true){
                      _selected[0] = false;
                    }
                  });
                },
                child: Container(
                  width: 40.w,
                  height: 40.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: _selected[1] ? Colors.blue : Colors.grey.withOpacity(0.1),
                  ),
                  child: Icon(
                    Icons.brush_outlined,
                    size: 25.sp,
                    color: _selected[1] ? Colors.white : Colors.grey.withOpacity(0.8),
                  ),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
