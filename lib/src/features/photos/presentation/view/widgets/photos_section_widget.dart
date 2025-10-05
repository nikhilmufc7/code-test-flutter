import 'package:code_test_flutter/src/app/core/inject/modules/app_module.dart';
import 'package:code_test_flutter/src/features/photos/domain/entity/photo.dart';
import 'package:code_test_flutter/src/features/photos/presentation/view/widgets/photos_section_content_widget.dart';
import 'package:flutter/material.dart';

class PhotosSectionWidget extends StatelessWidget {
  final List<Photo> photos;

  const PhotosSectionWidget(this.photos);

  @override
  Widget build(BuildContext context) {
    final bloc = AppModule.bloc;
    return RefreshIndicator(
      onRefresh: () async {
        await bloc.initialize();
      },
      child: Stack(
        children: [
          PhotosSectionContent(photos),
        ],
      ),
    );
  }
}
