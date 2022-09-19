import 'package:flutter/material.dart';
import 'package:toters_clone/mainData.dart';
import 'package:toters_clone/modules/user.dart';
import 'package:toters_clone/screens/home/home.dart';

class TwoFactorAuth extends StatefulWidget {
  String phoneNumber;
  String UserName;
  TwoFactorAuth({
    required this.phoneNumber,
    required this.UserName,
  });

  @override
  State<TwoFactorAuth> createState() => _TwoFactorAuthState();
}

class _TwoFactorAuthState extends State<TwoFactorAuth> {
  TextEditingController digit1Cont = TextEditingController();
  TextEditingController digit2Cont = TextEditingController();
  TextEditingController digit3Cont = TextEditingController();
  TextEditingController digit4Cont = TextEditingController();

  Future<bool> adduser() async {
    bool res = await UserApi().addUser(widget.UserName, widget.phoneNumber);
    if (res) {
      setState(() {
        user_name = widget.UserName;
        user_phone = widget.phoneNumber;
      });
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.2,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Text(
                          "Enter your phone number",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: const Text(
                            "Enter the code you have recevied via WhatsApp on +9647817770459",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AuthInput(digit1Cont),
                        AuthInput(digit2Cont),
                        AuthInput(digit3Cont),
                        AuthInput(digit4Cont),
                      ],
                    ),
                  ),
                  if (digit1Cont.text.isNotEmpty &&
                      digit2Cont.text.isNotEmpty &&
                      digit3Cont.text.isNotEmpty &&
                      digit4Cont.text.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: ElevatedButton(
                        onPressed: () async {
                          bool res = await adduser();
                          if (res) {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()));
                          }
                        },
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
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                ],
              )),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("images/verfication.jpg"),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Didn't recevie a code?"),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          "Resend",
                          style: TextStyle(color: Colors.green),
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  SizedBox AuthInput(TextEditingController digitCont) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.22,
      height: 50,
      child: TextFormField(
        onChanged: (val) {
          setState(() {
            digitCont.text = val;
          });
        },
        textInputAction: TextInputAction.next,
        maxLength: 1,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.datetime,
        controller: digitCont,
        decoration: const InputDecoration(
            prefixIconColor: Colors.green,
            border: OutlineInputBorder(),
            counterText: ""),
      ),
    );
  }
}
