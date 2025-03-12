import 'package:flutter/material.dart';
import 'dart:io';
import 'package:kamera_gabungan/widget/filter_selector.dart';

class DisplayPictureScreen extends StatefulWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  State<DisplayPictureScreen> createState() => _DisplayPictureScreenState();
}

class _DisplayPictureScreenState extends State<DisplayPictureScreen> {
  final _filterColor = ValueNotifier<Color>(Colors.white);

  void _onFilterChanged(Color value) {
    _filterColor.value = value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          
          Positioned.fill(
            child: ValueListenableBuilder(
              valueListenable: _filterColor,
              builder: (context, color, child) {
                return ColorFiltered(
                  colorFilter: ColorFilter.mode(color.withOpacity(0.5), BlendMode.color),
                  child: Image.file(
                    File(widget.imagePath),
                    fit: BoxFit.cover, 
                  ),
                );
              },
            ),
          ),

          Positioned(
            top: 40,
            left: 20,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),

          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: FilterSelector(
              onFilterChanged: _onFilterChanged,
              filters: [
                Colors.white,
                ...List.generate(
                  Colors.primaries.length,
                  (index) => Colors.primaries[(index * 4) % Colors.primaries.length],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
