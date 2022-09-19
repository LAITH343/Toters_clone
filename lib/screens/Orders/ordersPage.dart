import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  int _tabsIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: _tabsIndex,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          bottom: TabBar(
            labelColor: const Color(0xff00b68d),
            indicatorColor: const Color(0xff00b68d),
            unselectedLabelColor: Colors.black.withOpacity(0.3),
            tabs: const [
              Tab(
                text: "Past Orders",
              ),
              Tab(
                text: "Incoming Orders",
              ),
            ],
            onTap: (index) {
              setState(() {
                _tabsIndex = index;
              });
            },
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Center(
                    child: Text(
                      "You don't have any past Orders",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Center(
                    child: Image(
                      image: AssetImage("images/orders_img.png"),
                      width: 200,
                      height: 200,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
