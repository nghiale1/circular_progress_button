import 'package:flutter/material.dart';
import 'progress_painter.dart';
import 'progress_theme.dart';

class CircularProgressButton extends StatefulWidget {
  final VoidCallback onTap;
  final ProgressButtonTheme theme;
  final Duration animationDuration;
  final VoidCallback? onComplete;
  final int totalSteps;
  final int currentStep;

  const CircularProgressButton({
    Key? key,
    required this.onTap,
    required this.totalSteps,
    this.currentStep = 0,
    this.theme = const ProgressButtonTheme(),
    this.animationDuration = const Duration(seconds: 2),
    this.onComplete,
  })  : assert(totalSteps > 0, 'Total steps must be greater than 0'),
        assert((currentStep >= 0 && currentStep <= totalSteps),
            'Current step must be less than or equal total steps'),
        super(key: key);

  @override
  State<CircularProgressButton> createState() => _CircularProgressButtonState();
}

class _CircularProgressButtonState extends State<CircularProgressButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _progressAnimation;

  late double _progressPerStep;
  late int _currentStep;
  double _currentProgress = 0.0;
  double _previousProgress = 0.0;
  late double _targetProgress;

  @override
  void initState() {
    super.initState();
    _initializeProgress();
    _initializeAnimation();
  }

  void _initializeProgress() {
    _progressPerStep = 1.0 / widget.totalSteps;
    _currentStep = widget.currentStep;
    _previousProgress = 0.0;
    _currentProgress = _previousProgress;

    // Don't set target progress if currentStep is 0
    _targetProgress = _currentStep * _progressPerStep;
  }

  void _initializeAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );

    _progressAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    )
      ..addListener(() {
        setState(() {
          _currentProgress = _previousProgress +
              (_targetProgress - _previousProgress) * _progressAnimation.value;
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          if (_currentProgress >= 0.99) {
            widget.onComplete?.call();
          }
        }
      });

    // Only start animation if currentStep > 0
    if (_currentStep > 0) {
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTap() {
    widget.onTap();

    if (_currentProgress >= 0.99) return;

    _previousProgress = _currentProgress;
    _currentStep++;
    _targetProgress = _currentStep * _progressPerStep;

    _animationController.reset();
    _animationController.forward();
  }

  @override
  void didUpdateWidget(CircularProgressButton oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.totalSteps != widget.totalSteps ||
        oldWidget.currentStep != widget.currentStep) {
      _initializeProgress();

      _animationController.stop();

      // Only animate if currentStep > 0
      if (widget.currentStep > 0) {
        _animationController.forward();
      } else {
        setState(() {
          _currentProgress = _previousProgress;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: SizedBox(
        width: widget.theme.size,
        height: widget.theme.size,
        child: CustomPaint(
          painter: ProgressCirclePainter(
            progress: _currentProgress,
            theme: widget.theme,
          ),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.theme.progressColor,
              ),
              child: widget.theme.iconWidget ??
                  Icon(
                    widget.theme.icon,
                    color: widget.theme.iconColor,
                    size: widget.theme.iconSize,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
