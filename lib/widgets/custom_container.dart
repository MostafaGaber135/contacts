import 'package:contact_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.name,
    required this.phone,
  });
  final String name, phone;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          35,
        ),
      ),
      child:  Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: 'Name : $name',
            ),
            CustomText(
              text: 'Phone : $phone',
            ),
          ],
        ),
      ),
    );
  }
}
