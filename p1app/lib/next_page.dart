import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:p1app/controller/produc_controller.dart';

class ProductDetails extends StatefulWidget {
  final String productName;
  final String thumbnail;
  final dynamic price;
  final double discountPercentage;
  final dynamic images;
  final String description;
  final double rating;

  const ProductDetails(
      {super.key,
      required this.productName,
      required this.thumbnail,
      required this.price,
      required this.discountPercentage,
      required this.images,
      required this.description,
      required this.rating});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    var productController = Get.put(ProductCotroller());
    
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Deatils"),
        actions: [
          InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: const Icon(Icons.arrow_back_ios))
        ],
      ),
      body: Container(
        // color: Colors.cyan,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // ...ProductCotroller.productImage.map((e) => Container(
                            //       height: 280,
                            //       width: 360,
                            //       margin: const EdgeInsets.all(10),
                            //       color: Colors.blueGrey,
                            //       child: Image.network(
                            //         e,
                            //         fit: BoxFit.fill,
                            //       ),
                            //     ))
                          ],
                        ))),
                const SizedBox(
                  height: 2,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  // color: Colors.amber,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.productName}",
                          // textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(children: [
                          Text("${widget.price}",
                              style: const TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600)),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "${widget.discountPercentage}",
                            style: const TextStyle(
                                // decoration: TextDecoration.lineThrough,
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          )
                        ]),
                        const SizedBox(height: 5),
                        Text("${widget.description}",
                            style: const TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.w500)),
                        const SizedBox(
                          height: 4,
                        ),
                        Column(children: [
                          Container(
                              height: 30,
                              width: 60,
                              padding: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Text("${widget.rating}",
                                  style: const TextStyle(
                                      decorationColor: Colors.green,
                                      decorationStyle:
                                          TextDecorationStyle.solid,
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400)))
                        ]),
                        Column(
                          children: [Container()],
                        )
                      ]),
                ),
              ]),
        ),
      ),
    );
  }
}
