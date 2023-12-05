import 'package:get/get.dart';

class FavoriteController extends GetxController {
  RxList<String> tags = <String>['Education'].obs;
  List<String> options = [
    'News',
    'Entertainment',
    'Politics',
    'Automotive',
    'Sports',
    'Education',
    'Fashion',
    'Travel',
    'Food',
    'Tech',
    'Science',
  ];
}
