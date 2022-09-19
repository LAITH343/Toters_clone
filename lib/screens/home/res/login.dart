import 'package:flutter/material.dart';

class LoginMessage extends StatelessWidget {
  const LoginMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: const [
              Icon(
                Icons.login,
                color: Colors.green,
                size: 20,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Sign in with Toters and enjoy exclusive benefits!",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
