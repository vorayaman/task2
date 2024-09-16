// class Product {
//   final int id;
//   final String title;
//   final String description;
//   final num price;
//   final num discountPercentage;
//   final num rating;
//   final String thumbnail;
//   final String? brand;

//   Product({
//     required this.id,
//     required this.title,
//     required this.description,
//     required this.price,
//     required this.discountPercentage,
//     required this.rating,
//     required this.thumbnail,
//     required this.brand,
//   });

//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       id: json['id'],
//       title: json['title'],
//       description: json['description'],
//       price: json['price'],
//       discountPercentage: json['discountPercentage'],
//       rating: json['rating'],
//       thumbnail: json['thumbnail'],
//       brand: json['brand'],
//     );
//   }
// }

class Product {
  final int id;
  final String title;
  final String description;
  final num price;
  final num discountPercentage;
  final num rating;
  final String thumbnail;
  final String? brand;
  final List<Review> reviews;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.thumbnail,
    required this.brand,
    required this.reviews,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      discountPercentage: json['discountPercentage'],
      rating: json['rating'],
      thumbnail: json['thumbnail'],
      brand: json['brand'],
      reviews: (json['reviews'] as List<dynamic>)
          .map((reviewJson) => Review.fromJson(reviewJson))
          .toList(),
    );
  }
}

class Review {
  final int rating;
  final String comment;
  final String date;
  final String reviewerName;
  final String reviewerEmail;

  Review({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      rating: json['rating'],
      comment: json['comment'],
      date: json['date'],
      reviewerName: json['reviewerName'],
      reviewerEmail: json['reviewerEmail'],
    );
  }
}
