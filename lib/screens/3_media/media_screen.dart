import 'package:flutter/material.dart';

class MediaScreen extends StatefulWidget {
  const MediaScreen({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double width, height;
  @override
  _MediaScreenState createState() => _MediaScreenState();
}

class _MediaScreenState extends State<MediaScreen> {
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
