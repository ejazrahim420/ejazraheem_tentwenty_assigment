import 'package:flutter/material.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double width, height;
  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
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
