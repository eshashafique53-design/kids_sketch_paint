import 'package:flutter/material.dart';
import 'nature_screen.dart';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:flutter/rendering.dart';
class PaintingScreen extends StatefulWidget {
  final String animalName;
  final String emoji;

  const PaintingScreen({
    super.key,
    this.animalName = 'Free Draw',
    this.emoji = '🎨',
  });

  @override
  State<PaintingScreen> createState() => _PaintingScreenState();
}

class _PaintingScreenState extends State<PaintingScreen> {
  final GlobalKey canvasKey = GlobalKey();
  static const Color cream = Color(0xFFFFF9EF);
  static const Color purple = Color(0xFF8064D9);
  static const Color dark = Color(0xFF39334D);

  final List<Color> colors = const [
    Color(0xFFFF6B6B),
    Color(0xFFFFB84D),
    Color(0xFFFFD93D),
    Color(0xFF6BCB77),
    Color(0xFF4D96FF),
    Color(0xFF9B72CF),
    Color(0xFFFF8FC7),
    Color(0xFF55CBCD),
    Color(0xFF39334D),
    Colors.brown,
    Colors.white,
    Colors.grey,
  ];

  final List<_PaintStroke> strokes = [];
  _PaintStroke? currentStroke;

  Color selectedColor = const Color(0xFFFF6B6B);
  double brushSize = 6;
  bool showSuggestions = true;

  void startStroke(Offset point) {
    setState(() {
      currentStroke = _PaintStroke(
        points: [point],
        color: selectedColor,
        width: brushSize,
      );
    });
  }

  void updateStroke(Offset point) {
    if (currentStroke == null) return;

    setState(() {
      currentStroke!.points.add(point);
    });
  }

  void finishStroke() {
    if (currentStroke == null) return;

    setState(() {
      strokes.add(currentStroke!);
      currentStroke = null;
    });
  }

  void undoStroke() {
    if (strokes.isEmpty) return;

    setState(() {
      strokes.removeLast();
    });
  }

  void clearCanvas() {
    setState(() {
      strokes.clear();
      currentStroke = null;
    });
  }
  Future<void> saveDrawing() async {
    if (currentStroke != null) {
      finishStroke();
    }

    await WidgetsBinding.instance.endOfFrame;

    final boundary = canvasKey.currentContext!
        .findRenderObject() as RenderRepaintBoundary;

    final image = await boundary.toImage(pixelRatio: 3);

    final byteData = await image.toByteData(
      format: ui.ImageByteFormat.png,
    );

    image.dispose();

    if (byteData == null || !mounted) return;

    final bytes = byteData.buffer.asUint8List();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NatureScreen(
          // drawingBytes: bytes,
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 14, 20, 14),
              child: Row(
                children: [
                  _headerButton(
                    Icons.arrow_back_rounded,
                        () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 13),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Painting Studio',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                            color: dark,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'Color your imagination!',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF847990),
                          ),
                        ),
                      ],
                    ),
                  ),
                  _headerButton(Icons.undo_rounded, undoStroke),
                  const SizedBox(width: 8),
                  _headerButton(Icons.delete_outline_rounded, clearCanvas),
                ],
              ),
            ),

            // Color suggestion
            if (showSuggestions)
              Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 13),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8E0FF),
                  borderRadius: BorderRadius.circular(19),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.lightbulb_rounded,
                      color: purple,
                      size: 28,
                    ),
                    const SizedBox(width: 11),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Color Suggestion',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w900,
                              color: dark,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Try warm colors together, or create your own style!',
                            style: TextStyle(
                              fontSize: 11,
                              color: Color(0xFF716681),
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          showSuggestions = false;
                        });
                      },
                      icon: const Icon(Icons.close_rounded, size: 18),
                    ),
                  ],
                ),
              ),

            // Drawing canvas
            Expanded(
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 15),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: const Color(0xFFE9E1F1),
                    width: 1.5,
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: GestureDetector(
                        onPanStart: (details) {
                          startStroke(details.localPosition);
                        },
                        onPanUpdate: (details) {
                          updateStroke(details.localPosition);
                        },
                        onPanEnd: (_) {
                          finishStroke();
                        },
                        child: RepaintBoundary(
                          key: canvasKey,
                          child: ColoredBox(
                            color: Colors.white,
                            child: CustomPaint(
                              painter: _CanvasPainter(
                                strokes: strokes,
                                currentStroke: currentStroke,
                                animalName: widget.animalName,
                              ),
                              child: const SizedBox.expand(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (strokes.isEmpty && currentStroke == null)
                      const IgnorePointer(
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.gesture_rounded,
                                size: 48,
                                color: Color(0xFFD6C9E8),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Start painting here!',
                                style: TextStyle(
                                  color: Color(0xFFAAA0B8),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Use your finger to draw',
                                style: TextStyle(
                                  color: Color(0xFFB8AEC3),
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    Positioned(
                      top: 12,
                      left: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 11,
                          vertical: 7,
                        ),
                        decoration: BoxDecoration(
                          color: cream,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'MY CANVAS',
                          style: TextStyle(
                            color: purple,
                            fontWeight: FontWeight.w900,
                            fontSize: 10,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Tools panel

            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(27),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Choose Your Color',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color: dark,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: selectedColor,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.check_rounded,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 12,
                      runSpacing: 8,
                      children: colors.map((color) {
                        final selected = selectedColor == color;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedColor = color;
                            });
                          },
                          child: Container(
                            height: 29,
                            width: 29,
                            decoration: BoxDecoration(
                              color: color,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: selected
                                    ? purple
                                    : const Color(0xFFE7E0EC),
                                width: selected ? 3 : 1,
                              ),
                            ),
                            child: selected
                                ? Icon(
                              Icons.check_rounded,
                              size: 15,
                              color: color.computeLuminance() > 0.6
                                  ? dark
                                  : Colors.white,
                            )
                                : null,
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.brush_rounded,
                          color: purple,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Brush Size',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                            color: dark,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '${brushSize.round()} px',
                          style: const TextStyle(
                            color: purple,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 35,
                      child: Slider(
                        value: brushSize,
                        min: 2,
                        max: 20,
                        divisions: 9,
                        activeColor: purple,
                        inactiveColor: const Color(0xFFE8E0FF),
                        onChanged: (value) {
                          setState(() {
                            brushSize = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton.icon(
                        onPressed: saveDrawing,
                        // : () {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => const NatureScreen(),
                        //     ),
                        //   );
                        // },
                        icon: const Icon(Icons.check_circle_rounded, size: 20),
                        label: const Text(
                          'Done Painting',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: purple,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _headerButton(IconData icon, VoidCallback onTap) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: SizedBox(
          height: 43,
          width: 43,
          child: Icon(icon, color: dark, size: 22),
        ),
      ),
    );
  }
}

class _PaintStroke {
  final List<Offset> points;
  final Color color;
  final double width;

  _PaintStroke({
    required this.points,
    required this.color,
    required this.width,
  });
}

class _CanvasPainter extends CustomPainter {
  final List<_PaintStroke> strokes;
  final _PaintStroke? currentStroke;
  final String animalName;
  _CanvasPainter({
    required this.strokes,
    required this.currentStroke,
    required this.animalName,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (animalName.toLowerCase() == 'cat') {
      _drawCat(canvas, size);
    }
    for (final stroke in strokes) {
      _drawStroke(canvas, stroke);
    }

    if (currentStroke != null) {
      _drawStroke(canvas, currentStroke!);
    }
  }
  void _drawCat(Canvas canvas, Size size) {
    final scale = (size.width / 300).clamp(
      0.0,
      size.height / 400,
    );

    canvas.save();

    canvas.translate(
      (size.width - 300 * scale) / 2,
      (size.height - 400 * scale) / 2,
    );

    canvas.scale(scale);

    final outline = Paint()
      ..color = Colors.black
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    // Cat ears
    final ears = Path()
      ..moveTo(85, 115)
      ..lineTo(75, 45)
      ..lineTo(135, 85)
      ..moveTo(165, 85)
      ..lineTo(225, 45)
      ..lineTo(215, 115);

    canvas.drawPath(ears, outline);

    // Cat head
    canvas.drawOval(
      Rect.fromLTWH(75, 75, 150, 145),
      outline,
    );

    // Cat body
    canvas.drawOval(
      Rect.fromLTWH(95, 210, 110, 125),
      outline,
    );

    // Legs
    canvas.drawLine(
      const Offset(115, 300),
      const Offset(105, 355),
      outline,
    );

    canvas.drawLine(
      const Offset(145, 310),
      const Offset(145, 355),
      outline,
    );

    canvas.drawLine(
      const Offset(175, 310),
      const Offset(175, 355),
      outline,
    );

    canvas.drawLine(
      const Offset(195, 300),
      const Offset(205, 355),
      outline,
    );

    // Tail
    final tail = Path()
      ..moveTo(200, 250)
      ..cubicTo(275, 250, 270, 180, 230, 195);

    canvas.drawPath(tail, outline);

    // Eyes
    canvas.drawCircle(
      const Offset(125, 140),
      5,
      Paint()..color = Colors.black,
    );

    canvas.drawCircle(
      const Offset(175, 140),
      5,
      Paint()..color = Colors.black,
    );

    // Nose
    final nose = Path()
      ..moveTo(145, 160)
      ..lineTo(155, 160)
      ..lineTo(150, 168)
      ..close();

    canvas.drawPath(
      nose,
      Paint()
        ..color = Colors.black
        ..style = PaintingStyle.fill,
    );

    // Mouth
    final mouth = Path()
      ..moveTo(150, 168)
      ..quadraticBezierTo(140, 180, 130, 170)
      ..moveTo(150, 168)
      ..quadraticBezierTo(160, 180, 170, 170);

    canvas.drawPath(mouth, outline);

    // Whiskers
    canvas.drawLine(
      const Offset(115, 165),
      const Offset(65, 155),
      outline,
    );

    canvas.drawLine(
      const Offset(115, 175),
      const Offset(65, 180),
      outline,
    );

    canvas.drawLine(
      const Offset(185, 165),
      const Offset(235, 155),
      outline,
    );

    canvas.drawLine(
      const Offset(185, 175),
      const Offset(235, 180),
      outline,
    );

    canvas.restore();
  }

  void _drawStroke(Canvas canvas, _PaintStroke stroke) {
    if (stroke.points.isEmpty) return;

    final paint = Paint()
      ..color = stroke.color
      ..strokeWidth = stroke.width
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;

    if (stroke.points.length == 1) {
      canvas.drawCircle(
        stroke.points.first,
        stroke.width / 2,
        Paint()
          ..color = stroke.color
          ..style = PaintingStyle.fill,
      );
      return;
    }

    final path = Path()
      ..moveTo(stroke.points.first.dx, stroke.points.first.dy);

    for (int i = 1; i < stroke.points.length; i++) {
      path.lineTo(
        stroke.points[i].dx,
        stroke.points[i].dy,
      );
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _CanvasPainter oldDelegate) => true;
}