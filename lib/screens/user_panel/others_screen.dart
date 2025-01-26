import 'package:flutter/material.dart';

class OthersScreen extends StatefulWidget {
  @override
  State<OthersScreen> createState() => _OthersScreenState();
}

class _OthersScreenState extends State<OthersScreen> {
  // Sample data for the grid
  final List<Map<String, String>> products = [
    {
      'name': 'fertilizer',
      'price': '260.00',
      'image': 'assets/others/fertilizer.png'
    },
    {
      'name': 'gardening tool',
      'price': '450.00',
      'image': 'assets/others/gardening_tool.png'
    },
    {
      'name': 'seed drill machine',
      'price': '100 000.00',
      'image': 'assets/others/seed_drill_machine.png'
    },
    {
      'name': 'fertilizer',
      'price': '240.00',
      'image': 'assets/others/fertilizer.png'
    },
    {
      'name': 'fertilizer',
      'price': '120.00',
      'image': 'assets/others/Fertilizer_1.png'
    },
    {
      'name': 'Spray machine',
      'price': '250.00',
      'image': 'assets/others/Spray_machine.png'
    },
    {
      'name': 'machine',
      'price': '340.00',
      'image': 'assets/others/machine.png'
    },
    {
      'name': 'fertilizer',
      'price': '220.00',
      'image': 'assets/others/Fertilizer_2.png'
    },
    {
      'name': 'fertilizer',
      'price': '300.00',
      'image': 'assets/others/Fertilizer_3.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Others", style: TextStyle(color: Colors.black)),
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
    Key? key,
    required this.imageUrl,
    required this.productName,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}
