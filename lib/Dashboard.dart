import 'dart:convert';

import 'package:bestdeal/item_mode.dart';

import 'package:bestdeal/offerdetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:marquee/marquee.dart';

class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.sizeOf(context).height * 0.13,
                    width: double.infinity,
                    color: const Color.fromARGB(255, 86, 165, 229),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.menu,
                              color: Colors.white,
                              size: 35,
                            )),
                        const Text(
                          "Hey Shubham",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        const Spacer(),
                        Container(
                          margin: EdgeInsets.only(
                              right: MediaQuery.sizeOf(context).width * 0.025),
                          height: MediaQuery.sizeOf(context).width * 0.12,
                          width: MediaQuery.sizeOf(context).width * 0.25,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadiusDirectional.circular(40)),
                          child: Container(
                              padding: EdgeInsetsDirectional.symmetric(
                                vertical:
                                    MediaQuery.sizeOf(context).width * 0.01,
                                horizontal:
                                    MediaQuery.sizeOf(context).width * 0.01,
                              ),
                              child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor:
                                          Color.fromARGB(255, 86, 165, 229),
                                      child: Icon(
                                        Icons.account_balance_wallet_outlined,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Spacer(),
                                    Text("₹ 452")
                                  ])),
                        )
                      ],
                    ),
                  ),
                  // Icon Bar All Offers/Gifts/Upcoming/My Offer
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: EdgeInsets.only(
                        top: MediaQuery.sizeOf(context).height * 0.03),
                    margin: EdgeInsets.only(
                        top: MediaQuery.sizeOf(context).height * 0.11),
                    height: MediaQuery.sizeOf(context).height * 0.12,
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            child: const Column(
                              children: [
                                Icon(
                                  Icons.category,
                                  color: Color.fromARGB(255, 86, 165, 229),
                                ),
                                Text("All Offer")
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            child: const Column(
                              children: [
                                Icon(
                                  Icons.redeem,
                                  color: Colors.red,
                                ),
                                Text("Gift")
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            child: Column(
                              children: [
                                Icon(
                                  Icons.schedule,
                                  color: Colors.yellow[600],
                                ),
                                const Text("All Offer")
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            child: Column(
                              children: [
                                Icon(
                                  Icons.check_circle_outline,
                                  color: Colors.purple[300],
                                ),
                                const Text("All Offer")
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    //color: const Color.fromARGB(255, 13, 18, 22),
                  ),
                ],
              ),
              // App Bar

              //Offer Line(marquee)
              Container(
                height: MediaQuery.sizeOf(context).height * 0.03,
                width: double.infinity,
                child: Center(
                  child: Marquee(
                    textDirection: TextDirection.rtl,
                    text: 'Jaydeep Earn 200 From BookmyShow',
                    style: const TextStyle(fontSize: 15.0),
                    scrollAxis: Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    blankSpace: 20.0,
                    velocity: 50.0,
                    pauseAfterRound: const Duration(seconds: 1),
                    showFadingOnlyWhenScrolling: false,
                    fadingEdgeStartFraction: 0.1,
                    fadingEdgeEndFraction: 0.1,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              // Trending Offers
              const Row(
                children: [
                  Icon(
                    Icons.local_fire_department,
                    color: Color.fromARGB(255, 255, 152, 0),
                  ),
                  Text("Trending offers"),
                ],
              ),
              const SizedBox(height: 15),
              Container(
                height: MediaQuery.sizeOf(context).height * 0.22,
                width: double.infinity,
                child: FutureBuilder(
                    future: loadItems(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        List<Item> items = snapshot.data as List<Item>;
                        return ListView.builder(
                            itemCount: items.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                width: MediaQuery.sizeOf(context).width * 0.4,
                                //height: MediaQuery.sizeOf(context).height * 0.4,
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image:
                                          NetworkImage(items[index].thumbnail),
                                    )),
                                child: Positioned(
                                  right: 0,
                                  left: 0,
                                  bottom: 0,
                                  child: Container(
                                    padding: EdgeInsets.only(left: 10),
                                    margin: EdgeInsets.only(
                                        top: MediaQuery.sizeOf(context).height *
                                            0.12),
                                    color: Colors.black.withOpacity(0.5),
                                    child: const Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Cartoon Image",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Text("Get Rs. 230",
                                            style:
                                                TextStyle(color: Colors.white)),
                                        Text("4667 users",
                                            style:
                                                TextStyle(color: Colors.white))
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      } else {
                        return CircularProgressIndicator();
                      }
                      ;
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
              //More Offer
              Row(
                children: [
                  const Icon(
                    Icons.apps_outlined,
                    color: Colors.blue,
                  ),
                  const Text("More offers"),
                ],
              ),

              const SizedBox(
                height: 20,
              ),
              Expanded(
                  child: FutureBuilder(
                      future: loadItems(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          List<Item> items = snapshot.data as List<Item>;
                          return ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: items.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.all(
                                      MediaQuery.sizeOf(context).width * 0.01),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Colors.blue, width: 2)),
                                  child: ListTile(
                                    onTap: () {
                                      Get.to(const offerdetails());
                                    },
                                    leading: Container(
                                      height: 100,
                                      width: 100,
                                      child: Image(
                                          //fit: BoxFit.fill,
                                          image: NetworkImage(
                                              items[index].thumbnail)),
                                    ),
                                    title: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          items[index].title,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            TextButton(
                                              style: ButtonStyle(
                                                  shape:
                                                      MaterialStatePropertyAll(
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5))),
                                                  side:
                                                      MaterialStatePropertyAll(
                                                          BorderSide(
                                                    color: Colors.blue,
                                                  ))),
                                              child: Text(
                                                items[index].payout_currency +
                                                    " " +
                                                    "${items[index].payout_amt}",
                                                style: TextStyle(
                                                    color: Colors.blue),
                                              ),
                                              onPressed: () {},
                                            ),
                                            Spacer(),
                                            Text(
                                              "Rs 23,567",
                                              style: TextStyle(
                                                  color: Colors.orange[500]),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              });
                        } else {
                          return CircularProgressIndicator();
                        }
                      })),
            ]),
      ),
    );
  }
}

Future<List<Item>> loadItems() async {
  final String jsonString =
      await rootBundle.loadString('json/dummy_tasks.json');
  final List<dynamic> jsonList = json.decode(jsonString);

  List<Item> items = [];
  for (var jsonItem in jsonList) {
    items.add(Item.fromJson(jsonItem));
  }

  return items;
}

// Commit

// import 'package:bestdeal/offerdetails.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_navigation/src/extension_navigation.dart';
// import 'package:marquee/marquee.dart';

// class dashboard extends StatefulWidget {
//   const dashboard({super.key});

//   @override
//   State<dashboard> createState() => _dashboardState();
// }

// class _dashboardState extends State<dashboard> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Stack(
//                 children: [
//                   Container(
//                     height: MediaQuery.sizeOf(context).height * 0.13,
//                     width: double.infinity,
//                     color: const Color.fromARGB(255, 86, 165, 229),
//                     child: Row(
//                       children: [
//                         IconButton(
//                             onPressed: () {},
//                             icon: const Icon(
//                               Icons.menu,
//                               color: Colors.white,
//                               size: 35,
//                             )),
//                         const Text(
//                           "Hey Shubham",
//                           style: TextStyle(color: Colors.white, fontSize: 20),
//                         ),
//                         const Spacer(),
//                         Container(
//                           margin: EdgeInsets.only(
//                               right: MediaQuery.sizeOf(context).width * 0.025),
//                           height: MediaQuery.sizeOf(context).width * 0.12,
//                           width: MediaQuery.sizeOf(context).width * 0.25,
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius:
//                                   BorderRadiusDirectional.circular(40)),
//                           child: Container(
//                               padding: EdgeInsetsDirectional.symmetric(
//                                 vertical:
//                                     MediaQuery.sizeOf(context).width * 0.01,
//                                 horizontal:
//                                     MediaQuery.sizeOf(context).width * 0.01,
//                               ),
//                               child: const Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceAround,
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     CircleAvatar(
//                                       backgroundColor:
//                                           Color.fromARGB(255, 86, 165, 229),
//                                       child: Icon(
//                                         Icons.account_balance_wallet_outlined,
//                                         color: Colors.white,
//                                       ),
//                                     ),
//                                     Spacer(),
//                                     Text("₹ 452")
//                                   ])),
//                         )
//                       ],
//                     ),
//                   ),
//                   // Icon Bar All Offers/Gifts/Upcoming/My Offer
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     padding: EdgeInsets.only(
//                         top: MediaQuery.sizeOf(context).height * 0.03),
//                     margin: EdgeInsets.only(
//                         top: MediaQuery.sizeOf(context).height * 0.11),
//                     height: MediaQuery.sizeOf(context).height * 0.12,
//                     width: double.infinity,
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Expanded(
//                           child: GestureDetector(
//                             child: const Column(
//                               children: [
//                                 Icon(
//                                   Icons.category,
//                                   color: Color.fromARGB(255, 86, 165, 229),
//                                 ),
//                                 Text("All Offer")
//                               ],
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           child: GestureDetector(
//                             child: const Column(
//                               children: [
//                                 Icon(
//                                   Icons.redeem,
//                                   color: Colors.red,
//                                 ),
//                                 Text("Gift")
//                               ],
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           child: GestureDetector(
//                             child: Column(
//                               children: [
//                                 Icon(
//                                   Icons.schedule,
//                                   color: Colors.yellow[600],
//                                 ),
//                                 const Text("All Offer")
//                               ],
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           child: GestureDetector(
//                             child: Column(
//                               children: [
//                                 Icon(
//                                   Icons.check_circle_outline,
//                                   color: Colors.purple[300],
//                                 ),
//                                 const Text("All Offer")
//                               ],
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                     //color: const Color.fromARGB(255, 13, 18, 22),
//                   ),
//                 ],
//               ),
//               // App Bar

//               //Offer Line(marquee)
//               Container(
//                 height: MediaQuery.sizeOf(context).height * 0.03,
//                 width: double.infinity,
//                 child: Center(
//                   child: Marquee(
//                     textDirection: TextDirection.rtl,
//                     text: 'Jaydeep Earn 200 From BookmyShow',
//                     style: const TextStyle(fontSize: 15.0),
//                     scrollAxis: Axis.horizontal,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     blankSpace: 20.0,
//                     velocity: 50.0,
//                     pauseAfterRound: const Duration(seconds: 1),
//                     showFadingOnlyWhenScrolling: false,
//                     fadingEdgeStartFraction: 0.1,
//                     fadingEdgeEndFraction: 0.1,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 15),
//               // Trending Offers
//               const Row(
//                 children: [
//                   Icon(
//                     Icons.local_fire_department,
//                     color: Color.fromARGB(255, 255, 152, 0),
//                   ),
//                   Text("Trending offers"),
//                 ],
//               ),
//               const SizedBox(height: 15),
//               Container(
//                 height: MediaQuery.sizeOf(context).height * 0.22,
//                 width: double.infinity,
//                 child: ListView.builder(
//                     itemCount: 5,
//                     scrollDirection: Axis.horizontal,
//                     itemBuilder: (context, index) {
//                       return Container(
//                         width: MediaQuery.sizeOf(context).width * 0.4,
//                         //height: MediaQuery.sizeOf(context).height * 0.4,
//                         margin: const EdgeInsets.all(5),
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             image: const DecorationImage(
//                               fit: BoxFit.fill,
//                               image: NetworkImage(
//                                   "https://www.euroschoolindia.com/blogs/wp-content/uploads/2023/08/cartoons-for-kids.jpg"),
//                             )),
//                         child: Positioned(
//                           right: 0,
//                           left: 0,
//                           bottom: 0,
//                           child: Container(
//                             padding: EdgeInsets.only(left: 10),
//                             margin: EdgeInsets.only(
//                                 top: MediaQuery.sizeOf(context).height * 0.12),
//                             color: Colors.black.withOpacity(0.5),
//                             child: const Column(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "Cartoon Image",
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                                 Text("Get Rs. 230",
//                                     style: TextStyle(color: Colors.white)),
//                                 Text("4667 users",
//                                     style: TextStyle(color: Colors.white))
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     }),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               //More Offer
//               Row(
//                 children: [
//                   const Icon(
//                     Icons.apps_outlined,
//                     color: Colors.blue,
//                   ),
//                   const Text("More offers"),
//                 ],
//               ),

//               const SizedBox(
//                 height: 20,
//               ),
//               Expanded(
//                 child: ListView.builder(
//                     scrollDirection: Axis.vertical,
//                     itemCount: 4,
//                     itemBuilder: (context, index) {
//                       return Container(
//                         margin: EdgeInsets.all(
//                             MediaQuery.sizeOf(context).width * 0.01),
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             border: Border.all(color: Colors.blue, width: 2)),
//                         child: ListTile(
//                           onTap: () {
//                             Get.to(const offerdetails());
//                           },
//                           leading: const Image(
//                               image: NetworkImage(
//                                   "https://ph-files.imgix.net/89d55dff-7b12-419d-8feb-513eb91a455b.png?auto=format")),
//                           title: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "Alta's Advancher",
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   TextButton(
//                                     style: ButtonStyle(
//                                         shape: MaterialStatePropertyAll(
//                                             RoundedRectangleBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(5))),
//                                         side:
//                                             MaterialStatePropertyAll(BorderSide(
//                                           color: Colors.blue,
//                                         ))),
//                                     child: Text(
//                                       "Get 230",
//                                       style: TextStyle(color: Colors.blue),
//                                     ),
//                                     onPressed: () {},
//                                   ),
//                                   Spacer(),
//                                   Text(
//                                     "Rs 23,567",
//                                     style: TextStyle(color: Colors.orange[500]),
//                                   )
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       );
//                     }),
//               ),
//             ]),
//       ),
//     );
//   }
// }
