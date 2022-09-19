import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> offers = [
    "images/pic1.png",
    "images/pic2.png",
    "images/pic1.png",
    "images/pic2.png",
    "images/pic1.png",
    "images/pic2.png",
    "images/pic1.png",
    "images/pic2.png",
    "images/pic1.png",
    "images/pic2.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.search,
          color: Colors.black,
          size: 25,
        ),
        title: const TextField(
          decoration: InputDecoration(
              border: InputBorder.none, hintText: "Search for stores or item"),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 100,
            color: const Color(0xff00b68d),
            child: Row(
              children: [
                Container(
                  height: 90,
                  width: 100,
                  decoration: const BoxDecoration(
                      color: Color(0xff00b68d),
                      image: DecorationImage(
                          image: AssetImage("images/searchbanner.png"),
                          fit: BoxFit.cover)),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Anlyze orders",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 200,
                      child: const Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 25,
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: offers.length,
              itemBuilder: (BuildContext context, index) {
                return SearchCard(offers[index]);
              },
            ),
          )
        ],
      ),
    );
  }

  Padding SearchCard(String img) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Row(children: [
          Container(
            height: 100,
            width: 180,
            decoration: BoxDecoration(
                color: Colors.green,
                image:
                    DecorationImage(image: AssetImage(img), fit: BoxFit.cover)),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Order anything",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Flexible(
                child: SizedBox(
                  width: 100,
                  child: Text(
                    " Lorem Ipsum is simply",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              const Text(
                "52 متجر",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
