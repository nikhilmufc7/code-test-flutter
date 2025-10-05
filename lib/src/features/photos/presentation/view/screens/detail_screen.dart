import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:code_test_flutter/src/features/photos/domain/entity/photo.dart';
import 'package:code_test_flutter/src/app/core/gen/colors.gen.dart';
import 'package:code_test_flutter/src/app/core/styles/styles.dart';

class DetailScreen extends StatelessWidget {
  final Photo photo;

  const DetailScreen({required this.photo, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Detail'),
        backgroundColor: ColorName.secondary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: photo.id,
              child: CachedNetworkImage(
                imageUrl: photo.url,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 320,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              photo.title.isNotEmpty ? photo.title : 'No Title',
              style: TextStyles.textBold.copyWith(fontSize: 22),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
