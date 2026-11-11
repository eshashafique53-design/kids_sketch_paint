import 'package:flutter/material.dart';
import 'home_screen.dart';
void main() {
  runApp(const KidsSketchPaintApp());
}

class KidsSketchPaintApp extends StatelessWidget {
  const KidsSketchPaintApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kids Sketch & Paint',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const cream = Color(0xFFFFF9EF);
    const purple = Color(0xFF8064D9);
    const darkText = Color(0xFF39334D);

    return Scaffold(
      backgroundColor: cream,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 26,
                    vertical: 22,
                  ),
                  child: Column(
                    children: [
                      // App logo and name
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFD66B),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Icon(
                              Icons.palette_rounded,
                              size: 28,
                              color: Color(0xFF7654C8),
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'Kids Sketch & Paint',
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w800,
                              color: darkText,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 22),

                      // Welcome heading
                      const Text(
                        'Let’s Create!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w900,
                          color: darkText,
                          letterSpacing: -0.8,
                        ),
                      ),

                      const SizedBox(height: 8),

                      const Text(
                        'Little Hands • Big Imagination',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF82778D),
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      const SizedBox(height: 25),

                      // Main illustration area
                      Container(
                        width: double.infinity,
                        constraints: const BoxConstraints(
                          minHeight: 310,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFE8D9),
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              top: 24,
                              left: 28,
                              child: _decoration(
                                Icons.star_rounded,
                                const Color(0xFFFFC857),
                                38,
                              ),
                            ),
                            Positioned(
                              top: 45,
                              right: 30,
                              child: _decoration(
                                Icons.favorite_rounded,
                                const Color(0xFFF58EAD),
                                30,
                              ),
                            ),
                            Positioned(
                              bottom: 35,
                              left: 25,
                              child: _decoration(
                                Icons.circle,
                                const Color(0xFF8BD9C5),
                                17,
                              ),
                            ),
                            Positioned(
                              bottom: 48,
                              right: 28,
                              child: _decoration(
                                Icons.star_rounded,
                                const Color(0xFF9B8AF4),
                                31,
                              ),
                            ),

                            // Drawing paper
                            Container(
                              width: 225,
                              height: 245,
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(22),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFFB98D80)
                                        .withOpacity(0.15),
                                    blurRadius: 18,
                                    offset: const Offset(0, 8),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'MY HAPPY ART',
                                    style: TextStyle(
                                      fontSize: 11,
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xFF9B8AF4),
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Container(
                                    height: 112,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFDDF4FF),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        const Positioned(
                                          top: 8,
                                          right: 13,
                                          child: Icon(
                                            Icons.wb_sunny_rounded,
                                            color: Color(0xFFFFC857),
                                            size: 34,
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 0,
                                          left: 0,
                                          right: 0,
                                          child: Container(
                                            height: 39,
                                            decoration: const BoxDecoration(
                                              color: Color(0xFF9EDDB1),
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                Radius.circular(16),
                                                bottomRight:
                                                Radius.circular(16),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const Positioned(
                                          bottom: 14,
                                          child: Icon(
                                            Icons.home_rounded,
                                            color: Color(0xFFFF8F70),
                                            size: 69,
                                          ),
                                        ),
                                        const Positioned(
                                          bottom: 12,
                                          child: Icon(
                                            Icons.window_rounded,
                                            color: Color(0xFF8064D9),
                                            size: 25,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      _ColorDot(color: Color(0xFFFF8F70)),
                                      SizedBox(width: 8),
                                      _ColorDot(color: Color(0xFFFFC857)),
                                      SizedBox(width: 8),
                                      _ColorDot(color: Color(0xFF8BD9C5)),
                                      SizedBox(width: 8),
                                      _ColorDot(color: Color(0xFF9B8AF4)),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            // Pencil decoration
                            Positioned(
                              bottom: 18,
                              right: 42,
                              child: Transform.rotate(
                                angle: -0.45,
                                child: const Icon(
                                  Icons.edit_rounded,
                                  size: 52,
                                  color: Color(0xFF8064D9),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 25),

                      const Text(
                        'Draw, color and explore!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: darkText,
                        ),
                      ),

                      const SizedBox(height: 8),

                      const Text(
                        'Turn your little ideas into colorful masterpieces.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.5,
                          color: Color(0xFF82778D),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Get Started button
                      SizedBox(
                        width: double.infinity,
                        height: 58,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: purple,
                            foregroundColor: Colors.white,
                            elevation: 4,
                            shadowColor: purple.withOpacity(0.3),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Get Started',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              SizedBox(width: 10),
                              Icon(Icons.arrow_forward_rounded),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 15),

                      const Text(
                        'Made with love for little artists ♥',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFFAA9EAF),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  static Widget _decoration(
      IconData icon,
      Color color,
      double size,
      ) {
    return Icon(icon, color: color, size: size);
  }
}

class _ColorDot extends StatelessWidget {
  final Color color;

  const _ColorDot({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 13,
      width: 13,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}

// Temporary Screen 2 so the Get Started button works.
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFFFF9EF),
//       appBar: AppBar(
//         backgroundColor: const Color(0xFFFFF9EF),
//         title: const Text('Kids Sketch & Paint'),
//       ),
//       body: const Center(
//         child: Text(
//           'Welcome, Little Artist!',
//           style: TextStyle(
//             fontSize: 26,
//             fontWeight: FontWeight.bold,
//             color: Color(0xFF8064D9),
//           ),
//         ),
//       ),
//     );
//   }
// }