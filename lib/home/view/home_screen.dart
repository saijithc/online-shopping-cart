import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:machinetask/details/view/details.dart';
import 'package:machinetask/helper_function/helper_function.dart';
import 'package:machinetask/home/provider/provider.dart';
import 'package:machinetask/login/view/login_screen.dart';
import 'package:machinetask/widget/customtext.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customText("Discover", weight: FontWeight.bold, sizes: 22),
                    IconButton(
                        onPressed: () {
                          HelperFuction().clearData();
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (ctx) => const LoginScreen()));
                        },
                        icon: const Icon(Icons.shopping_bag_outlined))
                  ]),
            ),
            SizedBox(
              height: h * 0.05,
              width: w,
              child: Consumer<HomeProvider>(
                builder: (context, value, child) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: value.categoryNames.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: context
                                            .watch<HomeProvider>()
                                            .selectedIndex ==
                                        index
                                    ? Colors.black54
                                    : Colors.black12),
                            onPressed: () => value.changeIndex(index),
                            child: customText(value.categoryNames[index])),
                      );
                    },
                  );
                },
              ),
            ),
            Expanded(
                child: FutureBuilder(
              future: context.read<HomeProvider>().getPost(),
              //  initialData: InitialData,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return context.read<HomeProvider>().isLoading == true
                    ? const Center(child: CircularProgressIndicator())
                    : Consumer<HomeProvider>(
                        builder: (context, value, child) {
                          final item = value.categoryItems[value.selectedIndex];
                          log(item.toString());
                          return GridView.custom(
                            padding: EdgeInsets.only(bottom: h * 0.1),
                            gridDelegate: SliverWovenGridDelegate.count(
                              crossAxisCount: 2,
                              mainAxisSpacing: 0,
                              crossAxisSpacing: 0,
                              pattern: [
                                const WovenGridTile(1),
                                const WovenGridTile(
                                  2 / 3,
                                  crossAxisRatio: 1,
                                  alignment: AlignmentDirectional.centerEnd,
                                ),
                              ],
                            ),
                            childrenDelegate: SliverChildBuilderDelegate(
                              childCount: item.length,
                              (context, index) => Padding(
                                padding: const EdgeInsets.all(2),
                                child: SizedBox(
                                  height: h * 0.6,
                                  width: w / 2,
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (ctx) =>
                                                      DetailsScreen(
                                                        itemsDetails: item,
                                                        currentIndex: index,
                                                      )));
                                        },
                                        child: SizedBox(
                                          child: Image.network(
                                            item[index].images[0],
                                            fit: BoxFit.cover,
                                            height: h * 0.5,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: -50,
                                        right: 100,
                                        left: 5,
                                        child: Text(
                                          item[index].title,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: -45,
                                        right: 0,
                                        child: customText(
                                            "\$${item[index].price.toString()}",
                                            weight: FontWeight.bold),
                                      ),
                                      Positioned(
                                        bottom: -23,
                                        right: 5,
                                        child: FloatingActionButton(
                                            mini: true,
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 255, 174, 0),
                                            onPressed: () {},
                                            child: const Icon(Icons.add)),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
              },
            )),
          ],
        ),
      ),
    );
  }
}
