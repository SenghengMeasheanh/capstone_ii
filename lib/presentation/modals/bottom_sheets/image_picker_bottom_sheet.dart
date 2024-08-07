import 'package:flutter/material.dart';
import 'package:capstone_ii/helper/helper_export.dart';

class ImagePickerBottomSheet with ModalUtilsMixin {
  // * Variable
  var _isShowing = false;

  // * Show
  Future<T?> show<T>({
    BuildContext? context,
    required void Function() onCameraPicked,
    required void Function() onGalleryPicked,
  }) {
    // * Set [isShowing] True
    _isShowing = true;
    // * Build
    return showModalBottomSheet<T>(
      context: context ?? getCurrentContext,
      builder: (_) => _ImagePickerBottomSheet(
        onCameraPicked: onCameraPicked,
        onGalleryPicked: onGalleryPicked,
      ),
    ).then((result) {
      // * Set [isShowing] False
      _isShowing = false;
      // * Return Result
      return result;
    });
  }

  // * Get Bottom Sheet Showing
  bool get isShowing => _isShowing;
}

class _ImagePickerBottomSheet extends StatelessWidget with ModalUtilsMixin {
  final void Function() onCameraPicked;
  final void Function() onGalleryPicked;

  const _ImagePickerBottomSheet({
    required this.onCameraPicked,
    required this.onGalleryPicked,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.all(Dimen.contentPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // * Title
              Text(
                'Please select',
                style: CustomTextStyle.titleTextStyle(bold: true),
              ),
              // * Camera
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.only(top: Dimen.smallSpace),
                child: OutlinedButton.icon(
                  onPressed: () {
                    // * Dismiss Bottom Sheet
                    dismiss();
                    // * Call On Camera Picked
                    onCameraPicked.call();
                  },
                  label: Text('Camera', style: CustomTextStyle.titleTextStyle(color: Colors.black)),
                  style: const ButtonStyle(alignment: Alignment.centerLeft),
                  icon: const Icon(Icons.camera_alt_outlined),
                ),
              ),
              // * Gallery
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.only(top: Dimen.smallSpace),
                child: OutlinedButton.icon(
                  onPressed: () {
                    // * Dismiss Bottom Sheet
                    dismiss();
                    // * Call On Gallery Picked
                    onGalleryPicked.call();
                  },
                  label: Text('Gallery', style: CustomTextStyle.titleTextStyle(color: Colors.black)),
                  style: const ButtonStyle(alignment: Alignment.centerLeft),
                  icon: const Icon(Icons.photo_outlined),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
