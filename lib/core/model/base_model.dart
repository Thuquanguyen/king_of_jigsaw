import 'package:flutter/material.dart';

class BaseModel {
  final String? title;
  final bool? isPremium;
  final String? icon;
  final Color? color;
  bool? isSelected;
  final Function? onTap;

  BaseModel({this.title, this.isPremium, this.onTap, this.isSelected = false,this.icon,this.color});

  @override
  String toString() {
    return 'BaseModel{title: $title, isSelected: $isSelected}';
  }
}
