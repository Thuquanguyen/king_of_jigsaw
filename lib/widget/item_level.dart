import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:king_of_jigsaw/core/assets/app_assets.dart';
import 'package:king_of_jigsaw/core/common/imagehelper.dart';
import 'package:king_of_jigsaw/screen/play/play_controller.dart';
import 'package:king_of_jigsaw/utils/touchable.dart';

import '../core/model/level_model.dart';
import '../utils/state_builder.dart';

class ItemLevel extends StatelessWidget {
  ItemLevel({super.key, this.levelModel, this.playController, this.index});

  final LevelModel? levelModel;
  final PlayController? playController;
  final int? index;
  StateHandler stateHandler = StateHandler("ItemLevel");

  @override
  Widget build(BuildContext context) {
    return Touchable(
        onTap: () {
          playController?.changeSelected(index ?? 0, callBack: () {
            stateHandler.refresh();
          });
        },
        child: Container(
          margin: EdgeInsets.only(top: 10.h, left: 5.w, right: 5.w),
          child: Column(
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: Stack(
                  children: [
                    ImageHelper.loadFromAsset(
                        levelModel?.icon ?? AppAssets.icApp,
                        width: 100,
                        height: 100),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: StateBuilder(
                          builder: () => Icon(
                                levelModel?.isChecked == true
                                    ? Icons.check_box
                                    : Icons.check_box_outline_blank,
                                size: 20,
                              ),
                          routeName: "ItemLevel"),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(levelModel?.title ?? '')
            ],
          ),
        ));
  }
}
