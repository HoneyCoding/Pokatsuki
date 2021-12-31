import 'package:flutter/material.dart';
import 'package:flutter_app/models/member.dart';
import 'package:flutter_app/widgets/profile_image.dart';

class DetailScreen extends StatefulWidget {
  final Member member;

  const DetailScreen({Key? key, required this.member}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.member.name),
      ),
      body: SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProfileImage(assetUrl: widget.member.assetUrl, width: 64, height: 64,),
            const SizedBox(height: 8),
            Text(
              widget.member.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              widget.member.description,
              style: const TextStyle(fontSize: 18),
            )
          ]),
    ));
  }
}
