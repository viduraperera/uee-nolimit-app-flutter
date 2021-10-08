import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:untitled/constants/firebase.dart';
import 'package:untitled/models/product.dart';

class ProducsController extends GetxController {
  static ProducsController instance = Get.find();
  RxList<ProductModel> products = RxList<ProductModel>([]);
  RxList<ProductModel> trending = RxList<ProductModel>([]);
  RxList<ProductModel> newArrival = RxList<ProductModel>([]);
  RxList<ProductModel> categoryTops = RxList<ProductModel>([]);
  RxList<ProductModel> categoryPants = RxList<ProductModel>([]);
  RxList<ProductModel> categoryDresses = RxList<ProductModel>([]);
  RxList<ProductModel> categoryShirts = RxList<ProductModel>([]);
  RxList<ProductModel> categoryDenims = RxList<ProductModel>([]);
  RxList<ProductModel> categoryShoes = RxList<ProductModel>([]);

  String collection = "products";

  @override
  onReady() {
    super.onReady();
    products.bindStream(getAllProducts());
  }

  Stream<List<ProductModel>> getAllProducts () {

    trending.clear();
    newArrival.clear();
    categoryTops.clear();

    Stream<QuerySnapshot> stream = firebaseFirestore.collection(collection).snapshots();

    return stream.map((query) =>
        query.docs.map((item) {

          ProductModel p =  ProductModel.fromMap(item.data());

          switch (p.status) {
            case "trending":
              trending.add(p);
              break;
            case "new_arrivals":
              newArrival.add(p);
              break;
          }

          switch(p.category){
            case "tops":
              categoryTops.add(p);
              break;
            case "dresses":
              categoryDresses.add(p);
              break;
            case "pants":
              categoryPants.add(p);
              break;
            case "shirts":
              categoryShirts.add(p);
              break;
            case "denims":
              categoryDenims.add(p);
              break;
            case "shoes":
                categoryShoes.add(p);
               break;
          }
          return ProductModel.fromMap(item.data());
        }).toList());
  }
}
