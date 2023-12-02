// ignore_for_file: prefer_const_constructors
import 'package:comicsduka/constants/routes.dart';
import 'package:comicsduka/firebase_helper/firebase_firestore_helper/firebase_firestore.dart';
import 'package:comicsduka/provider/app_provider.dart';
import 'package:comicsduka/screens/custom_bottom_bar/custom_bottom_bar.dart';
import 'package:comicsduka/widgets/primary_button/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/product_model/product_model.dart';

class CartItemCheckOut extends StatefulWidget {
  const CartItemCheckOut({super.key,});

  @override
  State<CartItemCheckOut> createState() => _CartItemCheckOutState();
}

class _CartItemCheckOutState extends State<CartItemCheckOut> {
  int groupValue = 2;
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: true);
    return Scaffold(
      // bottomNavigationBar: SizedBox(
      //   height: 190,
      //   child: Padding(
      //     padding: const EdgeInsets.all(12.0),
      //     child: Column(
      //       children: [
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: const [
      //             Text(
      //               "Total Cost: ",
      //               style: TextStyle(
      //                 fontSize: 18.0,
      //                 fontWeight: FontWeight.bold,
      //               ),
      //             ),
      //             Spacer(),
      //             Text(
      //               "Ksh. 600",
      //               style: TextStyle(
      //                 fontSize: 18.0,
      //                 fontWeight: FontWeight.bold,
      //               ),
      //             ),
      //           ],
      //         ),
      //         SizedBox(height: 25.0,),
      //         PrimaryButton(title: "CartItemCheckOut", onPressed: (){},),
      //       ],
      //     ),
      //   ),
      // ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          " CartItemCheckOut Screen",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(
              height: 36.0,
            ),
            Container(
              margin: EdgeInsets.all(8),
              height: 80,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 2.0,
                    spreadRadius: 0.0,
                    offset: Offset(2.0, 2.0), // shadow direction: bottom right
                  )
                ],
              ),
              width: double.infinity,
              child: Row(children: [
                Radio(
                  value: 1,
                  groupValue: groupValue,
                  onChanged: (value) {
                    setState(() {
                      groupValue = value!;
                    });
                  },
                ),
                const Icon(Icons.money),
                SizedBox(
                  width: 18.0,
                ),
                const Text(
                  "Cash on Delivery",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
            ),
            Container(
              margin: EdgeInsets.all(8),
              height: 80,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 2.0,
                    spreadRadius: 0.0,
                    offset: Offset(2.0, 2.0), // shadow direction: bottom right
                  )
                ],
              ),
              width: double.infinity,
              child: Row(children: [
                Radio(
                  value: 2,
                  groupValue: groupValue,
                  onChanged: (value) {
                    setState(() {
                      groupValue = value!;
                    });
                  },
                ),
                const Icon(Icons.money),
                SizedBox(
                  width: 18.0,
                ),
                const Text(
                  "Stripe",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: 24.0,
            ),
            PrimaryButton(
              title: "Complete CartItemCheckOut",
              onPressed: () async {
                // appProvider.getBuyProductList.clear();
                // appProvider.addBuyProduct(widget.singleProduct);

                bool value = await FirebaseFirestoreHelper.instance
                    .uploadOrderedProductFirebase(
                        appProvider.getBuyProductList, context, groupValue ==1? "Cash on delivery": "Paid");
                if (value) {
                  Future.delayed(Duration(seconds: 2), () {
                    Routes.instance.push(widget: CustomBottomBar(), context: context);
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
