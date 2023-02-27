import 'package:flutter/material.dart';
import '../lists/listofanimals.dart';
import 'animalgridkist.dart';

class SearchScreen extends StatefulWidget {
  final List<dynamic>listOfAnimals;

  SearchScreen(this.listOfAnimals);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _controller = TextEditingController();
  String _query = '';
  List<dynamic> searchList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        actions: [
          IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              setState(() {
                _controller.clear();
                _query = '';
                searchList = [];
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _query = value.toLowerCase();
                });
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_query == 'dog') {
                searchList = IteamsList().dogsList;
              } else if (_query == 'cat') {
                searchList = IteamsList().catList;
              } else if (_query == 'birds') {
                searchList = IteamsList().birdsList;
              } else if (_query == 'fish') {
                searchList = IteamsList().fishList;
              } else if (_query == 'small animal') {
                searchList = IteamsList().smallAnimalsList;
              } else {
                searchList = [];
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Error'),
                      content: Text('The animal you searched for was not found.'),
                      actions: <Widget>[
                        TextButton(
                          child: Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              }
              if (searchList.isNotEmpty) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductGrid(searchList),
                  ),
                );
              }
            },
            child: Text('Search'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
