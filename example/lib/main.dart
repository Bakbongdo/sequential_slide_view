import 'package:flutter/material.dart';
import 'package:sequential_slide_view/sequential_slide_view.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Example(),
  ));
}

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 200.0,
          child: SequentialSlideView(
            itemCount: 3,
            itemBuilder: (index) => Text('sample no.${index.toString()}'),
          ),
        ),
      ),
    );
  }
}
