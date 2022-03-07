import 'package:flutter/material.dart';

class WatchScreen extends StatefulWidget {
  const WatchScreen({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double width, height;
  @override
  _WatchScreenState createState() => _WatchScreenState();
}

class _WatchScreenState extends State<WatchScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
    );
  }
}
