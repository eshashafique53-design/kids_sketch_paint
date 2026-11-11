import 'package:flutter/material.dart';
import 'categories_screen.dart';
import 'nature_screen.dart';
import 'animals_screen.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const Color cream = Color(0xFFFFF9EF);
  static const Color purple = Color(0xFF8064D9);
  static const Color dark = Color(0xFF39334D);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(22, 18, 22, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top bar
              Row(
                children: [
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFD66B),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.palette_rounded,
                      color: purple,
                      size: 29,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Kids Sketch & Paint',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                            color: dark,
                          ),
                        ),
                        Text(
                          'Your creative little world',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF8A8096),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications_none_rounded,
                        color: dark,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              // Greeting
              const Text(
                'Hello, Little Artist! 👋',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w900,
                  color: dark,
                ),
              ),
              const SizedBox(height: 7),
              const Text(
                'What will you create today?',
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF847990),
                ),
              ),

              const SizedBox(height: 23),

              // Main banner
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(21),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8E0FF),
                  borderRadius: BorderRadius.circular(27),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'IMAGINE IT!',
                            style: TextStyle(
                              fontSize: 11,
                              letterSpacing: 1.8,
                              fontWeight: FontWeight.w900,
                              color: purple,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Make Art\nYour Way',
                            style: TextStyle(
                              fontSize: 27,
                              height: 1.15,
                              fontWeight: FontWeight.w900,
                              color: dark,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Draw, color and have fun!',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF716681),
                            ),
                          ),
                          const SizedBox(height: 15),
                          FilledButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                  const DrawingPlaceholder(
                                    title: 'Free Draw',
                                  ),
                                ),
                              );
                            },
                            style: FilledButton.styleFrom(
                              backgroundColor: purple,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 17,
                                vertical: 12,
                              ),
                            ),
                            child: const Text('Start Creating'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.draw_rounded,
                      size: 100,
                      color: Color(0xFF9B86E8),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 27),

              // Quick actions
              const Text(
                'Let’s Get Creative',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w900,
                  color: dark,
                ),
              ),
              const SizedBox(height: 14),

              Row(
                children: [
                  Expanded(
                    child: _ActionCard(
                      title: 'Free Draw',
                      subtitle: 'Draw anything',
                      icon: Icons.brush_rounded,
                      color: const Color(0xFFFFE2D7),
                      iconColor: const Color(0xFFE98268),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const DrawingPlaceholder(
                              title: 'Free Draw',
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 13),
                  Expanded(
                    child: _ActionCard(
                      title: 'Guided Draw',
                      subtitle: 'Learn step by step',
                      icon: Icons.menu_book_rounded,
                      color: const Color(0xFFDDF4E9),
                      iconColor: const Color(0xFF48A987),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const DrawingPlaceholder(
                              title: 'Guided Draw',
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 27),

              // Categories heading
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Explore Categories',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: dark,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const CategoriesScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'See all',
                      style: TextStyle(
                        color: purple,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 9),

              // Category grid
              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.91,
                children: const [
                  _CategoryCard(
                    title: 'Animals',
                    icon: Icons.pets_rounded,
                    color: Color(0xFFFFE6B8),
                  ),
                  _CategoryCard(
                    title: 'Fruits',
                    icon: Icons.apple_rounded,
                    color: Color(0xFFFFDDE3),
                  ),
                  _CategoryCard(
                    title: 'Vegetables',
                    icon: Icons.eco_rounded,
                    color: Color(0xFFDDF2D4),
                  ),
                  _CategoryCard(
                    title: 'Homes',
                    icon: Icons.home_rounded,
                    color: Color(0xFFE5DEFF),
                  ),
                  _CategoryCard(
                    title: 'Nature',
                    icon: Icons.park_rounded,
                    color: Color(0xFFD7F1EF),
                  ),
                  _CategoryCard(
                    title: 'Things',
                    icon: Icons.toys_rounded,
                    color: Color(0xFFFFE8D2),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // Daily challenge
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFE6A8),
                  borderRadius: BorderRadius.circular(23),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.75),
                        borderRadius: BorderRadius.circular(17),
                      ),
                      child: const Icon(
                        Icons.emoji_events_rounded,
                        color: Color(0xFFE7A52B),
                        size: 32,
                      ),
                    ),
                    const SizedBox(width: 13),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Today’s Challenge',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              color: dark,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Create something amazing today!',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF786548),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 18,
                      color: dark,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 27),

              // Bottom navigation
              Container(
                padding: const EdgeInsets.symmetric(vertical: 13),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(23),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _NavItem(
                      icon: Icons.home_rounded,
                      label: 'Home',
                      active: true,
                    ),
                    _NavItem(
                      icon: Icons.grid_view_rounded,
                      label: 'Explore',
                    ),
                    _NavItem(
                      icon: Icons.photo_library_rounded,
                      label: 'Gallery',
                    ),
                    _NavItem(
                      icon: Icons.person_rounded,
                      label: 'Profile',
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

class _ActionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final Color iconColor;
  final VoidCallback onTap;

  const _ActionCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(22),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 35, color: iconColor),
            const SizedBox(height: 13),
            Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w900,
                color: HomeScreen.dark,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 11,
                color: Color(0xFF786F83),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const _CategoryCard({
    required this.title,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (title == 'Nature') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NatureScreen(),
            ),
          );
        } else if (title == 'Animals') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AnimalsScreen(),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DrawingPlaceholder(title: title),
            ),
          );
        }
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 39, color: HomeScreen.dark),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w800,
                color: HomeScreen.dark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool active;

  const _NavItem({
    required this.icon,
    required this.label,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = active
        ? const Color(0xFF8064D9)
        : const Color(0xFFAAA2B5);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 23),
        const SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            fontWeight: active ? FontWeight.w800 : FontWeight.w500,
            color: color,
          ),
        ),
      ],
    );
  }
}

// Temporary destination until the next screens are developed.
class DrawingPlaceholder extends StatelessWidget {
  final String title;

  const DrawingPlaceholder({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HomeScreen.cream,
      appBar: AppBar(
        backgroundColor: HomeScreen.cream,
        title: Text(title),
      ),
      body: Center(
        child: Text(
          '$title screen will be added next!',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: HomeScreen.dark,
          ),
        ),
      ),
    );
  }
}