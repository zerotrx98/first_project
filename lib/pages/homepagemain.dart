import 'package:flutter/material.dart';
import 'package:flutter_image_slider/carousel.dart';
import 'package:myproject/pages/cartpage.dart';
import 'package:myproject/pages/search.dart';

import '../LoginFireBase/LoginPage.dart';
import '../lists/alloffers.dart';
import 'Appbar.dart';
import 'animalgridkist.dart';
import '../lists/listofanimals.dart';
import '../lists/offerimageslist.dart';

class CustomScroll extends StatelessWidget {
  final List<dynamic> records;
  final List<dynamic> offer;
  final List<Widget> offerimages;
  final List<dynamic> secondOfferImages;
  final List<dynamic> imageUrls;
  final List<dynamic> listOfAnimals;
  final List<dynamic> offerThid;

  const CustomScroll(
      this.records,
      this.offer,
      this.offerimages,
      this.secondOfferImages,
      this.imageUrls,
      this.listOfAnimals,
      this.offerThid,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onCartPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Favourite()),
          );

          // Handle cart button pressed
        },
        onLoginPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        },
        onSearchPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SearchScreen(
                  IteamsList().smallAnimalsList,
                ),
              ));
          // Handle search button pressed
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  SizedBox(
                      height: MediaQuery.of(context).size.height * .20,
                      child: Carousel(
                        indicatorBarColor: Colors.transparent,
                        autoScrollDuration: const Duration(seconds: 2),
                        animationPageDuration:
                            const Duration(milliseconds: 300),
                        activateIndicatorColor: Colors.black,
                        animationPageCurve: Curves.bounceInOut,
                        indicatorBarHeight: 10,
                        indicatorHeight: 20,
                        indicatorWidth: 20,
                        unActivatedIndicatorColor: Colors.grey,
                        stopAtEnd: false,
                        autoScroll: true,
                        items: offerimages,
                      )),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.16,
                width: MediaQuery.of(context).size.width * 3,
                color: Colors.white,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: List.generate(records.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductGrid(index == 0
                                  ? IteamsList().dogsList
                                  : index == 1
                                      ? IteamsList().catList
                                      : index == 2
                                          ? IteamsList().birdsList
                                          : index == 3
                                              ? IteamsList().fishList
                                              : IteamsList().smallAnimalsList),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: MediaQuery.of(context).size.height*.1,
                                width: MediaQuery.of(context).size.width*.2,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: records[index]["images"])),
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(records[index]["name"])

//  Text(details[index]["names"])
                          ],
                        ),
                      ),
                    );
                  })),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height*.2,
                width: MediaQuery.of(context).size.width*1,
                color: Colors.white,
                child: Row(
                    children: List.generate(3, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductGrid(index == 0
                                    ? OffersThrid().dryfoods
                                    : index == 1
                                        ? OffersThrid().chewToy
                                        : OffersThrid().tick),
                              ),
                            );
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 50,
                            width: MediaQuery.of(context).size.width * .28,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: offer[index]["images"])),
                          ),
                        ),
                      ],
                    ),
                  );
                })),
              ),
              const SizedBox(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductGrid(Deools().drools)));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * .20,
                  width: MediaQuery.of(context).size.width * 30,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            "https://i0.wp.com/img.paisawapas.com/ovz3vew9pw/2022/07/14160848/Drools.png?resize=1269%2C491&ssl=1")),
                  ),
                ),
              ),
              ImageContainer(OfferImages().secondOfferImages),
              Container(
                  alignment: Alignment.center,
                  height: 750,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: imageUrls.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1, // width/height
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductGrid(index == 0
                                  ? IteamsList().dogsList
                                  : index == 1
                                      ? IteamsList().catList
                                      : index == 2
                                          ? IteamsList().birdsList
                                          : index == 3
                                              ? IteamsList().fishList
                                              : IteamsList().smallAnimalsList),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                            imageUrls[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
