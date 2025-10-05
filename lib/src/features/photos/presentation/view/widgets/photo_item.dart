import 'package:code_test_flutter/src/app/core/navigation/routes.dart';
import 'package:code_test_flutter/src/features/photos/domain/entity/photo.dart';
import 'package:code_test_flutter/src/app/core/styles/touch_effects.dart';
import 'package:code_test_flutter/src/features/photos/presentation/view/widgets/photo_image.dart';
import 'package:code_test_flutter/src/features/photos/presentation/view/widgets/photo_info.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PhotoItem extends StatelessWidget {
  final Photo photo;
  final bool isLeftItem;

  const PhotoItem({required this.photo, required this.isLeftItem});

  @override
  Widget build(BuildContext context) {
    final radius = Radius.circular(8);
    return RippleEffect(
      onTap: () {
        context.push(Routes.photoDetailScreen, extra: photo);
      },
      child: SizedBox(
        height: 200,
        child: Padding(
          padding: EdgeInsets.only(
            left: isLeftItem ? 0 : 8,
            right: !isLeftItem ? 0 : 8,
            bottom: 16,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.all(radius),
            child: Stack(
              children: <Widget>[
                PhotoImage(
                  image: photo.url,
                  photoId: photo.id,
                ),
                PhotoInfo(photo: photo),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
