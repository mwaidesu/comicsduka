import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int qty = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cart Screen",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: 4,
          padding: const EdgeInsets.all(12.0),
          itemBuilder: (ctx, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 12.0),
              decoration: BoxDecoration(
                // boxShadow: kElevationToShadow[2],
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                  color: Color.fromARGB(179, 211, 210, 210),
                  width: 1.3,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 140,
                      color: Colors.white70,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          "https://i0.wp.com/thegeekiary.com/wp-content/uploads/2020/07/Supergirl-Being-Super-e1594072645368.jpg?fit=500%2C769&ssl=1",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                    flex: 2,
                    child: SizedBox(
                      height: 140,
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Supergirl",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 12.0,
                                ),
                                
                              ],
                              
                            ),
                            Text("Ksh. 100.00"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
