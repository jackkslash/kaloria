import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExpandableBottomNav extends StatefulWidget {
  const ExpandableBottomNav({super.key});

  @override
  State<ExpandableBottomNav> createState() => _ExpandableBottomNavState();
}

class _ExpandableBottomNavState extends State<ExpandableBottomNav> {
  static const _animationDuration = Duration(milliseconds: 200);
  static const _collapsedHeight = 125.0;
  static const _expandedDateHeight = 300.0;
  static const _expandedScanHeight = 400.0;
  static const _expandedAddHeight = 300.0;

  bool _expandedDate = false;
  bool _expandedScan = false;
  bool _expandedAdd = false;

  int _dateCounter = 0;

  double get _currentHeight {
    if (_expandedDate) return _expandedDateHeight;
    if (_expandedScan) return _expandedScanHeight;
    if (_expandedAdd) return _expandedAddHeight;
    return _collapsedHeight;
  }

  Widget _getCurrentContent() {
    if (_expandedDate) return _buildExpandedDateContent();
    if (_expandedScan) return _buildExpandedScanContent();
    if (_expandedAdd) return _buildExpandedAddContent();
    return _buildCollapsedContent();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: _animationDuration,
      height: _currentHeight,
      curve: Curves.easeInOutCubic,
      color: Colors.grey,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          BottomAppBar(
            color: Colors.black,
            height: double.infinity,
            child: _getCurrentContent(),
          ),
          _buildCurve(),
        ],
      ),
    );
  }

  Widget _buildExpandedDateContent() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(alignment: Alignment.center, child: _buildToggleButton()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    _dateCounter--;
                  });
                },
                icon: const Icon(
                  Icons.arrow_left,
                  color: Colors.white,
                  size: 32,
                ),
              ),
              Text(
                '$_dateCounter',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ), // Increased font size
                textAlign: TextAlign.center,
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _dateCounter++;
                  });
                },
                icon: const Icon(
                  Icons.arrow_right,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExpandedScanContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [Align(alignment: Alignment.center, child: _buildScanButton())],
    );
  }

  Widget _buildExpandedAddContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [Align(alignment: Alignment.center, child: _buildAddButton())],
    );
  }

  Widget _buildCollapsedContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_buildToggleButton(), _buildScanButton(), _buildAddButton()],
      ),
    );
  }

  void _toggleDateExpanded() {
    setState(() {
      _expandedDate = !_expandedDate;
      if (_expandedDate) {
        _expandedScan = false;
        _expandedAdd = false;
        context.go('/home'); // Navigate to the date page
      }
    });
  }

  void _toggleScanExpanded() {
    setState(() {
      _expandedScan = !_expandedScan;
      if (_expandedScan) {
        _expandedDate = false;
        _expandedAdd = false;
        context.go('/scan');
      } else {
        context.go('/home');
      }
    });
  }

  void _toggleAddExpanded() {
    setState(() {
      _expandedAdd = !_expandedAdd;
      if (_expandedAdd) {
        _expandedDate = false;
        _expandedScan = false;
        context.go('/add');
      } else {
        context.go('/home');
      }
    });
  }

  Widget _buildToggleButton() {
    return ElevatedButton.icon(
      onPressed: () {
        _toggleDateExpanded();
      },
      icon: const Icon(Icons.calendar_today, color: Colors.black),
      label: const Text('Today', style: TextStyle(color: Colors.black)),
      style: ElevatedButton.styleFrom(
        backgroundColor: _expandedDate ? Colors.grey[300] : Colors.white,
      ),
    );
  }

  Widget _buildAddButton() {
    return ElevatedButton.icon(
      onPressed: () {
        _toggleAddExpanded();
      },
      icon: _expandedAdd ? null : Icon(Icons.add, color: Colors.black),
      label: Text(
        _expandedAdd ? 'Back' : 'Add',
        style: TextStyle(color: Colors.black),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: _expandedAdd ? Colors.grey[300] : Colors.white,
      ),
    );
  }

  Widget _buildScanButton() {
    return ElevatedButton(
      onPressed: () {
        _toggleScanExpanded();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: _expandedScan ? Colors.grey[300] : Colors.white,
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: CircleBorder(),
      ),
      child: _expandedScan
          ? Icon(Icons.arrow_downward)
          : Icon(Icons.camera_alt, color: Colors.black),
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
