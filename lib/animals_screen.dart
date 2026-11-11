import 'package:flutter/material.dart';
import 'drawing_steps.dart';
class AnimalsScreen extends StatelessWidget {
  const AnimalsScreen({super.key});

  static const Color cream = Color(0xFFFFF9EF);
  static const Color dark = Color(0xFF39334D);
  static const Color purple = Color(0xFF8064D9);

  static const List<Map<String, dynamic>> animals = [
    {
      'name': 'Cat',
      'emoji': '🐱',
      'color': Color(0xFFFFE2D7),
      'level': 'Easy',
    },
    {
      'name': 'Dog',
      'emoji': '🐶',
      'color': Color(0xFFFFE6B8),
      'level': 'Easy',
    },
    {
      'name': 'Lion',
      'emoji': '🦁',
      'color': Color(0xFFFFE3AC),
      'level': 'Medium',
    },
    {
      'name': 'Elephant',
      'emoji': '🐘',
      'color': Color(0xFFE5DEFF),
      'level': 'Medium',
    },
    {
      'name': 'Rabbit',
      'emoji': '🐰',
      'color': Color(0xFFFFDDE3),
      'level': 'Easy',
    },
    {
      'name': 'Butterfly',
      'emoji': '🦋',
      'color': Color(0xFFD7F1EF),
      'level': 'Easy',
    },
    {
      'name': 'Fish',
      'emoji': '🐠',
      'color': Color(0xFFDCEEFF),
      'level': 'Easy',
    },
    {
      'name': 'Bird',
      'emoji': '🐦',
      'color': Color(0xFFDDF2D4),
      'level': 'Easy',
    },
    {
      'name': 'Panda',
      'emoji': '🐼',
      'color': Color(0xFFECE5F5),
      'level': 'Medium',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 25),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  // Header
                  Row(
                    children: [
                      _BackButton(
                        onTap: () => Navigator.pop(context),
                      ),
                      const SizedBox(width: 13),
                      const Expanded(
                        child: Text(
                          'Animal World',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            color: dark,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFE6B8),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Icon(
                          Icons.pets_rounded,
                          color: Color(0xFFB47A2C),
                          size: 25,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  // Banner
                  Container(
                    padding: const EdgeInsets.all(21),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE5DEFF),
                      borderRadius: BorderRadius.circular(26),
                    ),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'MEET YOUR ANIMAL FRIENDS',
                                style: TextStyle(
                                  fontSize: 10,
                                  letterSpacing: 1.2,
                                  fontWeight: FontWeight.w900,
                                  color: purple,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Draw Cute\nAnimal Friends!',
                                style: TextStyle(
                                  fontSize: 25,
                                  height: 1.2,
                                  fontWeight: FontWeight.w900,
                                  color: dark,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Pick one and start creating.',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF716681),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          '🦁',
                          style: TextStyle(fontSize: 67),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // Section title
                  const Text(
                    'Choose an Animal',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w900,
                      color: dark,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Start with easy drawings or try a challenge!',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF847990),
                    ),
                  ),
                  const SizedBox(height: 17),
                ]),
              ),
            ),

            // Animal cards
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    final animal = animals[index];

                    return InkWell(
                      borderRadius: BorderRadius.circular(23),



                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DrawingStepsScreen(
                              animalName: animal['name'] as String,
                              emoji: animal['emoji'] as String,
                              color: animal['color'] as Color,
                              level: animal['level'] as String,
                            ),
                          ),
                        );
                      },


                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: animal['color'] as Color,
                          borderRadius: BorderRadius.circular(23),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Center(
                                child: Text(
                                  animal['emoji'] as String,
                                  style: const TextStyle(fontSize: 57),
                                ),
                              ),
                            ),
                            Text(
                              animal['name'] as String,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w900,
                                color: dark,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                animal['level'] as String,
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: dark,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                          ],
                        ),
                      ),
                    );
                  },
                  childCount: animals.length,
                ),
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 0.88,
                ),
              ),
            ),

            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 22, 20, 25),
              sliver: SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(19),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.tips_and_updates_rounded,
                        color: Color(0xFFE7AE3E),
                        size: 28,
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Tip: Look carefully at the shapes before you draw!',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: dark,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  final VoidCallback onTap;

  const _BackButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: const SizedBox(
          height: 45,
          width: 45,
          child: Icon(
            Icons.arrow_back_rounded,
            color: Color(0xFF39334D),
          ),
        ),
      ),
    );
  }
}

// Temporary destination for each animal.
class AnimalDetailScreen extends StatelessWidget {
  final String animalName;
  final String emoji;
  final Color color;
  final String level;

  const AnimalDetailScreen({
    super.key,
    required this.animalName,
    required this.emoji,
    required this.color,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF9EF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF9EF),
        title: Text('$animalName Drawing'),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(24),
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(28),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(emoji, style: const TextStyle(fontSize: 90)),
              const SizedBox(height: 15),
              Text(
                'Let’s Draw a $animalName!',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF39334D),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Difficulty: $level',
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xFF8064D9),
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 18),
              const Text(
                'The drawing steps will be added in the next screen.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFF716681)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}