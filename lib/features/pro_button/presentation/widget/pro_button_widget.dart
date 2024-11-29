import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProButtonWidget extends StatelessWidget {
  const ProButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 56,
      left: 235,
      child: GestureDetector(
        onTap: (){
          Navigator.push(
            context, 
            MaterialPageRoute(
                builder: (context) => Container(color: Colors.blue,),
            )
          );
        },
      child: Container(
        width: 78,
        height: 32,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF6E2AFF),
              Color(0xFF2AB2FF),
              Color(0xFF2AFFF2),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Button chính (nền)
            Container(
              margin: EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            // Khung bên trong
            Positioned(
              top: 8,
              left: 12,
              child: Column(
                children: [
                  Container(
                    width: 53,
                    height: 16,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        width: 1,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 2.87,
                          left: 0.03,
                          child: Image.asset(
                            'assets/images/pro.png',
                            width: 15.87  ,
                            height: 13.13,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          top: 0,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'PRO',
                              style: TextStyle(
                                fontFamily: 'PlusJakartaSans-Italic',
                                fontWeight: FontWeight.w800,
                                height: 20/14,
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ),
                  const Gap(6),
                ],
              )
            ),
          ],
        ),
      ),
      )
    );
  }
}
