import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  const CustomButton({super.key, required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.sizeOf(context);
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.blue,
            blurRadius: 5,
            spreadRadius: 0,
          ),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          minimumSize: Size(media.width, 50),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        onPressed: onTap,
        child: Text(
          title,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
