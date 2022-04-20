import 'package:flutter/material.dart';
import 'package:tiki_project/screens/HomeList.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

final occ = new NumberFormat("#,##0", "EN_US");

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Giỏ hàng')),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        backgroundColor: Colors.blue,
      ),
      body: CartDetails(),
    );
  }
}

class CartDetails extends StatefulWidget {
  @override
  State<CartDetails> createState() => _CartDetailsState();
}

class _CartDetailsState extends State<CartDetails> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Checkbox(
            checkColor: Colors.white,
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value!;
              });
            },
          ),
          Text('Tất cả( sản phẩm)'),
          Padding(
            padding: const EdgeInsets.only(left: 200),
            child: IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
          ),
        ],
      ),
      Expanded(
          child: ListView.separated(
        itemCount: 25,
        separatorBuilder: (BuildContext context, int index) =>
            const Divider(),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Row(
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Expanded(
                  child:  Image.network('https://salt.tikicdn.com/cache/280x280/ts/product/19/5e/21/e9545516e51437aa3266c8a684c83f1d.jpg'),
                  
                  ),
                )
                ]
                ),
            leading: Checkbox(
            checkColor: Colors.white,
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value!;
              });
            },
          ),
          );
        },
      ))
    ]);
  }
}



