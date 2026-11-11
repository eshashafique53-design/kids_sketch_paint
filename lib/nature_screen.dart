import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'painting_screen.dart';
import 'dart:typed_data';

class NatureScreen extends StatefulWidget {
  final Uint8List? drawingBytes;

  const NatureScreen({
    super.key,
    this.drawingBytes,
  });

  @override
  State<NatureScreen> createState() => _NatureScreenState();
}

class _NatureScreenState extends State<NatureScreen> {
  static const Color blue = Color(0xFF174C9C);
  static const Color purple = Color(0xFF8950F5);

  int selectedCategory = 0;

  final List<String> categories = [
    'All',
    'My Drawings',
    'Trees',
    'Flowers',
    'Mountains',
    'Rivers',
    'Landscapes',
  ];

  final List<Map<String, dynamic>> drawings = [
    {'name': 'Tree', 'emoji': '🌳', 'category': 'Trees',
      'date': '14 Aug 2025', 'color': Color(0xFFE3F9E2)},
    {'name': 'Sunflower', 'emoji': '🌻', 'category': 'Flowers',
      'date': '12 Aug 2025', 'color': Color(0xFFFFE9F1)},
    {'name': 'Mountains', 'emoji': '🏔️', 'category': 'Mountains',
      'date': '10 Aug 2025', 'color': Color(0xFFDDF4FF)},
    {'name': 'River', 'emoji': '🏞️', 'category': 'Rivers',
      'date': '7 Aug 2025', 'color': Color(0xFFEAE7FF)},
    {'name': 'Flowers', 'emoji': '🌸', 'category': 'Flowers',
      'date': '5 Aug 2025', 'color': Color(0xFFFFF4D8)},
    {'name': 'Lake', 'emoji': '🌅', 'category': 'Landscapes',
      'date': '2 Aug 2025', 'color': Color(0xFFE0F9E5)},
    {'name': 'Forest', 'emoji': '🦌', 'category': 'Trees',
      'date': '30 Jul 2025', 'color': Color(0xFFDDF8F5)},
    {'name': 'Beach', 'emoji': '🏝️', 'category': 'Landscapes',
      'date': '28 Jul 2025', 'color': Color(0xFFF7E5FF)},
    {'name': 'Butterfly', 'emoji': '🦋', 'category': 'Flowers',
      'date': '25 Jul 2025', 'color': Color(0xFFEDE9FF)},
  ];

  List<Map<String, dynamic>> get filteredDrawings {
    if (selectedCategory == 0) return drawings;

    return drawings.where((drawing) {
      return drawing['category'] == categories[selectedCategory];
    }).toList();
  }
  @override
  void initState() {
    super.initState();

    if (widget.drawingBytes != null) {
      drawings.insert(0, {
        'name': 'My Drawing',
        'emoji': '',
        'category': 'My Drawings',
        'date': 'Today',
        'color': Colors.white,
        'imageBytes': widget.drawingBytes,
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFCF5),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(15, 12, 15, 15),
                child: Column(
                  children: [
                    _buildHeader(),
                    const SizedBox(height: 25),
                    _buildCategories(),
                    const SizedBox(height: 20),
                    _buildDrawingGrid(),
                    const SizedBox(height: 20),
                    _buildTip(),
                  ],
                ),
              ),
            ),
            _buildBottomNavigation(),
          ],
        ),
      ),
    );
  }

  // HEADER
  Widget _buildHeader() {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            height: 48,
            width: 48,
            decoration: const BoxDecoration(
              color: Color(0xFFDCC5FF),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.arrow_back_rounded,
              color: blue,
              size: 28,
            ),
          ),
        ),
        const Expanded(
          child: Column(
            children: [
              Text(
                '🌿 Nature 🌿',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  color: blue,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Explore the beauty of nature through drawing!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: blue,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const Text('🌞', style: TextStyle(fontSize: 35)),
      ],
    );
  }

  // CATEGORY FILTERS
  Widget _buildCategories() {
    return SizedBox(
      height: 43,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final isSelected = selectedCategory == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCategory = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(right: 9),
              padding: const EdgeInsets.symmetric(horizontal: 17),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isSelected
                    ? purple
                    : const Color(0xFFF1F0FF),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: isSelected
                      ? purple
                      : const Color(0xFFE4E0FF),
                ),
              ),
              child: Text(
                categories[index],
                style: TextStyle(
                  color: isSelected ? Colors.white : blue,
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // DRAWING GRID
  Widget _buildDrawingGrid() {
    final items = filteredDrawings;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 12,
        childAspectRatio: 0.77,
      ),
      itemBuilder: (context, index) {
        final drawing = items[index];

        return _buildDrawingCard(drawing);
      },
    );
  }

  // DRAWING CARD
  Widget _buildDrawingCard(Map<String, dynamic> drawing) {
    return GestureDetector(
      onTap: () {
        _showDrawingDetails(drawing['name']);
      },
      child: Container(
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          color: drawing['color'] as Color,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: Colors.white,
            width: 1.5,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: FittedBox(
                  child: Center(
                    child: drawing['imageBytes'] != null
                        ? Image.memory(
                      drawing['imageBytes'] as Uint8List,
                      fit: BoxFit.contain,
                    )
                        : FittedBox(
                      child: Text(
                        drawing['emoji'] as String,
                        style: const TextStyle(fontSize: 65),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                drawing['name'] as String,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: blue,
                  fontSize: 13,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            const SizedBox(height: 3),
            Row(
              children: [
                Expanded(
                  child: Text(
                    drawing['date'] as String,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFF6885B6),
                      fontSize: 9,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _showDrawingDetails(drawing['name']);
                  },
                  child: const Icon(
                    Icons.more_horiz_rounded,
                    color: blue,
                    size: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // DRAWING DETAILS
  void _showDrawingDetails(String name) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '🎨 $name',
                style: const TextStyle(
                  fontSize: 23,
                  color: blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Would you like to practice drawing this picture?',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PaintingScreen(),
                    ),
                  );
                },
                child: const Text('Start Drawing'),
              ),
            ],
          ),
        );
      },
    );
  }

  // TIP SECTION
  Widget _buildTip() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F9E8),
        borderRadius: BorderRadius.circular(23),
        border: Border.all(
          color: const Color(0xFFD0F1D0),
        ),
      ),
      child: const Row(
        children: [
          Text('🎨', style: TextStyle(fontSize: 35)),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tip:',
                  style: TextStyle(
                    color: blue,
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  'Use simple shapes and soft colors to make your nature drawings look beautiful!',
                  style: TextStyle(
                    color: blue,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // BOTTOM NAVIGATION
  Widget _buildBottomNavigation() {
    final icons = [
      Icons.home_outlined,
      Icons.grid_view_rounded,
      Icons.image_outlined,
      Icons.emoji_events_outlined,
      Icons.person_outline_rounded,
    ];

    final labels = [
      'Home',
      'Categories',
      'Gallery',
      'Challenges',
      'Profile',
    ];

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 8,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      child: Row(
        children: List.generate(5, (index) {
          final selected = index == 1;

          return Expanded(
            child: GestureDetector(
              onTap: () {
                if (index == 4) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileScreen(),
                    ),
                  );
                } else if (index != 1) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '${labels[index]} screen will be connected later.',
                      ),
                    ),
                  );
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 9),
                margin: const EdgeInsets.symmetric(horizontal: 3),
                decoration: BoxDecoration(
                  color: selected
                      ? const Color(0xFFF0E8FF)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      icons[index],
                      size: 25,
                      color: selected
                          ? purple
                          : const Color(0xFF8190B4),
                    ),
                    const SizedBox(height: 4),
                    FittedBox(
                      child: Text(
                        labels[index],
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          color: selected
                              ? purple
                              : const Color(0xFF8190B4),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}