import 'package:contact_app/widgets/custom_button.dart';
import 'package:contact_app/widgets/custom_container.dart';
import 'package:contact_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  List<Map<String, String>> contacts = [];
  final bool isFirstVisible = false;
  final bool isSecondVisible = false;
  final bool isThirdVisible = false;

  void addContact() {
    if (contacts.length < 3) {
      final String name = nameController.text;
      final String phone = phoneController.text;
      if (name.isNotEmpty && phone.isNotEmpty) {
        setState(() {
          contacts.add({
            'name': name,
            'phone': phone,
          });
        });
        nameController.clear();
        phoneController.clear();
      }
    }
  }

  void deleteContact() {
    if (contacts.isNotEmpty) {
      setState(() {
        contacts.removeLast();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(
        0XFF5885af,
      ),
      appBar: AppBar(
        backgroundColor: const Color(
          0XFF41729f,
        ),
        title: const Text(
          'Contacts',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,
        ),
        child: Column(
          children: [
            CustomTextField(
              controller: nameController,
              hintText: 'Enter Your Name Here',
              icon: Icons.edit,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: phoneController,
              isNumeric: true,
              hintText: 'Enter Your Number Here',
              icon: Icons.call,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                children: [
                  CustomButton(
                    onPressed: addContact,
                    text: 'Add',
                    color: const Color(
                      0XFF75e6da,
                    ),
                  ),
                  const Spacer(),
                  CustomButton(
                    onPressed: deleteContact,
                    text: 'Delete',
                    color: const Color(
                      0XFFc3e0e5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            if (contacts.isNotEmpty)
              Visibility(
                visible: !isFirstVisible,
                child: CustomContainer(
                  name: contacts[0]['name']!,
                  phone: contacts[0]['phone']!,
                ),
              ),
            const SizedBox(height: 30),
            if (contacts.length > 1)
              Visibility(
                visible: !isSecondVisible,
                child: CustomContainer(
                  name: contacts[1]['name']!,
                  phone: contacts[1]['phone']!,
                ),
              ),
            const SizedBox(height: 30),
            if (contacts.length > 2)
              Visibility(
                visible: !isThirdVisible,
                child: CustomContainer(
                  name: contacts[2]['name']!,
                  phone: contacts[2]['phone']!,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
