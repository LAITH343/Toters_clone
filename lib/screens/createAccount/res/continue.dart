import 'package:flutter/material.dart';
import 'package:toters_clone/screens/createAccount/twoFauth.dart';

class ContinueBottom extends StatelessWidget {
  const ContinueBottom({
    Key? key,
    required this.PhoneNumberCont,
    required this.UserNameCont,
  }) : super(key: key);

  final TextEditingController PhoneNumberCont;
  final TextEditingController UserNameCont;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 25, bottom: 10),
      child: ElevatedButton(
        onPressed:
            PhoneNumberCont.text.length == 11 && UserNameCont.text.isNotEmpty
                ? () {
                    if (UserNameCont.text.isNotEmpty) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => TwoFactorAuth(
                                phoneNumber: PhoneNumberCont.text,
                                UserName: UserNameCont.text,
                              )));
                    }
                  }
                : null,
        style: ElevatedButton.styleFrom(
          primary: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Container(
          height: 50,
          alignment: Alignment.center,
          child: const Text(
            "Continue",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
