import 'package:flutter/material.dart';
import 'package:myproject/lists/cartList.dart';

class PurchaseScreen extends StatefulWidget {
  final String name;
  final double price;
  final ImageProvider image;


  PurchaseScreen(this.name, this.price, this.image, );

  @override
  _PurchaseScreenState createState() => _PurchaseScreenState();
}

class _PurchaseScreenState extends State<PurchaseScreen> {
  String _address = '';
  String _street = '';
  String _city = '';
  String _state = '';
  String _pinCode = '';
  String _paymentMethod = 'Credit Card';
  String _deliveryMethod = 'Express';
  String _cardNumber = '';
  bool _isCOD = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int count = 1;

  double getTotalPrice() {
    return widget.price * count;
  }

  void incrementCount() {
    setState(() {
      count++;
    });
  }

  void decrementCount() {
    if (count > 1) {
      setState(() {
        count--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Checkout"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  elevation: 4.0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: widget.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.name,
                                style:
                                TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                '\u{20B9} ${getTotalPrice()}',
                                style: TextStyle(fontSize: 20.0, color: Colors.red),
                              ),
                              SizedBox(height: 8.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Count: $count'),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          decrementCount();
                                        },
                                        icon: Icon(Icons.remove),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          incrementCount();
                                        },
                                        icon: Icon(Icons.add),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),


                Divider(),
                SizedBox(height: 30),

             Container(
               height: MediaQuery.of(context).size.height*.40,
               width: MediaQuery.of(context).size.width*3,
               decoration: BoxDecoration(
                 color: Colors.white,
                 boxShadow: [
               BoxShadow(
               color: Colors.grey.withOpacity(0.5), // shadow color
               spreadRadius: 2, // how much the shadow spreads
               blurRadius: 5, // how blurry the shadow is
               offset: Offset(0, 3), // offset the shadow to the right and bottom
             ),
              ],


               ),
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Column(
                   children: [
                     TextFormField(
                       decoration: InputDecoration(
                         border: OutlineInputBorder(),
                         labelText: 'Delivery Address',
                         hintText: 'Enter delivery address',
                       ),
                       validator: (value) {
                         if (value == null || value.isEmpty) {
                           return 'Please enter delivery address';
                         }
                         return null;
                       },
                       onSaved: (value) {
                         _address = value!;
                       },
                     ),
                     SizedBox(height: 16),
                     TextFormField(
                       decoration: InputDecoration( border: OutlineInputBorder(),
                         labelText: 'Street',
                         hintText: 'Enter street',
                       ),
                       validator: (value) {
                         if (value == null || value.isEmpty) {
                           return 'Please enter street';
                         }
                         return null;
                       },
                       onSaved: (value) {
                         _street = value!;
                       },
                     ),
                     SizedBox(height: 16),
                     Row(
                       children: [
                         Expanded(
                           child: TextFormField(
                             decoration: InputDecoration( border: OutlineInputBorder(),
                               labelText: 'City',
                               hintText: 'Enter city',
                             ),
                             validator: (value) {
                               if (value == null || value.isEmpty) {
                                 return 'Please enter city';
                               }
                               return null;
                             },
                             onSaved: (value) {
                               _city = value!;
                             },
                           ),
                         ),
                         SizedBox(width: 16),
                         Expanded(
                           child: TextFormField(
                             decoration: InputDecoration( border: OutlineInputBorder(),
                               labelText: 'State',
                               hintText: 'Enter state',
                             ),
                             validator: (value) {
                               if (value == null || value.isEmpty) {
                                 return 'Please enter state';
                               }
                               return null;
                             },
                             onSaved: (value) {
                               _state = value!;
                             },
                           ),
                         ),
                       ],
                     ),
                     SizedBox(height: 16),
                     TextFormField(
                       decoration: InputDecoration( border: OutlineInputBorder(),
                         labelText: 'PIN Code',
                         hintText: 'Enter PIN code',
                       ),
                       validator: (value) {
                         if (value == null || value.isEmpty) {
                           return 'Please enter PIN code';
                         }
                         return null;
                       },
                       onSaved: (value) {
                         _pinCode = value!;
                       },
                     ),
                   ],
             ),
               ),
             ),
                SizedBox(height: 30),

             Container(
               height: MediaQuery.of(context).size.height*.40,
               width: MediaQuery.of(context).size.width*3,
               decoration: BoxDecoration(
                 color: Colors.white,
                 boxShadow: [
                   BoxShadow(
                     color: Colors.grey.withOpacity(0.5), // shadow color
                     spreadRadius: 2, // how much the shadow spreads
                     blurRadius: 5, // how blurry the shadow is
                     offset: Offset(0, 3), // offset the shadow to the right and bottom
                   ),
                 ],


               ),





               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Column(
                   children: [
                     Text(
                       'Payment Method:',
                       style: TextStyle(fontSize: 18),
                     ),
                     SizedBox(height: 8),
                     Row(
                       children: [
                         Expanded(
                           child: RadioListTile(
                             title: Text('Credit Card'),
                             value: 'Credit Card',
                             groupValue: _paymentMethod,
                             onChanged: (String? value) {
                               setState(() {
                                 _paymentMethod = value!;
                               });
                             },
                           ),
                         ),
                         Expanded(
                           child: RadioListTile(
                             title: Text('Cash on Delivery'),
                             value: 'Cash on Delivery',
                             groupValue: _paymentMethod,
                             onChanged: (String? value) {
                               setState(() {
                                 _paymentMethod = value!;
                                 _isCOD = true;
                               });
                             },
                           ),
                         ),
                       ],
                     ),
                     SizedBox(height: 16),
                     Text(
                       'Delivery Method:',
                       style: TextStyle(fontSize: 18),
                     ),
                     SizedBox(height: 8),
                     Row(
                       children: [
                         Expanded(
                           child: RadioListTile(
                             title: Text('Express'),
                             value: 'Express',
                             groupValue: _deliveryMethod,
                             onChanged: (String? value) {
                               setState(() {
                                 _deliveryMethod = value!;
                               });
                             },
                           ),
                         ),
                         Expanded(
                           child: RadioListTile(
                             title: Text('Standard'),
                             value: 'Standard',
                             groupValue: _deliveryMethod,
                             onChanged: (String? value) {
                               setState(() {
                                 _deliveryMethod = value!;
                               });
                             },
                           ),
                         ),
                       ],
                     ),
                     SizedBox(height: 16),
                     if (_isCOD) SizedBox(height: 16),
                     if (_isCOD)
                       Text(
                         'Please keep exact change ready for the amount payable on delivery.',
                         style: TextStyle(fontSize: 16, color: Colors.red),
                       ),
                     SizedBox(height: 16),
                     TextFormField(
                       decoration: InputDecoration( border: OutlineInputBorder(),
                         labelText: 'Card Number',
                         hintText: 'Enter card number',
                       ),
                       obscureText: true,
                       validator: (value) {
                         if (_paymentMethod == 'Credit Card' &&
                             (value == null || value.isEmpty)) {
                           return 'Please enter card number';
                         }
                         return null;
                       },
                       onSaved: (value) {
                         _cardNumber = value!;
                       },
                     ),
                   ],
                 ),
               ),
             ),
                SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        _showSuccessDialog();
                      }
                    },
                    child: Text('Place Order'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showSuccessDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Order Placed'),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text('Thank you for your order.'),
                  Text(
                      'Delivery Address: $_address, $_street, $_city, $_state - $_pinCode'),
                  Text('Payment Method: $_paymentMethod'),
                  Text('Delivery Method: $_deliveryMethod'),
                  Text('Card Number: $_cardNumber'),
                ],
              ),
            ),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  void _placeOrder() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();

    if (_isCOD) {
// Implement COD (Cash on Delivery) option here
    } else {
// Implement online payment option here
    }

    _showSuccessDialog();
  }
}
