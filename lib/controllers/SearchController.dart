import 'package:get/get.dart';

class Search_Controller extends GetxController{
  bool isSearch = false;
  String searchedResults = "";
  showHistory(){
   isSearch = !isSearch;
   update();
  }
} 