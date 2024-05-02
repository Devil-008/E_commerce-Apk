import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:p1app/controller/produc_controller.dart';
import 'package:p1app/next_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () async {
      await productController.fetchProductsData();
      print("''''''''''''''''''''''''''''''>>${productController.categories}");
    });
  }

  var productController = Get.put(ProductCotroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Easy Shop',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.amber,
        ),
        body: Center(
            child: SingleChildScrollView(
                child: Column(children: [
          Container(
              // color: Colors.grey,
              width: MediaQuery.of(context).size.width * 0.99,
              child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Container(
                      width: 150,
                      // color: Colors.purpleAccent,
                      padding: const EdgeInsets.all(2),
                      child: const Column(children: [
                        Text(
                          'Catagories',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        ),
                      ]),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      // color: Colors.green,
                      padding: const EdgeInsets.all(10),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ...productController.allCategories
                                .map((e) => categoryCard(
                                    categoriName: e,
                                    onTap: () {
                                      productController.getProductByCategories( category: e);
                                    })),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 43,
                                  backgroundImage:
                                      AssetImage('assets/images/i1.jpeg'),
                                ),
                                Padding(padding: EdgeInsets.all(5)),
                                Text('ALL'),
                              ],
                            ),
                            const SizedBox(width: 10),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 43,
                                  backgroundImage:
                                      AssetImage('assets/images/i2.jpg'),
                                ),
                                Padding(padding: EdgeInsets.all(5)),
                                Text('Mobiles'),
                              ],
                            ),
                            const SizedBox(width: 10),
                            const Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 43,
                                    backgroundImage:
                                        AssetImage('assets/images/clothes.jpg'),
                                  ),
                                  Padding(padding: EdgeInsets.all(5)),
                                  Text('Clothes'),
                                ]),
                            const SizedBox(width: 10),
                            const Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 43,
                                    backgroundImage: AssetImage(
                                        'assets/images/accessories.jpg'),
                                  ),
                                  Padding(padding: EdgeInsets.all(5)),
                                  Text('accessoies'),
                                ]),
                            const SizedBox(width: 10),
                            const Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 43,
                                    backgroundImage:
                                        AssetImage('assets/images/beauty.jpg'),
                                  ),
                                  Padding(padding: EdgeInsets.all(5)),
                                  Text('Beauty Products'),
                                ]),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      width: 150,
                      // color: Colors.purpleAccent,
                      padding: const EdgeInsets.all(2),
                      child: const Column(children: [
                        Text(
                          'Products',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        ),
                      ]),
                    )
                  ]))),

                  Text('${productController.productsByCategory}'),
                  SizedBox(height: 10,),
          Wrap(spacing: 3, runSpacing: 3, children: [
            ...productController.products.map((e) => productCard(
                  description: e['description'],
                  image: e['images'].toString(),
                  productImage: e['thumbnail'],
                  productName: e['title'],
                  price: e['price'],
                  discountPercentage: e['discountPercentage'],
                  rating: e['rating'],
                  context: context,
                ))
            // ...productsLit.map((e) => productCard(
            //       productImage: e['thumbnail'],
            //       productName: e['title'],
            //       price: e['price'].toString(),
            //       discountPercentage: e['discountPercentage'],
            //       rating: e['rating'].toString(),
            //       context: context,
            //     ))
          ])
        ]))));
  }
}

Widget categoryCard({required String categoriName, required Function onTap}) {
  return InkWell(
      onTap: onTap(),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Text("$categoriName"),
      ));
}

Widget productCard({
  required BuildContext context,
  required String productName,
  required String productImage,
  required int price,
  required double rating,
  required double discountPercentage,
  required String description,
  required String image,
}) {
  return InkWell(
      onTap: () {
        // print("==================> $productName!!");
        Navigator.push(
            context as BuildContext,
            MaterialPageRoute(
                builder: (context) => ProductDetails(
                      productName: productName,
                      thumbnail: image,
                      price: price,
                      discountPercentage: discountPercentage,
                      images: image,
                      rating: rating,
                      description: description,
                    )));
      },
      child: Container(
          height: 250,
          width: MediaQuery.of(context).size.width * 0.45,
          // color: Colors.redAccent,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 130,
                  width: 192,
                  color: Colors.blue,
                  child: Image.network(
                    productImage,
                    fit: BoxFit.fill,
                  ),
                ),
                Text(productName),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(price.toString()),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(discountPercentage.toString()),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(''),
                    ]),
                Container(
                    height: 20,
                    width: 150,
                    padding: const EdgeInsets.only(left: 5),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(children: [
                      Text(rating.toString(),
                          style: const TextStyle(
                              decorationColor: Colors.green,
                              decorationStyle: TextDecorationStyle.solid,
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.w400)),
                      const SizedBox(width: 10),
                      RatingBar.builder(
                          itemSize: 20,
                          minRating: 1,
                          maxRating: 5,
                          allowHalfRating: true,
                          itemBuilder: (context, _) => const Icon(Icons.star),
                          onRatingUpdate: (rating) {}),
                    ])),
              ])));
}
