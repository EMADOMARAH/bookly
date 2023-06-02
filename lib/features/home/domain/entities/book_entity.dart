class BookEntity {
  final String? bookId;
  final String? tital;
  final String? image;
  final String? authorName;
  final num? price;
  final num? rating;

  BookEntity({
    required this.image,
    required this.tital,
    required this.authorName,
    required this.price,
    required this.rating,
    required this.bookId,
  });
}
