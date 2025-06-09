import 'package:flutter/material.dart';

class ExpandableBottomNav extends StatefulWidget {
  const ExpandableBottomNav({super.key});

  @override
  State<ExpandableBottomNav> createState() => _ExpandableBottomNavState();
}

class _ExpandableBottomNavState extends State<ExpandableBottomNav> {
  static const _animationDuration = Duration(milliseconds: 100);
  static const _collapsedHeight = 125.0;
  static const _expandedHeight = 225.0;

  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: _animationDuration,
      height: _expanded ? _expandedHeight : _collapsedHeight,
      color: Colors.black,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          BottomAppBar(
            color: Colors.black,
            padding: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 8.0,
            ),
            child: _expanded
                ? _buildExpandedContent()
                : _buildCollapsedContent(),
          ),
          _buildCurve(),
        ],
      ),
    );
  }

  Widget _buildExpandedContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(alignment: Alignment.center, child: _buildToggleButton()),
        const Flexible(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.arrow_left, color: Colors.white),
                Icon(Icons.arrow_right, color: Colors.white),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCollapsedContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_buildToggleButton(), _buildAddButton()],
      ),
    );
  }

  Widget _buildToggleButton() {
    return ElevatedButton.icon(
      onPressed: () {
        setState(() => _expanded = !_expanded);
      },
      icon: const Icon(Icons.calendar_today, color: Colors.black),
      label: const Text('Today', style: TextStyle(color: Colors.black)),
    );
  }

  Widget _buildAddButton() {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.add, color: Colors.black),
      label: const Text('Add', style: TextStyle(color: Colors.black)),
    );
  }

  Widget _buildCurve() {
    return Positioned(
      top: -75,
      left: 0,
      right: 0,
      child: Row(
        children: [
          CustomPaint(size: const Size(75, 75), painter: CurvedCornerPainter()),
          const Spacer(),
          Transform.flip(
            flipX: true,
            child: CustomPaint(
              size: const Size(75, 75),
              painter: CurvedCornerPainter(),
            ),
          ),
        ],
      ),
    );
  }
}

class CurvedCornerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..quadraticBezierTo(0, size.height, 0, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
