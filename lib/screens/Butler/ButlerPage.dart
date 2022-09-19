import 'package:flutter/material.dart';

class ButlerPage extends StatefulWidget {
  const ButlerPage({Key? key}) : super(key: key);

  @override
  State<ButlerPage> createState() => _ButlerPageState();
}

class _ButlerPageState extends State<ButlerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              color: const Color(0xff00b68d),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: const Text(
                          "We deleiver anything that fits on a motorbike!",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Text(
                "Request a butler to:",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            DeliverMethodsCard(
                "Deliver your stuff",
                "e.g. You forgot your keys at home and need to get them deilvered to the office",
                "images/delevier_thing_img.png"),
            DeliverMethodsCard(
                "Buy something",
                "Didn't find what you were looking fo at our stores? Our butlers can buy whatever you need from your store of choice",
                "images/buy_thing_img.png"),
          ],
        ),
      ),
    );
  }

  Padding DeliverMethodsCard(
      String HeadText, String SubHeadText, String Imageassetpath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Color(0xfff8f6f8),
                    blurRadius: 2,
                    offset: Offset(2, 1))
              ]),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        HeadText,
                        style: const TextStyle(
                            color: Color(0xff00b68d),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        SubHeadText,
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.4),
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ),
                Image(
                  image: AssetImage(Imageassetpath),
                  width: 70,
                  height: 70,
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: Color(0xff00b68d),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
