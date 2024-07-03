
import 'package:flutter/material.dart';

class DayNightTransition extends StatefulWidget {
  const DayNightTransition({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DayNightTransitionState createState() => _DayNightTransitionState();
}

class _DayNightTransitionState extends State<DayNightTransition>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _colorAnimation = ColorTween(
      begin: Colors.orange, 
      end: Colors.red, 
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day Night Transition'),
      ),
      body: Container(
        color: _colorAnimation.value,
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              _controller.forward();// Lance l'animation
            },
            child: const Text('Toggle Theme'),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}