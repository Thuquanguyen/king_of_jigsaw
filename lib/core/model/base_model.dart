class BaseModel {
  final String? title;
  final bool? isPremium;
  bool? isSelected;
  final Function? onTap;

  BaseModel({this.title, this.isPremium, this.onTap, this.isSelected});
}
