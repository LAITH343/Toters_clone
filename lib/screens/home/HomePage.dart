import 'package:flutter/material.dart';
import 'package:toters_clone/modules/event.dart';
import 'package:toters_clone/modules/restrant.dart';
import 'package:toters_clone/screens/home/res/catogaryCard.dart';
import 'package:toters_clone/screens/home/res/imgSlider.dart';
import 'package:toters_clone/screens/home/res/login.dart';
import 'package:toters_clone/screens/home/res/restrantCollections.dart';
import 'package:toters_clone/screens/home/res/restrants.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.catogary,
  }) : super(key: key);

  final List<List> catogary;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool dataloaded = false;
  bool eventsloaded = false;

  List<Restrant>? restrants_list;

  getdata() async {
    List<Restrant> restrants = await RestrantApi().getRestrants();
    if (restrants.isNotEmpty) {
      setState(() {
        restrants_list = restrants;
        dataloaded = true;
      });
    }
  }

  List<Event>? events;

  getevents() async {
    List<Event> res = await EventsApi().getEvents();
    if (res.isNotEmpty) {
      setState(() {
        events = res;
        eventsloaded = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getdata();
    getevents();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const LoginMessage(),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView(
            children: [
              const SliedsImages(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  color: Colors.white,
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    direction: Axis.horizontal,
                    children: [
                      for (int i = 0; i < widget.catogary.length; i++)
                        CardMaker(context, widget.catogary[i][0],
                            widget.catogary[i][1]),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: eventsloaded,
                replacement: const Center(
                  child: CircularProgressIndicator(),
                ),
                child: Column(
                  children: [
                    if (eventsloaded)
                      for (int i = 0; i < events!.length; i++)
                        RestCollection(eventdata: events![i]),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  "Nearby",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              Visibility(
                visible: dataloaded,
                replacement: const Center(child: CircularProgressIndicator()),
                child: Column(
                  children: [
                    if (dataloaded)
                      for (int i = 0; i < restrants_list!.length; i++)
                        RestrantCard(data: restrants_list![i]),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
