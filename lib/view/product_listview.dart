import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task2/view/brandfilter_page.dart';
import 'package:task2/view/product_detail_screen.dart';
import '../viewmodal/mangedata.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () async {
              final selectedBrands = await showDialog<Set<String>>(
                context: context,
                builder: (context) => BrandFilterDialog(
                  availableBrands: provider.getAvailableBrands(),
                  selectedBrands: provider.selectedBrands,
                ),
              );

              if (selectedBrands != null) {
                provider.filterByBrands(selectedBrands);  
              }
            },
          ),
        ],
      ),
      body: Consumer<ProductProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (provider.errorMessage.isNotEmpty) {
            return Center(child: Text(provider.errorMessage));
          }
          return ListView.builder(
              itemCount: provider.products.length,
              itemBuilder: (context, index) {
                final product = provider.products[index];
                return ListTile(
                  leading: Stack(
                    children: [
                      Image.network(
                        product.thumbnail,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      if (product.discountPercentage > 0)
                        Positioned(
                          top: 0,
                          left: 0,
                          child: Transform.rotate(
                            angle: -0.50,
                            child: Container(
                              color: Colors.red.withOpacity(0.8),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 2),
                              child: Text(
                                '${product.discountPercentage}% OFF',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  title: Text(product.title),
                  subtitle: Text('Brand Name: -${product.brand}'),
                  trailing: Text('Price: \$${product.price}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailScreen(product: product),
                      ),
                    );
                  },
                );
              });
        },
      ),
    );
  }
}
