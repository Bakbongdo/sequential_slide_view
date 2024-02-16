# sequential_slide_view
</br>

![example](https://github.com/Bakbongdo/sequential_slide_view/assets/152972818/e4d47a91-181d-4be5-be9b-628a88b7ac7c)


## Usage
 `SequentialSlideView()` is not scrollable widget. If you want to make this scrollable, You can wrap this widget in some scrollable widgets. 

 - You can use `bool notUseAnimation = false` parameter. If this value is true, All animations will be disabled. This means that all widgets returned by itemBuilder will be rendered on the screen at once.

</br>

A simple usage example:
```dart
import 'package:sequential_slide_view/sequential_slide_view.dart';

SequentialSlideView(
  itemCount: 3,
  /// *** You can customize your widget with itemBuilder ***
  itemBuilder: (index) => Text('sample no.${index.toString()}'),
)
```
</br>

Params: 
```dart
SequentailSlideView(
  ...
  itemBtm = 15.0,
  notUseAnimation = false,
  duration = 500,
  curve = Curves.fastOutSlowIn,
  startDelay = 1000,
  intervalDelay = 500,
  slideHeight = 20, // slide-up animation height
  onEnd = (){}, // is called after all animations have completed
)

```

