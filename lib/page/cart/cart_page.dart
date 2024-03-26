import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Map<String, dynamic>> _cartItems = [
    {'name': 'Item 1', 'price': 10.0, 'quantity': 2},
    {'name': 'Item 2', 'price': 15.0, 'quantity': 1},
  ];

  double _totalPrice() {
    double total = 0;
    _cartItems.forEach((item) {
      total += item['price'] * item['quantity'];
    });
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: _cartItems.length,
        itemBuilder: (context, index) {
          final item = _cartItems[index];
          return ListTile(
            title: Text(item['name']),
            subtitle: Text('Price: \$${item['price']}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (item['quantity'] > 1) {
                        item['quantity']--;
                      }
                    });
                  },
                ),
                Text('${item['quantity']}'),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      item['quantity']++;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      _cartItems.removeAt(index);
                    });
                  },
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: \$${_totalPrice().toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () {
                  // Proceed to checkout logic
                },
                child: Text('Checkout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

