import 'package:agri_mart/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed('/home');
          },
          child: Image.asset(
            'assets/logo.png',
            height: screenHeight * 0.05,
          ),
        ),
        SizedBox(
          width: screenWidth * 0.08,
        ),
        Expanded(
          child: Container(
            height: screenHeight * 0.05,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              decoration: InputDecoration(
                suffixIcon: const Icon(Icons.search, color: primaryColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: primaryColor),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: screenWidth * 0.08,
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed('/user_panel/notification');
          },
          child: Icon(
            Icons.notifications,
            color: primaryColor,
            size: screenWidth * 0.08,
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed('/user_panel/cart');
          },
          child: Icon(Icons.shopping_cart,
              color: primaryColor, size: screenWidth * 0.08),
        ),
      ],
    );
  }
}
