import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:king_of_jigsaw/core/assets/app_assets.dart';
import 'package:king_of_jigsaw/utils/app_scaffold.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

import 'play_controller.dart';

class PlayScreen extends GetView<PlayController> {
  PlayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.red,
      width: Get.width - 100,
      height: 200,
      child: Obx(() => ReorderableGridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio:
                    controller.widthX.value / controller.heightX.value,
                crossAxisSpacing: 3,
                mainAxisSpacing: 3),
            itemBuilder: (ctx, index) => Image(
              key: ValueKey(index),
              image: controller.listImageK[index].image.image,
              fit: BoxFit.fill,
            ),
            itemCount: controller.listImageK.length,
            onReorder: (int oldIndex, int newIndex) {
              final element = controller.listImageK.removeAt(oldIndex);
              controller.listImageK.insert(newIndex, element);
              controller.checkSuccess();
            },
          )),
    );
  }

// @override
// Widget build(BuildContext context) {
//   return AppScaffold(
//     body: Center(
//       // use ReorderableGridView.count() when version >= 2.0.0
//       // else use ReorderableGridView()
//       child: Obx(() => ReorderableGridView.count(
//             crossAxisSpacing: 10,
//             mainAxisSpacing: 10,
//             crossAxisCount: 3,
//             children: controller.data.map((e) => buildItem("$e")).toList(),
//             onReorder: (oldIndex, newIndex) {
//               final element = controller.data.removeAt(oldIndex);
//               controller.data.insert(newIndex, element);
//             }
//           )),
//     ),
//   );
// }
//
// Widget buildItem(String text) {
//   return Card(
//     key: ValueKey(text),
//     child: Text(text),
//   );
// }
}
