import 'package:code_test_flutter/src/app/core/gen/colors.gen.dart';
import 'package:code_test_flutter/src/app/core/styles/strings.dart';
import 'package:code_test_flutter/src/app/core/styles/styles.dart';
import 'package:code_test_flutter/src/features/photos/domain/entity/photo.dart';
import 'package:flutter/material.dart';

class PhotoInfo extends StatelessWidget {
  final Photo photo;

  const PhotoInfo({required this.photo});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(color: ColorName.secondary),
        child: Text(
          (photo.title.isNotEmpty) ? photo.title : Strings.noContentPlaceholder,
          maxLines: 1,
          style: TextStyles.textNormal,
        ),
      ),
    );
  }
}
