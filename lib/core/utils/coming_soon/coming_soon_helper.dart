import 'package:flutter/material.dart';

class ComingSoonHelper {
  static void showComingSoonDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(40),
          decoration: BoxDecoration(
            color: Color(0xFF1A1A1A),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 40,
                child: Image.asset(
                  'assets/images/icon_coming_soon.png',
                  fit: BoxFit.scaleDown,
                ),
              ),
              Text(
                'Coming Soon',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "We're working hard to bring this feature to you soon. "
                    "Thank you for your patience and support.",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 14,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 20),
              // Căn giữa nút "Ok" trong row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 100), // Khoảng cách của nút
                    ),
                    child: Text(
                      'Ok',
                      style: TextStyle(
                        color: Colors.white, // Màu chữ của nút
                        fontSize: 16, // Kích thước chữ của nút
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
