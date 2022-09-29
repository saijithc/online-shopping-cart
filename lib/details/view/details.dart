import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:machinetask/details/provider/provider.dart';
import 'package:machinetask/home/model/model.dart';
import 'package:machinetask/widget/customtext.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.itemsDetails});
  final GetPostModel itemsDetails;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final String image = itemsDetails.images[0];
    log(image);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: customText(
          itemsDetails.title,
          color: Colors.black,
          weight: FontWeight.bold,
          sizes: 25,
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Column(
                        children: [
                          Container(
                            // padding: const EdgeInsets.all(35),
                            height: MediaQuery.of(context).size.height * 0.5,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 226, 226, 223),
                                borderRadius: BorderRadius.circular(5)),
                            child: Image.network(
                              image,
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.024,
                            width: double.infinity,
                          )
                        ],
                      ),
                      Positioned(
                          top: h * 0.47,
                          left: w * 0.6,
                          child: const CircleAvatar(
                            backgroundColor: Colors.orange,
                            child: Icon(
                              Icons.favorite,
                              color: Colors.white,
                              size: 18,
                            ),
                          )),
                      Positioned(
                          top: h * 0.47,
                          left: w * 0.75,
                          child: const CircleAvatar(
                            backgroundColor: Colors.orange,
                            child: Icon(
                              Icons.clear_rounded,
                              color: Colors.white,
                              size: 18,
                            ),
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("Rating"),
                      SizedBox(
                        width: w * 0.03,
                      ),
                      Row(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(5, (index) {
                            return Icon(
                              index < 3 ? Icons.star : Icons.star_border,
                              color: Colors.orange,
                              size: 15,
                            );
                          }))
                    ],
                  ),
                  SizedBox(
                    height: h * 0.014,
                  ),
                  Text(
                    itemsDetails.title,
                    style: const TextStyle(
                        fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  Text(
                    itemsDetails.description,
                    style: const TextStyle(fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: h * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${itemsDetails.price.toString()}",
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                              ),
                              onPressed: () {},
                              child: const Text(
                                "Add to Card",
                                style: TextStyle(color: Colors.black),
                              )),
                          SizedBox(
                            width: w * 0.025,
                          ),
                          ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.orange),
                              ),
                              onPressed: () {
                                context.read<DetailProvider>().showNotification(
                                    url: image,
                                    body: "\$${itemsDetails.price.toString()}",
                                    payload: 'payload',
                                    title:
                                        "You have ordered ${itemsDetails.title}");
                              },
                              child: const Text(
                                "Buy Now",
                                style: TextStyle(color: Colors.white),
                              )),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
