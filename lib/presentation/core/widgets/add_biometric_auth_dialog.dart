import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> addBiometricAuthDialog() async {
  bool addBiometricAuth = false;
  await Get.dialog(
    Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        height: 180,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Material(
            elevation: 0,
            color: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Signed in Successfully',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text('Would you like to add biometric authentication?'),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        addBiometricAuth = false;
                        Get.back();
                      },
                      child: Container(
                        width: 70,
                        height: 30,
                        child: Center(
                          child: Text('No'),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        addBiometricAuth = true;
                        Get.back();
                      },
                      child: Container(
                        width: 70,
                        height: 30,
                        child: Center(
                          child: Text('Yes'),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ),
    barrierDismissible: false,
  );
  return addBiometricAuth;
}
