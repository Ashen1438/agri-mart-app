import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodaysPriceScreen extends StatefulWidget {
  const TodaysPriceScreen({super.key});

  @override
  State<TodaysPriceScreen> createState() => _TodaysPriceScreenState();
}

class _TodaysPriceScreenState extends State<TodaysPriceScreen> {
  // Sample data for the grid
  final List<Map<String, String>> products = [
    {'name': 'Grapes', 'price': '240.00', 'image': 'assets/product/Grapes.png'},
    {'name': 'Beans', 'price': '340.00', 'image': 'assets/product/beans.png'},
    {'name': 'Carrot', 'price': '140.00', 'image': 'assets/product/carrot.png'},
    {
      'name': 'fertilizer',
      'price': '240.00',
      'image': 'assets/others/fertilizer.png'
    },
    {'name': 'Onion', 'price': '240.00', 'image': 'assets/productU/onion.png'},
    {
      'name': 'Pumpkin',
      'price': '240.00',
      'image': 'assets/product/pumpkin.png'
    },
    {'name': 'Potato', 'price': '240.00', 'image': 'assets/product/potato.png'},
    {'name': 'Leek', 'price': '340.00', 'image': 'assets/product/leek.png'},
    {'name': 'Carrot', 'price': '140.00', 'image': 'assets/product/carrot.png'},
    {
      'name': 'Watermelon',
      'price': '240.00',
      'image': 'assets/product/Watermelon.png'
    },
    {'name': 'Banana', 'price': '240.00', 'image': 'assets/product/Banana.png'},
    {
      'name': 'seed Drill Machine',
      'price': '240.00',
      'image': 'assets/others/seed_drill_machine.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:
            const Text("Today's Price", style: TextStyle(color: Colors.black)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.green),
        actions: [
          IconButton(
            icon: const CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(Icons.arrow_forward, color: Colors.white),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height:
              MediaQuery.of(context).size.height, // Ensures GridView has height
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Number of columns
              crossAxisSpacing: 12, // Horizontal spacing
              mainAxisSpacing: 12, // Vertical spacing
              childAspectRatio: 0.7, // Adjust the height-to-width ratio
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductCard(
                imageUrl: product['image'] ?? '',
                productName: product['name'] ?? '',
                price: product['price'] ?? '',
              );
            },
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String price;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.productName,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/user_panel/product');
      },
      child: Card(
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageUrl,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.broken_image,
                    size: 80, color: Colors.grey);
              },
            ),
            const SizedBox(height: 10),
            Text(productName,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            Text('Rs. $price', style: const TextStyle(color: Colors.green)),
          ],
        ),
      ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  final String productName;
  final String price;
  final String imageUrl;

  const ProductDetailScreen({
    super.key,
    required this.productName,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productName),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageUrl,
              height: 150,
              width: 150,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Text(
              productName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Rs. $price',
              style: const TextStyle(fontSize: 20, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
