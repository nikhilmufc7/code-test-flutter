import 'package:code_test_flutter/src/app/core/extensions/context_extensions.dart';
import 'package:code_test_flutter/src/app/core/styles/styles.dart';
import 'package:code_test_flutter/src/features/photos/domain/entity/photo.dart';
import 'package:code_test_flutter/src/features/photos/presentation/view/widgets/photo_item.dart';
import 'package:flutter/material.dart';

class PhotosSectionContent extends StatelessWidget {
  final List<Photo> photos;

  const PhotosSectionContent(this.photos);

  @override
  Widget build(BuildContext context) {
    final rows = <Widget>[];
    for (int i = 0; i < photos.length; i += 2) {
      rows.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Expanded(
              child: PhotoItem(
                photo: photos[i],
                isLeftItem: true,
              ),
            ),
            const SizedBox(width: 8),
            if (i + 1 < photos.length)
              Expanded(
                child: PhotoItem(
                  photo: photos[i + 1],
                  isLeftItem: false,
                ),
              )
            else
              const Expanded(child: SizedBox()),
          ],
        ),
      ));
    }

    if (photos.isEmpty) {
      return Center(
        child: Text(
          context.translations.noItems,
          style: TextStyles.textNormal,
        ),
      );
    } else {
      return SingleChildScrollView(
        padding: const EdgeInsets.only(right: 64),
        child: Column(
          children: rows,
        ),
      );
    }
  }
}
