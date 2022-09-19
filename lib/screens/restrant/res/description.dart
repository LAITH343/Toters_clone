import 'package:flutter/material.dart';
import 'package:toters_clone/screens/restrant/restrantPage.dart';

class RestrantDescription extends StatelessWidget {
  const RestrantDescription({
    Key? key,
    required this.widget,
    required this.rate,
    required this.rate_count,
  }) : super(key: key);

  final RestrantHomePage widget;
  final double? rate;
  final int? rate_count;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              widget.label,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              child: Text(
                widget.desc,
                style: TextStyle(
                  color: Colors.grey.withOpacity(0.9),
                  fontSize: 16,
                ),
                textAlign: TextAlign.start,
                textDirection: TextDirection.ltr,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "$rate",
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              for (int i = 0; i < rate!; i++)
                                const Icon(
                                  Icons.star,
                                  size: 25,
                                  color: Color(0xff5fd1bb),
                                ),
                              for (int i = 0; i < rate! - 5; i++)
                                Icon(
                                  Icons.star,
                                  size: 25,
                                  color: Colors.grey.withOpacity(0.4),
                                ),
                            ],
                          ),
                          Text(
                            "Based on $rate_count ratings",
                            style: TextStyle(
                                fontSize: 11,
                                color: Colors.black.withOpacity(0.8)),
                          )
                        ],
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Color(0xff5fd1bb),
                    size: 15,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Container(
              height: 3,
              color: Colors.grey.withOpacity(0.1),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                textDirection: TextDirection.ltr,
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "mustafa",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.star,
                    size: 15,
                    color: Color(0xff5fd1bb),
                  ),
                  Icon(
                    Icons.star,
                    size: 15,
                    color: Color(0xff5fd1bb),
                  ),
                  Icon(
                    Icons.star,
                    size: 15,
                    color: Color(0xff5fd1bb),
                  ),
                  Icon(
                    Icons.star,
                    size: 15,
                    color: Color(0xff5fd1bb),
                  ),
                  Icon(
                    Icons.star,
                    size: 15,
                    color: Color(0xff5fd1bb),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "وقت قياسي في التجهيز وخدمة ممتازة",
                style: TextStyle(color: Colors.black.withOpacity(0.7)),
              )
            ],
          )
        ],
      ),
    );
  }
}
