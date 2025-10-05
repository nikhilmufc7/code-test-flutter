import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PhotoImage extends StatelessWidget {
  final String image;
  final String photoId;

  const PhotoImage({required this.image, required this.photoId});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: photoId,
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.cover,
          height: 180,
        ),
      ),
    );
  }
}
