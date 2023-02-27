import 'package:flutter/material.dart';

import 'buydetailspage.dart';

class ProductGrid extends StatelessWidget {
  final List<dynamic> products;

  const ProductGrid(
    this.products,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(
          products.length,
          (index) => Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BuyScreeen(
                          products[index]["images"],
                          products[index]["price"],
                          products[index]["names"],
                          products[index]["KEY FEATURES"]),
                    ));
              },
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height*.12,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        image:
                            DecorationImage(image: products[index]["images"])),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: 30,
                      width: 150,
                      decoration: BoxDecoration(color: Colors.white10),
                      child: Text(
                        products[index]["names"],
                        style: TextStyle(
                            color: Colors.black, fontStyle: FontStyle.italic),
                      )),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('\u{20B9}  ', style: TextStyle(color: Colors.red, fontSize: 18)),
                      Text(products[index]["price"].toString(), style: TextStyle(color: Colors.red, fontSize: 18)),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
