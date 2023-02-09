class Photo {
  final int id;
  final String smallSizeUrl;
  final String fullSizeUrl;
  final String? photographer;
  final String? alt;

  const Photo({
    required this.id,
    required this.smallSizeUrl,
    required this.fullSizeUrl,
    this.photographer,
    this.alt,
  });
}
