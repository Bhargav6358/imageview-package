// ignore_for_file: must_be_immutable

// Dart imports:
import 'dart:io';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


enum ImageType { files, assets, networks }

class SmoothImageView extends StatelessWidget {
  String image;
  ImageType type;
  Widget? placeHolder;
  double? height;
  double? width;
  BoxFit? fit;
  Color? shimmerBaseColor;
  Color? shimmerhighlightColor;

  SmoothImageView({
    super.key,
    required this.image,
    required this.type,
    this.placeHolder,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return switch (type) {
      ImageType.assets => Image.asset(
          image,
          height: height,
          width: width,
          fit: fit,
        ),
      ImageType.files => Image.file(
          File(image),
          height: height,
          width: width,
          fit: fit,
        ),
      ImageType.networks => image.isEmpty
          ? placeHolder ??
              Shimmer.fromColors(
                  baseColor: shimmerBaseColor ?? Colors.grey.shade300,
                  highlightColor: shimmerhighlightColor ?? Colors.grey.shade900,
                  child: SizedBox(
                    height: height ?? 180,
                    width: width ?? MediaQuery.of(context).size.width,
                  ))
          : CachedNetworkImage(
              imageUrl: image,
              height: height,
              width: width,
              fit: fit,
              placeholder: (context, url) {
                return placeHolder ??
                    Shimmer.fromColors(
                        baseColor: shimmerBaseColor ?? Colors.grey.shade300,
                        highlightColor: shimmerhighlightColor ?? Colors.grey.shade900,
                        child: SizedBox(
                          height: height,
                          width: width,
                        ));
              },
              errorWidget: (context, url, error) {
                return placeHolder ?? const Icon(Icons.error);
              },
            ),
    };
  }
}
