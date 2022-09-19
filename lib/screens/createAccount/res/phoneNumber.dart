import 'package:flutter/material.dart';

class InputPhoneNumber extends StatelessWidget {
  const InputPhoneNumber({
    Key? key,
    required this.PhoneNumberCont,
  }) : super(key: key);

  final TextEditingController PhoneNumberCont;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(color: Colors.grey.withOpacity(0.3))),
        child: Row(
          children: [
            const SizedBox(
              width: 4,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                "+964",
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ),
            Expanded(
              child: TextFormField(
                maxLength: 11,
                controller: PhoneNumberCont,
                keyboardType: TextInputType.datetime,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  prefixIconColor: Colors.green,
                  counterText: "",
                  hintText: "Phone Number",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
