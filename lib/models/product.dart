class ProductModel{
  static const ID = "id";
  static const IMAGE = "image";
  static const NAME = "name";
  static const CATEGORY = "category";
  static const STATUS = "status";
  static const WHOM = "whom";
  static const SIZE = "size";
  static const PRICE = "price";

   String id;
   String image;
   String name;
   String category;
   String status;
   String whom;
   String size;
   //String price;
   double price;

  ProductModel({this.id, this.image, this.name, this.category, this.status, this.whom ,this.size, this.price});

  ProductModel.fromMap(Map<String, dynamic> data){
    id = data[ID];
    image = data[IMAGE];
    name = data[NAME];
    category = data[CATEGORY];
    status = data[STATUS];
    whom = data[WHOM];
    size = data[SIZE];
    //price = data[PRICE];
    price = double.parse(data[PRICE]);
  }

}