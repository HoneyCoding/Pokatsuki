import 'package:flutter/material.dart';
import 'package:flutter_app/models/member.dart';
import 'package:flutter_app/widgets/profile_image.dart';

class MainListTile extends StatelessWidget {
  final Member member;
  final void Function()? onTap;

  const MainListTile({Key? key, required this.member, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: getListTileItem(),
      onTap: onTap,
    );
  }

  Padding getListTileItem() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getProfileImage(),
            const SizedBox(
              width: 8,
            ),
            getColumnTexts()
          ],
        ));
  }

  ProfileImage getProfileImage() {
    String? assetUrl = member.assetUrl;
    return ProfileImage(assetUrl: assetUrl, width: 64, height: 64,);
  }

  Flexible getColumnTexts() {
    return Flexible(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          member.name,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          softWrap: true,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          member.description,
          style: const TextStyle(fontSize: 18),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          softWrap: true,
        )
      ],
    ));
  }
}
