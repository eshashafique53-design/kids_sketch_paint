import 'package:flutter/material.dart';
import 'painting_screen.dart';
class DrawingStepsScreen extends StatefulWidget {
  final String animalName;
  final String emoji;
  final Color color;
  final String level;

  const DrawingStepsScreen({
    super.key,
    this.animalName = 'Cat',
    this.emoji = '🐱',
    this.color = const Color(0xFFFFE2D7),
    this.level = 'Easy',
  });

  @override
  State<DrawingStepsScreen> createState() =>
      _DrawingStepsScreenState();
}

class _DrawingStepsScreenState extends State<DrawingStepsScreen> {
  int currentStep = 0;

  static const Color cream = Color(0xFFFFF9EF);
  static const Color purple = Color(0xFF8064D9);
  static const Color dark = Color(0xFF39334D);

  List<Map<String, String>> get steps {
    switch (widget.animalName.toLowerCase()) {
      case 'dog':
        return [
          {'title': 'Draw the head', 'description': 'Draw a big rounded shape for the dog face.', 'tip': 'Keep the shape simple.'},
          {'title': 'Add floppy ears', 'description': 'Draw two long ears on both sides.', 'tip': 'Make the ears hang down.'},
          {'title': 'Draw the face', 'description': 'Add two eyes, a nose and a smiling mouth.', 'tip': 'Place the nose in the center.'},
          {'title': 'Draw the body', 'description': 'Draw an oval shape below the head.', 'tip': 'Keep the body connected to the head.'},
          {'title': 'Add legs and tail', 'description': 'Draw four legs and a curved tail.', 'tip': 'Make the legs almost equal.'},
          {'title': 'Complete your dog', 'description': 'Complete the outline and add final details.', 'tip': 'Get ready to paint your dog!'},
        ];

      case 'lion':
        return [
          {'title': 'Draw the face', 'description': 'Draw a circle for the lion face.', 'tip': 'Start with a light circle.'},
          {'title': 'Add the mane', 'description': 'Draw a large wavy mane around the face.', 'tip': 'Make it look fluffy.'},
          {'title': 'Draw facial features', 'description': 'Add eyes, nose and mouth.', 'tip': 'Keep the face in the center.'},
          {'title': 'Draw the body', 'description': 'Draw an oval body below the head.', 'tip': 'Keep the body balanced.'},
          {'title': 'Add legs and tail', 'description': 'Draw four legs and a long tail.', 'tip': 'Add a fluffy tail tip.'},
          {'title': 'Complete your lion', 'description': 'Add final details to the lion.', 'tip': 'Your lion is ready to paint!'},
        ];

      case 'elephant':
        return [
          {'title': 'Draw the head', 'description': 'Draw a large rounded head.', 'tip': 'Keep it wide.'},
          {'title': 'Add big ears', 'description': 'Draw two large ears on both sides.', 'tip': 'Make the ears wide.'},
          {'title': 'Draw the trunk', 'description': 'Draw a long curved trunk.', 'tip': 'Curve it gently.'},
          {'title': 'Add face details', 'description': 'Draw eyes and two small tusks.', 'tip': 'Keep the eyes simple.'},
          {'title': 'Draw body and legs', 'description': 'Add the body and four thick legs.', 'tip': 'Make the legs strong.'},
          {'title': 'Complete your elephant', 'description': 'Add final details to the elephant.', 'tip': 'Your elephant is ready to paint!'},
        ];

      case 'rabbit':
        return [
          {'title': 'Draw the head', 'description': 'Draw a round shape for the head.', 'tip': 'Keep it soft and round.'},
          {'title': 'Add long ears', 'description': 'Draw two long ears on top.', 'tip': 'Make them tall.'},
          {'title': 'Draw the face', 'description': 'Add eyes, nose and mouth.', 'tip': 'Give your rabbit a cute face.'},
          {'title': 'Draw the body', 'description': 'Draw a rounded body below the head.', 'tip': 'Keep it slightly oval.'},
          {'title': 'Add legs and tail', 'description': 'Draw four small legs and a round tail.', 'tip': 'Keep the tail fluffy.'},
          {'title': 'Complete your rabbit', 'description': 'Add final details to the rabbit.', 'tip': 'Your rabbit is ready to paint!'},
        ];

      case 'butterfly':
        return [
          {'title': 'Draw the body', 'description': 'Draw a long thin body in the center.', 'tip': 'Keep it vertical.'},
          {'title': 'Add upper wings', 'description': 'Draw two large upper wings.', 'tip': 'Make both sides similar.'},
          {'title': 'Add lower wings', 'description': 'Draw two smaller lower wings.', 'tip': 'Keep them rounded.'},
          {'title': 'Draw antennae', 'description': 'Add two curved antennae.', 'tip': 'Draw them above the head.'},
          {'title': 'Add wing patterns', 'description': 'Draw circles and patterns inside the wings.', 'tip': 'Try different shapes.'},
          {'title': 'Complete your butterfly', 'description': 'Finish the outline and details.', 'tip': 'Your butterfly is ready to paint!'},
        ];

      case 'fish':
        return [
          {'title': 'Draw the body', 'description': 'Draw an oval shape for the fish body.', 'tip': 'Keep it horizontal.'},
          {'title': 'Add the tail', 'description': 'Draw a triangle at the back.', 'tip': 'Make the tail wide.'},
          {'title': 'Add fins', 'description': 'Draw top and bottom fins.', 'tip': 'Use triangle shapes.'},
          {'title': 'Draw the face', 'description': 'Add an eye and a small mouth.', 'tip': 'Keep the eye round.'},
          {'title': 'Add scales', 'description': 'Draw small curved lines on the body.', 'tip': 'Do not make them too crowded.'},
          {'title': 'Complete your fish', 'description': 'Finish the outline and details.', 'tip': 'Your fish is ready to paint!'},
        ];

      case 'bird':
        return [
          {'title': 'Draw the head', 'description': 'Draw a small circle for the head.', 'tip': 'Keep it round.'},
          {'title': 'Draw the body', 'description': 'Draw a bigger oval below the head.', 'tip': 'Make it slightly tilted.'},
          {'title': 'Add the beak', 'description': 'Draw a small triangle for the beak.', 'tip': 'Place it in front of the head.'},
          {'title': 'Add the eye', 'description': 'Draw a small round eye.', 'tip': 'Place it near the beak.'},
          {'title': 'Draw wings and tail', 'description': 'Add a wing and tail feathers.', 'tip': 'Use curved lines.'},
          {'title': 'Complete your bird', 'description': 'Finish the outline and details.', 'tip': 'Your bird is ready to paint!'},
        ];

      case 'panda':
        return [
          {'title': 'Draw the head', 'description': 'Draw a big round head.', 'tip': 'Keep it circular.'},
          {'title': 'Add round ears', 'description': 'Draw two small round ears.', 'tip': 'Place one on each side.'},
          {'title': 'Draw the face', 'description': 'Add black eye patches, eyes and nose.', 'tip': 'Make the eye patches oval.'},
          {'title': 'Draw the body', 'description': 'Draw a round body below the head.', 'tip': 'Keep it slightly wide.'},
          {'title': 'Add arms and legs', 'description': 'Draw two arms and two legs.', 'tip': 'Keep them short and rounded.'},
          {'title': 'Complete your panda', 'description': 'Add final details to your panda.', 'tip': 'Your panda is ready to paint!'},
        ];

      default:
        return [
          {'title': 'Start with basic shapes', 'description': 'Draw a big circle for the head.', 'tip': 'Keep your lines light and gentle.'},
          {'title': 'Add the ears', 'description': 'Draw two small triangles on top.', 'tip': 'Make both ears almost the same size.'},
          {'title': 'Draw the face', 'description': 'Add two eyes, a tiny nose and a mouth.', 'tip': 'Leave some space between the eyes.'},
          {'title': 'Finish your drawing', 'description': 'Add whiskers and color your animal.', 'tip': 'Choose your favorite colors!'},
        ];
    }
  }
  @override
  Widget build(BuildContext context) {
    final step = steps[currentStep];

    return Scaffold(
      backgroundColor: cream,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  _backButton(),
                  const SizedBox(width: 13),
                  const Expanded(
                    child: Text(
                      'Drawing Steps',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w900,
                        color: dark,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(11),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8E0FF),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(
                      Icons.auto_awesome_rounded,
                      color: purple,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // Selected animal banner
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: widget.color,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 75,
                      width: 75,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.75),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        widget.emoji,
                        style: const TextStyle(fontSize: 47),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'LET’S LEARN TO DRAW',
                            style: TextStyle(
                              fontSize: 10,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w900,
                              color: purple,
                            ),
                          ),
                          const SizedBox(height: 7),
                          Text(
                            widget.animalName,
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w900,
                              color: dark,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '${widget.level} • ${steps.length} simple steps',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF716681),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // Progress
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Your drawing journey',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w900,
                      color: dark,
                    ),
                  ),
                  Text(
                    '${currentStep + 1} of ${steps.length}',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: purple,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: LinearProgressIndicator(
                  value: (currentStep + 1) / steps.length,
                  minHeight: 9,
                  backgroundColor: const Color(0xFFE8E0FF),
                  valueColor:
                  const AlwaysStoppedAnimation<Color>(purple),
                ),
              ),

              const SizedBox(height: 24),

              // Drawing preview
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.edit_rounded,
                          color: purple,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Step ${currentStep + 1}: ${step['title']}',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                              color: dark,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 230,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF8ED),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0xFFF0E6D7),
                        ),
                      ),
                      child: CustomPaint(
                        painter: _StepDrawingPainter(
                          step: currentStep,
                          animalName: widget.animalName,
                        ),
                      ),
                    ),
                    const SizedBox(height: 17),
                    Text(
                      step['description']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: dark,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      step['tip']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF847990),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              // Step selector
              Row(
                children: List.generate(steps.length, (index) {
                  final selected = currentStep == index;

                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          currentStep = index;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          right: index == steps.length - 1 ? 0 : 9,
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 13,
                        ),
                        decoration: BoxDecoration(
                          color: selected
                              ? purple
                              : const Color(0xFFE8E0FF),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Center(
                          child: Text(
                            'Step ${index + 1}',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w800,
                              color: selected ? Colors.white : dark,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),

              const SizedBox(height: 22),

              // Previous and next buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: currentStep == 0
                          ? null
                          : () {
                        setState(() {
                          currentStep--;
                        });
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: purple,
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                        ),
                        side: const BorderSide(color: purple),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text('Previous'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (currentStep < steps.length - 1) {
                          setState(() {
                            currentStep++;
                          });
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => PaintingScreen(
                                animalName: widget.animalName,
                                emoji: widget.emoji,
                              ),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: purple,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        currentStep == steps.length - 1
                            ? 'Finish'
                            : 'Next Step →',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _backButton() {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        onTap: () => Navigator.pop(context),
        borderRadius: BorderRadius.circular(15),
        child: const SizedBox(
          height: 45,
          width: 45,
          child: Icon(
            Icons.arrow_back_rounded,
            color: dark,
          ),
        ),
      ),
    );
  }
}

class _StepDrawingPainter extends CustomPainter {
  final int step;
  final String animalName;

  _StepDrawingPainter({
    required this.step,
    required this.animalName,
  });

  @override

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    final line = Paint()
      ..color = const Color(0xFF8064D9)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.5
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final fill = Paint()
      ..color = const Color(0xFF39334D)
      ..style = PaintingStyle.fill;

    final name = animalName.toLowerCase();

    if (name == 'cat') {
      // Cat
      canvas.drawCircle(
        Offset(center.dx, center.dy + 8),
        54,
        line,
      );

      if (step >= 1) {
        final leftEar = Path()
          ..moveTo(center.dx - 39, center.dy - 29)
          ..lineTo(center.dx - 48, center.dy - 69)
          ..lineTo(center.dx - 13, center.dy - 47)
          ..close();

        final rightEar = Path()
          ..moveTo(center.dx + 39, center.dy - 29)
          ..lineTo(center.dx + 48, center.dy - 69)
          ..lineTo(center.dx + 13, center.dy - 47)
          ..close();

        canvas.drawPath(leftEar, line);
        canvas.drawPath(rightEar, line);
      }

      if (step >= 2) {
        canvas.drawCircle(
          Offset(center.dx - 19, center.dy + 1), 4, fill,
        );
        canvas.drawCircle(
          Offset(center.dx + 19, center.dy + 1), 4, fill,
        );
        canvas.drawCircle(
          Offset(center.dx, center.dy + 20), 4, line,
        );
      }

      if (step >= 3) {
        for (int i = 0; i < 3; i++) {
          final y = center.dy + 16 + i * 10.0;
          canvas.drawLine(
            Offset(center.dx - 35, y),
            Offset(center.dx - 65, y - 5),
            line,
          );
          canvas.drawLine(
            Offset(center.dx + 35, y),
            Offset(center.dx + 65, y - 5),
            line,
          );
        }
      }
    } else if (name == 'dog') {
      // Dog
      canvas.drawCircle(
        Offset(center.dx, center.dy - 25),
        45,
        line,
      );

      if (step >= 1) {
        final leftEar = Path()
          ..moveTo(center.dx - 37, center.dy - 40)
          ..quadraticBezierTo(
            center.dx - 85, center.dy - 15,
            center.dx - 55, center.dy + 25,
          );

        final rightEar = Path()
          ..moveTo(center.dx + 37, center.dy - 40)
          ..quadraticBezierTo(
            center.dx + 85, center.dy - 15,
            center.dx + 55, center.dy + 25,
          );

        canvas.drawPath(leftEar, line);
        canvas.drawPath(rightEar, line);
      }

      if (step >= 2) {
        canvas.drawCircle(
          Offset(center.dx - 16, center.dy - 30), 4, fill,
        );
        canvas.drawCircle(
          Offset(center.dx + 16, center.dy - 30), 4, fill,
        );
        canvas.drawCircle(
          Offset(center.dx, center.dy - 10), 7, fill,
        );
      }

      if (step >= 3) {
        canvas.drawOval(
          Rect.fromCenter(
            center: Offset(center.dx, center.dy + 65),
            width: 95,
            height: 100,
          ),
          line,
        );
      }

      if (step >= 4) {
        for (int i = -1; i <= 1; i += 2) {
          canvas.drawLine(
            Offset(center.dx + i * 30, center.dy + 95),
            Offset(center.dx + i * 30, center.dy + 125),
            line,
          );
          canvas.drawLine(
            Offset(center.dx + i * 30, center.dy + 125),
            Offset(center.dx + i * 45, center.dy + 125),
            line,
          );
        }

        final tail = Path()
          ..moveTo(center.dx + 45, center.dy + 55)
          ..quadraticBezierTo(
            center.dx + 90, center.dy + 15,
            center.dx + 80, center.dy + 65,
          );
        canvas.drawPath(tail, line);
      }
    } else if (name == 'elephant') {
      // Elephant
      canvas.drawOval(
        Rect.fromCenter(
          center: Offset(center.dx, center.dy - 25),
          width: 100,
          height: 95,
        ),
        line,
      );

      if (step >= 1) {
        canvas.drawOval(
          Rect.fromCenter(
            center: Offset(center.dx - 65, center.dy - 25),
            width: 65,
            height: 90,
          ),
          line,
        );
        canvas.drawOval(
          Rect.fromCenter(
            center: Offset(center.dx + 65, center.dy - 25),
            width: 65,
            height: 90,
          ),
          line,
        );
      }

      if (step >= 2) {
        final trunk = Path()
          ..moveTo(center.dx - 10, center.dy + 5)
          ..quadraticBezierTo(
            center.dx - 25, center.dy + 65,
            center.dx + 5, center.dy + 85,
          )
          ..quadraticBezierTo(
            center.dx + 25, center.dy + 90,
            center.dx + 20, center.dy + 65,
          );
        canvas.drawPath(trunk, line);
      }

      if (step >= 3) {
        canvas.drawCircle(
          Offset(center.dx - 27, center.dy - 35), 5, fill,
        );
        canvas.drawCircle(
          Offset(center.dx + 27, center.dy - 35), 5, fill,
        );

        final tusk1 = Path()
          ..moveTo(center.dx - 25, center.dy + 10)
          ..lineTo(center.dx - 45, center.dy + 30)
          ..lineTo(center.dx - 20, center.dy + 25);
        canvas.drawPath(tusk1, line);

        final tusk2 = Path()
          ..moveTo(center.dx + 25, center.dy + 10)
          ..lineTo(center.dx + 45, center.dy + 30)
          ..lineTo(center.dx + 20, center.dy + 25);
        canvas.drawPath(tusk2, line);
      }

      if (step >= 4) {
        canvas.drawOval(
          Rect.fromCenter(
            center: Offset(center.dx, center.dy + 100),
            width: 115,
            height: 75,
          ),
          line,
        );

        for (int i = -1; i <= 1; i += 2) {
          canvas.drawLine(
            Offset(center.dx + i * 35, center.dy + 125),
            Offset(center.dx + i * 35, center.dy + 145),
            line,
          );
        }
      }
    } else {
      // Baqi animals ke liye filhal placeholder
      canvas.drawCircle(center, 50, line);
    }

    final textPainter = TextPainter(
      text: TextSpan(
        text: 'STEP ${step + 1}',
        style: const TextStyle(
          color: Color(0xFF8064D9),
          fontSize: 11,
          fontWeight: FontWeight.w900,
          letterSpacing: 1.4,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset((size.width - textPainter.width) / 2, 15),
    );
  }


  @override
  bool shouldRepaint(covariant _StepDrawingPainter oldDelegate) {
    return oldDelegate.step != step;
  }
}