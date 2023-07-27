class LevelModel {
  final String? title;
  final String? icon;
  final Function? callBack;
  bool isChecked;

  LevelModel({this.title, this.icon, this.isChecked = false, this.callBack});

  @override
  String toString() {
    return 'LevelModel{title: $title, icon: $icon, callBack: $callBack, isChecked: $isChecked}';
  }
}
