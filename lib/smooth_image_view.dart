// ignore_for_file: must_be_immutable

// Dart imports:
import 'dart:io';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

// Flutter imports:
import 'package:flutter/material.dart';

enum ImageType { files, assets, networks }

/// A widget that displays an image from various sources with optional placeholders and shimmer effects.
class SmoothImageView extends StatelessWidget {
  /// The image source.
  final String image;

  /// The type of image source (files, assets, networks).
  final ImageType type;

  /// A placeholder widget to be displayed while the image is loading or if there is an error.
  final Widget? placeHolder;

  /// The height of the image.
  final double? height;

  /// The width of the image.
  final double? width;

  /// How the image should be inscribed into the box.
  final BoxFit? fit;

  /// The base color of the shimmer effect.
  final Color? shimmerBaseColor;

  /// The highlight color of the shimmer effect.
  final Color? shimmerHighlightColor;

  SmoothImageView({
    super.key,
    required this.image,
    required this.type,
    this.placeHolder,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.shimmerBaseColor,
    this.shimmerHighlightColor,
  });

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ImageType.assets:
        return Image.asset(
          image,
          height: height,
          width: width,
          fit: fit,
        );
      case ImageType.files:
        return Image.file(
          File(image),
          height: height,
          width: width,
          fit: fit,
        );
      case ImageType.networks:
        return image.isEmpty
            ? placeHolder ??
                Shimmer.fromColors(
                    baseColor: shimmerBaseColor ?? Colors.grey.shade300,
                    highlightColor: shimmerHighlightColor ?? Colors.grey.shade900,
                    child: SizedBox(
                      height: height ?? 180,
                      width: width ?? MediaQuery.of(context).size.width,
                    ))
            : CachedNetworkImage(
                imageUrl: image,
                height: height,
                width: width,
                fit: fit,
                placeholder: (context, url) => placeHolder ??
                    Shimmer.fromColors(
                        baseColor: shimmerBaseColor ?? Colors.grey.shade300,
                        highlightColor: shimmerHighlightColor ?? Colors.grey.shade900,
                        child: SizedBox(
                          height: height,
                          width: width,
                        )),
                errorWidget: (context, url, error) => placeHolder ??
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.error, color: Colors.red),
                        Text('Failed to load image', style: TextStyle(color: Colors.red)),
                      ],
                    ),
              );
    }
  }
}
