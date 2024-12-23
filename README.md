# SmoothImageView Flutter Package

A simple Flutter package that provides a flexible image rendering widget, capable of displaying images from various sources like files, assets, and network URLs with customizable placeholders and loading effects.

## Features:

- Supports image loading from:
  - Local device files
  - Assets bundled with the app
  - Network URLs (with caching)
- Includes support for loading placeholders with a shimmer effect when fetching network images.
- Configurable height, width, and `BoxFit` for better layout control.
- Easy to use in Flutter apps for dynamic image rendering.

## Installation:

Add `smooth_image_view` to your `pubspec.yaml` file:

```yaml
dependencies:
  smooth_image_view: ^1.1.0
```

Then run the following command to install the package:
```yaml
flutter pub get
```
## Usage:
```yaml
import 'package:smooth_image_view/smooth_image_view.dart';

// Inside your widget tree:
SmoothImageView(
  image: 'https://example.com/image.jpg', // Network URL, file path, or asset path
  type: ImageType.networks, // Choose ImageType.assets, ImageType.files, or ImageType.networks
  height: 200.0,
  width: 200.0,
  placeHolder: CircularProgressIndicator(), // Custom placeholder widget
  fit: BoxFit.cover, // Control how the image should fit
),
```
## Parameters:

- `image`: **required**  
  The image source (URL, file path, or asset path).

- `type`: **required**  
  The type of image source (`ImageType.assets`, `ImageType.files`, or `ImageType.networks`).

- `placeHolder`: *(Optional)*  
  A widget to display while the image is loading. Defaults to a shimmer effect.

- `height`: *(Optional)*  
  Height of the image (in pixels).

- `width`: *(Optional)*  
  Width of the image (in pixels).

- `fit`: *(Optional)*  
  How the image should fit within its bounds. Defaults to `BoxFit.cover`.

- `shimmerBaseColor`: *(optional)*
  The base color of the shimmer effect. Defaults to Colors.grey.shade300.

- `shimmerHighlightColor`: *(optional)*
  The highlight color of the shimmer effect. Defaults to Colors.grey.shade900.

## Example:
Here is a more detailed example of how to use the `SmoothImageView` widget in a Flutter application:
```yaml
import 'package:flutter/material.dart';
import 'package:smooth_image_view/smooth_image_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Smooth Image View Example'),
        ),
        body: Center(
          child: SmoothImageView(
            image: 'https://example.com/image.jpg', // Network URL, file path, or asset path
            type: ImageType.networks, // Choose ImageType.assets, ImageType.files, or ImageType.networks
            height: 200.0,
            width: 200.0,
            placeHolder: CircularProgressIndicator(), // Custom placeholder widget
            fit: BoxFit.cover, // Control how the image should fit
            shimmerBaseColor: Colors.grey.shade300,
            shimmerHighlightColor: Colors.grey.shade900,
          ),
        ),
      ),
    );
  }
}
```

## License
This project is licensed under the MIT License - see the LICENSE file for details.