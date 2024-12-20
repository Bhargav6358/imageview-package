// smoothimageview_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_image_view/smooth_image_view.dart';

void main() {
  // Tests for different scenarios of SmoothImageView

  group('SmoothImageView Widget Tests', () {
    testWidgets('renders asset image correctly', (WidgetTester tester) async {
      // Arrange: Provide an asset image path
      const image = 'assets/image.png';

      // Act: Build the widget tree with an asset image type
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SmoothImageView(
              image: image,
              type: ImageType.assets,
            ),
          ),
        ),
      );

      // Assert: Check if the Image.asset widget is rendered
      expect(find.byType(Image), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
      expect(
          find.byWidgetPredicate(
              (widget) => widget is Image && widget.image is AssetImage),
          findsOneWidget);
    });

    testWidgets('renders file image correctly', (WidgetTester tester) async {
      // Arrange: Provide a local file image path
      const image = '/path/to/file/image.jpg';

      // Act: Build the widget tree with a file image type
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SmoothImageView(
              image: image,
              type: ImageType.files,
            ),
          ),
        ),
      );

      // Assert: Check if Image.file widget is rendered
      expect(find.byType(Image), findsOneWidget);
      expect(
          find.byWidgetPredicate(
              (widget) => widget is Image && widget.image is FileImage),
          findsOneWidget);
    });

    testWidgets('renders network image correctly with shimmer placeholder',
        (WidgetTester tester) async {
      // Arrange: Provide a network image URL
      const image =
          'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif';

      // Act: Build the widget tree with a network image type and check for shimmer effect
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SmoothImageView(
              image: image,
              type: ImageType.networks,
            ),
          ),
        ),
      );

      // Assert: Check for the shimmer effect while loading
      expect(find.byType(Shimmer), findsOneWidget);
      expect(find.byType(CachedNetworkImage), findsOneWidget);
    });


    testWidgets('renders the provided placeholder widget while loading',
        (WidgetTester tester) async {
      // Arrange: Define a placeholder widget
      const placeholder = CircularProgressIndicator();

      // Act: Build the widget tree with a network image and custom placeholder
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SmoothImageView(
              image:
                  'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
              type: ImageType.networks,
              placeHolder: placeholder,
            ),
          ),
        ),
      );

      // Assert: Check if the provided placeholder widget is displayed while loading
      expect(find.byWidget(placeholder), findsOneWidget);
    });
  });
}
