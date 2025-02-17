import 'package:flutter/material.dart';
import 'package:fourincare/account/controller/account_c.dart';
import 'package:get/get.dart';

class AccountDetailsPage extends StatelessWidget {
  final String firstName = "John";
  final String lastName = "Doe";
  final String email = "john.doe@example.com";

  @override
  Widget build(BuildContext context) {
    final accC = Get.put(AccountController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Details'),
      ),
      body: GetBuilder<AccountController>(
        initState: (state) {
          accC.getValue();
        },
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'First Name: ${accC.fname}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Last Name: ${accC.lname}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Email: ${accC.email}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
