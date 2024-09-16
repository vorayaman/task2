import 'package:flutter/material.dart';
import '../modal/product_modal.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(product.thumbnail),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Price: \$${product.price}',
                      style: const TextStyle(fontSize: 20)),
                  const SizedBox(height: 10),
                  Text(product.title, style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 20),
                  Text('Description: :- ${product.description}',
                      style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 20),
                  const Text('Reviews', style: TextStyle(fontSize: 18)),
                  product.reviews.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: product.reviews.length,
                          itemBuilder: (context, index) {
                            final review = product.reviews[index];
                            return ListTile(
                              title: Text(
                                  '${review.reviewerName} - ${review.date}'),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${review.rating} stars'),
                                  Text(review.comment),
                                ],
                              ),
                            );
                          },
                        )
                      : const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text('No reviews available.',
                              style: TextStyle(fontSize: 16)),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
