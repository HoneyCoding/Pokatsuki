import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:flutter_app/models/member.dart';
import 'package:flutter_app/models/platform_friendly_route_builder.dart';
import 'package:flutter_app/screens/detail_screen.dart';
import 'package:flutter_app/widgets/main_list_tile.dart';

class MainListWidget extends StatelessWidget {
  const MainListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _createListTiles(context),
    );
  }

  _createListTiles(BuildContext context) {
    List<Member> members = [
      Member("윤원상", "ㅈㅌ형 제발 구원좀 이러다다죽어~", "images/profile_image_wonsang.png"),
      Member.withoutAssetUrl(
          "김진태",
          "?????????????????????????????\n"
              "나 뭔가 했어?!"),
      Member.withoutAssetUrl("문건하", "메이플해야됨ㅅㄱ"),
      Member(
          "박경호", "@이후영 라프텔이라는 서비스 들어봤어?", "images/profile_image_gyeongho.png"),
      Member.withoutAssetUrl("이후영", "그걸 어디서 듣고 온 거야 ㄷ"),
      Member("누리", "ㅎㅇㅂㅂ", "images/profile_image_nuri.png")
    ];
    List<Member> repeatedMembers =
        List.filled(5, members).expand((element) => element).toList();
    List<Widget> tiles = repeatedMembers
        .map((member) => MainListTile(
            member: member,
            onTap: () => Navigator.of(context).push(_createRoute(member))))
        .toList();
    return tiles;
  }

  Route _createRoute(Member member) {
    return PlatformFriendlyRouteBuilder(
        routePageBuilder: (context, animation, secondaryAnimation) =>
            DetailScreen(member: member));
  }
}
