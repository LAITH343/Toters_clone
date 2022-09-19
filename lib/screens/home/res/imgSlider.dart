import 'package:flutter/material.dart';
import 'package:flutter_custom_carousel_slider/flutter_custom_carousel_slider.dart';
import 'package:toters_clone/modules/offer.dart';

int Cindex = 0;

CarouselItem sliderimgMaker(String imgpath) {
  return CarouselItem(
    image: NetworkImage(
      imgpath,
    ),
    boxDecoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
    onImageTap: (i) {},
  );
}

class SliedsImages extends StatefulWidget {
  const SliedsImages({Key? key}) : super(key: key);

  @override
  State<SliedsImages> createState() => _SliedsImagesState();
}

class _SliedsImagesState extends State<SliedsImages> {
  bool offersloaded = false;
  List<CarouselItem> offers = [];
  getOffers() async {
    List<Offer> res = await OfferApi().getoffers();
    if (res.isNotEmpty) {
      for (int i = 0; i < res.length; i++) {
        offers.add(sliderimgMaker(res[i].imgurl));
      }
    }
    if (offers != []) {
      setState(() {
        offersloaded = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getOffers();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 180,
        child: Visibility(
          visible: offersloaded,
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
          child: CustomCarouselSlider(
            showSubBackground: false,
            items: offers,
            height: 150,
            subHeight: 50,
            autoplay: true,
          ),
        ),
      ),
    );
  }
}
