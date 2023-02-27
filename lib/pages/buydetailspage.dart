import 'package:flutter/material.dart';
import 'package:myproject/pages/sellpage.dart';
import 'package:star_rating/star_rating.dart';

import '../lists/cartList.dart';
import '../lists/petbuy.dart';
import 'cartpage.dart';

class BuyScreeen extends StatefulWidget {
  final ImageProvider images;
  final dynamic price;
  final dynamic name;
  final String keyFe;

  BuyScreeen(this.images, this.price, this.name, this.keyFe);

  @override
  BuyScreeenState createState() => BuyScreeenState();
}

class BuyScreeenState extends State<BuyScreeen> {
  final _searchController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldMessengerState>();
  double rating = 3.5;
  final int starLength = 5;
  double _rating = 0.0;
  List<dynamic> cartDetails = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            flexibleSpace: FlexibleSpaceBar(),
            expandedHeight: 80.0,
            actions: <Widget>[
              IconButton(onPressed: () {}, icon: Icon(Icons.person)),
              IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart))
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                  image: DecorationImage(
                    image: widget.images,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: TextStyle(
                        fontFamily: 'Pacifico', // Custom font
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        letterSpacing: 1.5, // Add some spacing between letters
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.storefront,
                          color: Colors.grey[600],
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Sold by: Petsworld",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              "Rating: ",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              ),
                            ),
                            StarRating(
                              mainAxisAlignment: MainAxisAlignment.start,
                              length: starLength,
                              rating: _rating,
                              between: 5.0,
                              starSize: 25.0,
                              onRaitingTap: (rating) {
                                print('Clicked rating: $rating / $starLength');
                                setState(() {
                                  _rating = rating;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 2,
                      color: Colors.grey[300],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '\u{20B9}',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          widget.price.toString(),
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "(INCLUDES ALL TAXES)",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[600],
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      thickness: 2,
                      color: Colors.grey[300],
                    ),

                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Key Features:",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: widget.keyFe.split(',').map((feature) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.check, color: Colors.green, size: 18),
                                    SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        feature.trim(),
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),

                    Divider(),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Row(
                          children: <Widget>[
                            SizedBox(width: 10),
                            Icon(Icons.local_shipping, size: 30, color: Colors.green),
                            SizedBox(width: 10),
                            Text(
                              "Delivery: Usually delivered in 3-4 working days",
                              style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            SizedBox(width: 10),
                            Icon(Icons.payment, color: Colors.blue),
                            SizedBox(width: 10),
                            Text('Secure Payments', style: TextStyle(color: Colors.blue)),
                            SizedBox(width: 10),
                            Icon(Icons.local_shipping_outlined, size: 30, color: Colors.green),
                            SizedBox(width: 10),
                            Text(
                              "COD Available",
                              style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    Divider(),
                Container(
                  height: MediaQuery.of(context).size.height * .2,
                  width: MediaQuery.of(context).size.width * 3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white.withOpacity(0.9),
                        Colors.white.withOpacity(0.7),
                        Colors.white.withOpacity(0.5),
                        Colors.white.withOpacity(0.3),
                        Colors.white.withOpacity(0.1),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            addFavoriteclick(widget.name, widget.price, widget.images);
                            final text = "Item Added to Cart";
                            final snackBar = SnackBar(content: Text(text));
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);

                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Favourite()),
                            );
                          },
                          child: Container(
                            alignment: AlignmentDirectional.center,
                            height: MediaQuery.of(context).size.height * .06,
                            width: MediaQuery.of(context).size.width * .8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.redAccent,
                                  Colors.red,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue.withOpacity(0.4),
                                  blurRadius: 10,
                                  offset: Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Text(
                              "ADD TO CART",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PurchaseScreen(
                                widget.name,
                                widget.price,
                                widget.images,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          alignment: AlignmentDirectional.center,
                          height: MediaQuery.of(context).size.height * .06,
                          width: MediaQuery.of(context).size.width * .8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: LinearGradient(
                              colors: [
                                Colors.greenAccent,
                                Colors.green,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.4),
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Text(
                            "BUY",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          alignment: AlignmentDirectional.center,
                          height: MediaQuery.of(context).size.height * .15,
                          width: MediaQuery.of(context).size.width * .9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFE0EAFC),
                                Color(0xFFCFDEF3),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.verified_user, size: 50),
                                  SizedBox(height: 10),
                                  Text(
                                    "100% GENUINE",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.loop, size: 50),
                                  SizedBox(height: 10),
                                  Text(
                                    "EASY RETURNS",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
        Container(
          width: MediaQuery.of(context).size.height * .05,
          height: MediaQuery.of(context).size.width * .2,
          decoration: BoxDecoration(color: Colors.blue[900]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "© 2023 Petsworld All Rights Reserved",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "Location: New York, NY",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "Pets are not our whole life, but they make our lives whole. - Roger Caras",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        )


        ]),
          ),
        ],
      ),
    );
  }
}

addFavoriteclick(
    String name, dynamic price, ImageProvider images) {
  final data = PetsModel(name: name, price: price, images: images);
  FavoriteListNotifier.value.add(data);
  FavoriteListNotifier.notifyListeners();
}
