import 'package:flutter/material.dart';
import 'package:toters_clone/screens/restrant/restrantPage.dart';

class RestrantBanner extends StatelessWidget {
  const RestrantBanner({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final RestrantHomePage widget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        RestrantImage(context),
        DelevireTime(),
        RestrantAppBar(context)
      ],
    );
  }

  Padding RestrantAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(
                        Icons.search_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(
                        Icons.share,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(
                        Icons.favorite_border,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Positioned DelevireTime() {
    return Positioned(
      right: 20,
      bottom: -10,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 0.5,
                  spreadRadius: 0.7)
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  widget.time,
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                widget.Timehourmin,
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.withOpacity(0.6),
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container RestrantImage(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3),
          image: DecorationImage(
              image: NetworkImage(widget.imageasset), fit: BoxFit.cover)),
    );
  }
}
