import 'package:flutter/material.dart';
import 'package:toters_clone/modules/event.dart';
import 'package:toters_clone/modules/restrant.dart';
import 'package:toters_clone/screens/restrant/restrantPage.dart';

class RestCollection extends StatefulWidget {
  Event eventdata;
  RestCollection({
    required this.eventdata,
  });

  @override
  State<RestCollection> createState() => _RestCollectionState();
}

class _RestCollectionState extends State<RestCollection> {
  bool dataloaded = false;
  List<Restrant> restrants_data = [];
  getRstrantsInfo() async {
    List<String> restarntsList = widget.eventdata.restrantsList.split(",");
    for (int i = 0; i < restarntsList.length; i++) {
      Restrant? res = await RestrantApi().getRestrantsByName(restarntsList[i]);
      if (res != null) {
        setState(() {
          restrants_data.add(res);
        });
      }
    }
    setState(() {
      dataloaded = true;
    });
  }

  @override
  void initState() {
    super.initState();
    getRstrantsInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        height: 350,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: TextButton(
                onPressed: () {},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              widget.eventdata.header,
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                              textDirection: TextDirection.ltr,
                            ),
                          ),
                          const Icon(Icons.arrow_forward_ios,
                              color: Colors.blue, size: 20),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
                      child: Container(
                        child: Text(
                          widget.eventdata.subheader,
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black.withOpacity(0.5)),
                          textAlign: TextAlign.start,
                          textDirection: TextDirection.ltr,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Visibility(
              visible: dataloaded,
              replacement: const Center(child: CircularProgressIndicator()),
              child: Expanded(
                child: ListView(scrollDirection: Axis.horizontal, children: [
                  if (dataloaded)
                    for (int i = 0; i < restrants_data.length; i++)
                      FoodCard(
                        context,
                        restrants_data[i].restrantImg,
                        restrants_data[i].restrantName,
                        restrants_data[i].restrantType,
                        "",
                        "\$\$",
                        restrants_data[i].makeTime.split(";")[0],
                        restrants_data[i].makeTime.split(";")[1],
                        "5",
                        restrants_data[i].restrantDesc,
                      ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding FoodCard(
    var context,
    String Imageasset,
    String foodName,
    String foodType,
    String foodcatgo,
    String foodPrice,
    String Time,
    String Timehourmin,
    String foodRate,
    String desc,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => RestrantHomePage(
                      imageasset: Imageasset,
                      Timehourmin: Timehourmin,
                      desc: desc,
                      label: foodName,
                      time: Time,
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
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: 135,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(Imageasset),
                                fit: BoxFit.cover)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        foodName,
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: Text(
                          foodPrice,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 15),
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
                          "$foodType, $foodcatgo",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 15),
                        ),
                      ),
                    ],
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
                            Time,
                            style: const TextStyle(
                                fontSize: 14, color: Colors.black),
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          Timehourmin,
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
    );
  }
}
