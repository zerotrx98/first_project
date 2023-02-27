import 'package:flutter/material.dart';

import 'package:myproject/lists/petlist.dart';



import '../LoginFireBase/LoginPage.dart';
import '../pages/cartpage.dart';
import '../pages/homepagemain.dart';

import '../pages/search.dart';

import 'cartList.dart';
import 'listofanimals.dart';
import 'offerimageslist.dart';

class PagesList {
  List<Widget> pages = [
    CustomScroll(
        PetsList().details,
        PetsList().offers,
        OfferImages().offerImages,
        OfferImages().secondOfferImages,
        OfferImages().imageUrls,
        IteamsList().smallAnimalsList,
        OffersThrid().chewToy),
    Favourite(),
    SearchScreen(  IteamsList().smallAnimalsList,
    ),
    LoginPage()
  ];
}
