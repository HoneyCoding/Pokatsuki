import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String? assetUrl;
  final double? width;
  final double? height;
  const ProfileImage({Key? key, this.assetUrl, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? assetUrl = this.assetUrl;
    double? width = this.width;
    double? height = this.height;
    double radius = 0.0;

    if (width != null && height != null) {
      radius = width < height ? width / 2 : height / 2;
    } else if (height != null) {
      radius = height / 2;
    } else if (width != null) {
      radius = width / 2;
    }

    return CircleAvatar(
        radius: radius,
        backgroundColor: const Color(0xff03a9f4),
        child: ClipOval(
            child: assetUrl != null
                ? Image.asset(assetUrl,
                    width: width, height: height, fit: BoxFit.cover)
                : getDefaultImageAsset()));
  }

  Padding getDefaultImageAsset() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ColorFiltered(
          child: Image.asset("images/round_person.png", fit: BoxFit.cover),
          colorFilter:
              const ColorFilter.mode(Color(0x66000000), BlendMode.srcIn)),
    );
  }
}
