part of '../sequential_slide_view.dart';

class SequentialSlideView extends StatefulWidget {
  const SequentialSlideView({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.itemBtm = 15.0,
    this.notUseAnimation = false,
    this.duration = 500,
    this.curve,
    this.startDelay = 1000,
    this.intervalDelay = 500,
    this.slideHeight = 20,
    this.onEnd,
  });
  final int itemCount;
  final Widget Function(int index) itemBuilder;
  final double itemBtm;
  final bool notUseAnimation;
  final int duration;
  final Curve? curve;
  final int startDelay;
  final int intervalDelay;
  final double slideHeight;
  final void Function()? onEnd;

  @override
  State<SequentialSlideView> createState() => _SequentialSlideViewState();
}

class _SequentialSlideViewState extends State<SequentialSlideView> {
  late List<bool> itemOn;

  @override
  void initState() {
    super.initState();

    ///  If the notUseAnimation value is true, all animations will be disabled.
    /// This means that all widgets returned by itemBuilder will be rendered
    /// on the screen at once.
    itemOn = List.generate(
      widget.itemCount,
      (index) => widget.notUseAnimation ? true : false,
    );

    if (!widget.notUseAnimation) {
      /// This code will make first animation after build()
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Future.delayed(Duration(milliseconds: widget.startDelay)).then((_) {
          setState(() {
            itemOn.first = true;
          });
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ///  This widget is not scrollable. If you want to make this scrollable,
    /// You can wrap this widget in some scrollable widgets.
    return Column(
      children: List.generate(
        widget.itemCount,
        (index) => Column(
          children: [
            /// This widget will make slide animation effect for each item.
            AnimatedContainer(
              duration: Duration(milliseconds: widget.duration),
              curve: widget.curve ?? Curves.fastOutSlowIn,
              height: itemOn[index] ? 0.0 : widget.slideHeight,
              onEnd: () {
                Duration delay = Duration(milliseconds: widget.intervalDelay);
                Future.delayed(delay).then((_) {
                  int next = index + 1;
                  if (next < widget.itemCount) {
                    setState(() {
                      itemOn[next] = true;
                    });
                  } else {
                    if (widget.onEnd != null) widget.onEnd!();
                  }
                });
              },
            ),

            AnimatedOpacity(
              opacity: itemOn[index] ? 1.0 : 0.0,
              duration: Duration(milliseconds: widget.duration),
              curve: widget.curve ?? Curves.fastOutSlowIn,
              child: Container(
                margin: EdgeInsets.only(bottom: widget.itemBtm),
                child: widget.itemBuilder(index),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
