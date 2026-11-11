import 'package:flutter/material.dart';
import 'animals_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  static const Color cream = Color(0xFFFFF9EF);
  static const Color dark = Color(0xFF39334D);
  static const Color purple = Color(0xFF8064D9);

  static const List<Map<String, dynamic>> categories = [
    {
      'name': 'Animals',
      'subtitle': 'Cute animal drawings',
      'icon': Icons.pets_rounded,
      'color': Color(0xFFFFE6B8),
    },
    {
      'name': 'Fruits',
      'subtitle': 'Sweet and colorful',
      'icon': Icons.apple_rounded,
      'color': Color(0xFFFFDDE3),
    },
    {
      'name': 'Vegetables',
      'subtitle': 'Healthy little veggies',
      'icon': Icons.eco_rounded,
      'color': Color(0xFFDDF2D4),
    },
    {
      'name': 'Homes',
      'subtitle': 'Houses and buildings',
      'icon': Icons.home_rounded,
      'color': Color(0xFFE5DEFF),
    },
    {
      'name': 'Nature',
      'subtitle': 'Flowers, trees and more',
      'icon': Icons.park_rounded,
      'color': Color(0xFFD7F1EF),
    },
    {
      'name': 'Non-Living Things',
      'subtitle': 'Toys and everyday objects',
      'icon': Icons.toys_rounded,
      'color': Color(0xFFFFE8D2),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(22, 15, 22, 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                        color: dark,
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  const Expanded(
                    child: Text(
                      'Explore Categories',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w900,
                        color: dark,
                      ),
                    ),
                  ),
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFE6B8),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(
                      Icons.palette_rounded,
                      color: purple,
                      size: 25,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 27),

              // Intro banner
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(21),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8E0FF),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'PICK YOUR FAVORITE!',
                            style: TextStyle(
                              fontSize: 10,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.w900,
                              color: purple,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'What shall we\ndraw today?',
                            style: TextStyle(
                              fontSize: 24,
                              height: 1.2,
                              fontWeight: FontWeight.w900,
                              color: dark,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Choose a world of creativity.',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF716681),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Icon(
                      Icons.auto_awesome_rounded,
                      size: 76,
                      color: Color(0xFF9B86E8),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                'All Categories',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  color: dark,
                ),
              ),
              const SizedBox(height: 7),
              const Text(
                'Tap a category to explore its drawings.',
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFF847990),
                ),
              ),

              const SizedBox(height: 18),

              // Category cards
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: categories.length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 0.98,
                ),
                itemBuilder: (context, index) {
                  final item = categories[index];

                  return InkWell(
                    borderRadius: BorderRadius.circular(23),

                    onTap: () {
                      if (item['name'] == 'Animals') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const AnimalsScreen(),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CategoryDetailScreen(
                              categoryName: item['name'] as String,
                              categoryColor: item['color'] as Color,
                              categoryIcon: item['icon'] as IconData,
                            ),
                          ),
                        );
                      }
                    },

                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: item['color'] as Color,
                        borderRadius: BorderRadius.circular(23),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 61,
                            width: 61,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.75),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Icon(
                              item['icon'] as IconData,
                              size: 36,
                              color: dark,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            item['name'] as String,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              color: dark,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            item['subtitle'] as String,
                            style: const TextStyle(
                              fontSize: 11,
                              color: Color(0xFF716681),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Align(
                            alignment: Alignment.centerRight,
                            child: Icon(
                              Icons.arrow_forward_rounded,
                              size: 21,
                              color: dark,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),

              // Bottom tip
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.lightbulb_rounded,
                      color: Color(0xFFE7AE3E),
                      size: 28,
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Tip: Start with easy drawings and have fun!',
                        style: TextStyle(
                          fontSize: 12,
                          color: dark,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Temporary category destination.
// We will build the actual drawing lists in the next screens.
class CategoryDetailScreen extends StatelessWidget {
  final String categoryName;
  final Color categoryColor;
  final IconData categoryIcon;

  const CategoryDetailScreen({
    super.key,
    required this.categoryName,
    required this.categoryColor,
    required this.categoryIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF9EF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF9EF),
        title: Text(categoryName),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: categoryColor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(categoryIcon, size: 75, color: const Color(0xFF39334D)),
              const SizedBox(height: 15),
              Text(
                '$categoryName Drawings',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF39334D),
                ),
              ),
              const SizedBox(height: 8),
              const Text('Drawing collection will be added next.'),
            ],
          ),
        ),
      ),
    );
  }
}