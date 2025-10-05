class Photo {
  final String id;
  final String url;
  final String title;

  Photo({
    required this.id,
    required this.url,
    required this.title,
  });
}

class PhotoUrls {
  final String full;
  final String thumb;

  PhotoUrls({
    required this.full,
    required this.thumb,
  });
}
