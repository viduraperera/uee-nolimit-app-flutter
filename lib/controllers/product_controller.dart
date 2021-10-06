import 'dart:async';
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


  Stream<List<ProductModel>> getAllProducts () =>
      firebaseFirestore.collection(collection).snapshots().map((query) =>
          query.docs.map((item) => ProductModel.fromMap(item.data())).toList());

  //trending
  addToTrending(){
    trending.clear();
    for(ProductModel i in products){
      if(i.status == "trending"){
        trending.add(i);
        print("trending.length ${trending.length}");
      }
    }
  }

  //new_arrivals
  addToNewArrivals(){
    newArrival.clear();
    for(ProductModel i in products){
      if(i.status == "new_arrivals"){
        newArrival.add(i);
      }
    }
  }

  //tops
  addCategoryTops(){
    categoryTops.clear();
    for(ProductModel i in products){
      if(i.category == "tops"){
        categoryTops.add(i);
      }
    }
  }

  //pants
  addCategoryPants(){
    categoryPants.clear();
    for(ProductModel i in products){
      if(i.category == "pants"){
        categoryPants.add(i);
      }
    }
  }

  //dresses
  addCategoryDresses(){
    categoryDresses.clear();
    for(ProductModel i in products){
      if(i.category == "dresses"){
        categoryDresses.add(i);
      }
    }
  }

  //shirts
  addCategoryShirts(){
    categoryShirts.clear();
    for(ProductModel i in products){
      if(i.category == "shirts"){
        categoryShirts.add(i);
      }
    }
  }

  //denims
  addCategoryDenims(){
    categoryDenims.clear();
    for(ProductModel i in products){
      if(i.category == "denims"){
        categoryDenims.add(i);
      }
    }
  }

  //shoes
  addCategoryShoes(){
    categoryShoes.clear();
    for(ProductModel i in products){
      if(i.category == "shoes"){
        categoryShoes.add(i);
      }
    }
  }
}
