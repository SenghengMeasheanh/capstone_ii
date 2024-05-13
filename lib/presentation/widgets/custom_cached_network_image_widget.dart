import 'package:cached_network_image/cached_network_image.dart';
import 'package:photo_view/photo_view.dart';
import 'package:flutter/material.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';

class CustomCachedNetworkImageConfig {
  final double? aspectRatio;
  double? width;
  double? height;
  final Color backgroundColor;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final Border? border;
  final BoxFit? boxFit;
  final bool isPhotoView; // ? For Photo View (Like Pinch Zoom)
  final bool isProfile; // ? For Edit Profile
  final ImageProvider<Object>? imageProvider; // ? For Edit Profile

  CustomCachedNetworkImageConfig({
    this.aspectRatio,
    this.width,
    this.height,
    this.backgroundColor = Colors.transparent,
    this.margin,
    this.padding,
    this.borderRadius,
    this.border,
    this.boxFit,
    this.isPhotoView = false,
    this.isProfile = false,
    this.imageProvider,
  });
}

class CustomCachedNetworkImage extends StatelessWidget {
  final void Function()? onTap;
  final String imageUrl;
  final CustomCachedNetworkImageConfig config;

  const CustomCachedNetworkImage({
    super.key,
    this.onTap,
    required this.imageUrl,
    required this.config,
  });

  @override
  Widget build(BuildContext context) {
    // * If Photo View [Build Photo View]
    if (config.isPhotoView) return PhotoView(imageProvider: CachedNetworkImageProvider(imageUrl));
    // * If Aspect Ratio Not Null
    if (config.aspectRatio != null) {
      // * Ignore: Width & Height Because It's Has No Effect When Use Aspect Ratio
      if (config.width != null || config.height != null) throw 'You can not use width or height in aspect ratio';
      // * Fill With & Height
      config.width = double.infinity;
      config.height = double.infinity;
      // * Build Image With Aspect Ratio
      return AspectRatio(aspectRatio: config.aspectRatio!, child: _buildImage);
    }
    // * Build Image Without Aspect Ratio
    return _buildImage;
  }

  Widget get _buildImage {
    return Container(
      margin: config.margin,
      padding: config.padding,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(color: config.backgroundColor, borderRadius: config.borderRadius),
      child: Stack(
        children: [
          // * Image Builder
          CachedNetworkImage(
            imageUrl: imageUrl,
            width: config.width,
            height: config.height,
            fit: config.boxFit,
            placeholder: (_, __) => const ProgressBar(),
            imageBuilder: (_, imageProvider) {
              // * Image Provider
              final imgProvider =
                  config.isProfile && config.imageProvider != null ? config.imageProvider : imageProvider;
              // * Build Image
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: imgProvider!, fit: config.boxFit),
                  border: config.border,
                  borderRadius: config.borderRadius,
                ),
              );
            },
            errorWidget: (_, __, ___) {
              // * Image Provider
              final imageProvider = config.isProfile && config.imageProvider != null
                  ? config.imageProvider
                  : AssetImage(config.isProfile ? Assets.imageNoImagePerson : Assets.imageNoImage);
              // * Build
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: imageProvider!, fit: config.boxFit),
                  border: config.border,
                  borderRadius: config.borderRadius,
                ),
              );
            },
          ),
          // * On Tap
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(onTap: onTap, borderRadius: config.borderRadius),
            ),
          ),
        ],
      ),
    );
  }
}
