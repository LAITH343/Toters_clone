import 'package:flutter/material.dart';
import 'package:toters_clone/modules/restrant.dart';
import 'package:toters_clone/screens/restrant/restrantPage.dart';

class RestrantCard extends StatefulWidget {
  Restrant data;
  RestrantCard({
    required this.data,
  });

  @override
  State<RestrantCard> createState() => _RestrantCardState();
}

class _RestrantCardState extends State<RestrantCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: SizedBox(
        child: TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => RestrantHomePage(
                        imageasset: widget.data.restrantImg,
                        Timehourmin: widget.data.makeTime.split(";")[1],
                        desc: widget.data.restrantDesc,
                        label: widget.data.restrantName,
                        time: widget.data.makeTime.split(";")[0],
                      )));
            },
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 135,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(widget.data.restrantImg),
                                  fit: BoxFit.cover)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          widget.data.restrantName,
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3),
                          child: Text(
                            "\$\$",
                            style: TextStyle(
                                color: Colors.black, fontSize: 12),
                          ),
                        ),
                        Container(
                          height: 5,
                          width: 5,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.black),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3),
                          child: Text(
                            widget.data.restrantType,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
                Positioned(
                  right: 15,
                  top: 90,
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
                              widget.data.makeTime.split(";")[0],
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.black),
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            widget.data.makeTime.split(";")[1],
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey.withOpacity(0.6),
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 20,
                  child: GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.favorite_outline,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
