import 'package:expenseapplication/models/catmodel.dart';

class AppConstants {
  static List<CatModel> mCat = [
    CatModel(
        catId: 1,
        catName: "Restaurant",
        catImg: "assets/icons/ic_restuarant.png"),
    CatModel(
        catId: 2, catName: "FastFood", catImg: "assets/icons/ic_fastfood.png"),
    CatModel(catId: 3, catName: "Petrol", catImg: "assets/icons/ic_petrol.png"),
    CatModel(
        catId: 4, catName: "Shopping", catImg: "assets/icons/ic_shopping.png"),
    CatModel(catId: 5, catName: "Movie", catImg: "assets/icons/ic_movie.png"),
    CatModel(catId: 6, catName: "Coffee", catImg: "assets/icons/ic_coffee.jpg"),
    CatModel(catId: 7, catName: "Rent", catImg: "assets/icons/ic_rent.png"),
  ];
}
