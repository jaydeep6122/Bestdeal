import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

class offerdetails extends StatefulWidget {
  const offerdetails({super.key});

  @override
  State<offerdetails> createState() => _offerdetailsState();
}

class _offerdetailsState extends State<offerdetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Scaffold(
            body: Column(
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
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 35,
                          )),
                      const Text(
                        "Offer details",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                // offer details
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      const BoxShadow(
                          color: Colors.grey,
                          blurRadius: 1,
                          offset: Offset(1, 1))
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  // padding: EdgeInsets.only(
                  //     top: MediaQuery.sizeOf(context).height * 0.01),
                  margin: EdgeInsets.only(
                      top: MediaQuery.sizeOf(context).height * 0.11),
                  height: MediaQuery.sizeOf(context).height * 0.2,
                  width: double.infinity,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.sizeOf(context).width * 0.05),
                    child: Row(
                      children: [
                        Container(
                          //decoration: BoxDecoration(border: Border.all()),
                          height: 100,
                          width: 100,
                          child: Image.network(
                              "https://ph-files.imgix.net/89d55dff-7b12-419d-8feb-513eb91a455b.png?auto=format"),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Werksection",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const Text(
                                  "AdSets - Product Information, subject to copyrigh",
                                  style: TextStyle(fontWeight: FontWeight.w300),
                                ),
                                RatingBarIndicator(
                                  rating: 3.6,
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  //color: const Color.fromARGB(255, 13, 18, 22),
                ),
              ],
            ),
            const Text("Steps(1/4)"),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).width * 0.03),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  borderRadius: BorderRadius.circular(30)),
              child: ListTile(
                onTap: () {},
                leading: const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Install The Application",
                      style: TextStyle(decoration: TextDecoration.lineThrough),
                    ),
                    const Spacer(),
                    TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green)),
                      onPressed: () {},
                      child: const Text(
                        "20",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.02,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).width * 0.03),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.orange),
                  borderRadius: BorderRadius.circular(15)),
              child: ListTile(
                onTap: () {},
                leading: const Icon(
                  Icons.hourglass_empty,
                  color: Colors.orange,
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("Complete 3 offers"),
                    const Spacer(),
                    TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.orange)),
                      onPressed: () {},
                      child: const Text(
                        "20",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                subtitle: const Text("Description"),
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.02,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).width * 0.03),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 237, 237, 237),
                  // border: Border.all(color: Colors.green),
                  borderRadius: BorderRadius.circular(30)),
              child: ListTile(
                onTap: () {},
                leading: const Icon(
                  Icons.circle,
                  color: Colors.grey,
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Refer Workstation to friend",
                    ),
                    const Spacer(),
                    TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white)),
                      onPressed: () {},
                      child: const Text(
                        "20",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.02,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).width * 0.03),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 237, 237, 237),
                  // border: Border.all(color: Colors.green),
                  borderRadius: BorderRadius.circular(30)),
              child: ListTile(
                onTap: () {},
                leading: const Icon(
                  Icons.circle,
                  color: Colors.grey,
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Refer Workstation to friend",
                    ),
                    const Spacer(),
                    TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white)),
                      onPressed: () {},
                      child: const Text(
                        "20",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            const Text(
              "22,587 Users has already participated",
              style: TextStyle(color: Colors.orange),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).width * 0.05,
                  vertical: MediaQuery.sizeOf(context).width * 0.05),
              height: MediaQuery.sizeOf(context).height * 0.08,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.blue),
              width: double.infinity,
              child: TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue)),
                onPressed: () {},
                child: const Text(
                  "Get Rs 364",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
