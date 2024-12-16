import 'package:ai_retouch/features/remove_object/presentation/widget/brush_remove_object.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskBarRemoveObject extends StatefulWidget {
  final Function(Widget) onButtonPressed;
  const TaskBarRemoveObject({super.key, required this.onButtonPressed});

  @override
  State<TaskBarRemoveObject> createState() => _TaskBarRemoveObjectState();
}

class _TaskBarRemoveObjectState extends State<TaskBarRemoveObject> {
  List<bool> _selectedState = List.generate(5, (index) => false);

  Widget _getWidgetByIndex (int index){
    switch (index){
      case 1:
        return const BrushRemoveObject();
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildButton(
              index: 0,
              icon: Icons.auto_awesome,
              label: 'Auto AI'
            ),
            _buildButton(
                index: 1,
                icon: Icons.brush_outlined,
                label: 'Brush'
            ),
            _buildButton(
                index: 2,
                icon: Icons.nest_cam_wired_stand_outlined,
                label: 'Lasso'
            ),
            _buildButton(
                index: 3,
                icon: Icons.text_fields,
                label: 'Text',
            ),
            _buildButton(
                index: 4,
                icon: Icons.nest_cam_wired_stand,
                label: 'Wire'
            )
          ],
        ),
      ),
    );
  }

  Widget _buildButton({required int index, required IconData icon, required String label}){
    return Container(
      width: 50.w,
      height: 50.w,
      child: GestureDetector(
        onTap: (){
          setState(() {
            for(int i = 0; i < _selectedState.length; i++){
              _selectedState[i] = false;
            }
            _selectedState[index] = !_selectedState[index];

            widget.onButtonPressed(_getWidgetByIndex(index));
          });
        },
        child: Column(
          children: [
            Icon(
              icon,
              color: _selectedState[index] ? Colors.white : Colors.grey,
            ),
            SizedBox(height: 5.w,),
            Text(
              label,
              style: TextStyle(
                fontSize: 15.sp,
                color: _selectedState[index] ? Colors.white : Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
