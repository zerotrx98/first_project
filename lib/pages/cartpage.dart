import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myproject/pages/sellpage.dart';

import '../lists/cartList.dart';

ValueNotifier<List<PetsModel>> FavoriteListNotifier = ValueNotifier([]);

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: FavoriteListNotifier,
      builder: (BuildContext context, List<PetsModel> newValue, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("FAVORITES"),
          ),
          body: ListView.builder(
            itemCount: newValue.length,
            itemBuilder: (BuildContext context, int index) {
              final data = newValue[index];
              return ListTile(
                tileColor: Colors.white10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                leading: Container(
                  height: MediaQuery.of(context).size.height * .16,
                  width: MediaQuery.of(context).size.width * .3,
                  decoration: BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                      image: data.images,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                title: Text(
                  data.name,
                  style: TextStyle(fontSize: 18),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    Text(
                      data.price.toString(),
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(Icons.remove_circle_outline),
                  onPressed: () {
                    FavoriteListNotifier.value.remove(data);
                    FavoriteListNotifier.notifyListeners();
                  },
                ),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (newValue.isNotEmpty) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PurchaseScreen(
                      newValue[0].name,
                      newValue[0].price,
                      newValue[0].images,
                    ),
                  ),
                );
              }
            },
            child: Icon(Icons.shopping_cart),
          ),
        );
      },
    );
  }
}
