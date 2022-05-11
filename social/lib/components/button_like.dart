import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social/models/post.dart';

import '../api/api_post.dart';
import '../models/user.dart';
import 'package:social/models/global.dart' as global;

class LikeButton extends StatefulWidget {
  final Post post;
  final String userLogId;
  const LikeButton(this.post, {required this.userLogId, Key? key})
      : super(key: key);

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool like = false;
  late int _likenum;
  late List<String> _listaLikes;
  late SharedPreferences _shareprefe;
  late User provauser;
  void initsharepref() async {
    SharedPreferences shareprefe = await SharedPreferences.getInstance();
    final listaLikes =
        shareprefe.getStringList("like_${widget.userLogId}") ?? [];
    if (mounted) {
      setState(() {
        like = listaLikes.contains(widget.post.id);
        _listaLikes = listaLikes;
        _shareprefe = shareprefe;
      });
    }
  }

  Future<void> aggiungipreferiti() async {
    _listaLikes.add(widget.post.id!);
    await _shareprefe.setStringList("like_${widget.userLogId}", _listaLikes);

    _likenum++;

    await ApiPost.modPost(
      Post(
        id: widget.post.id,
        likes: _likenum,
        tags: widget.post.tags,
        image: widget.post.image,
        text: widget.post.text,
        owner: provauser,
      ),
      widget.post.id!,
    );
    setState(() {
      like = !like;
    });
  }

  Future<void> rimuovipreferiti() async {
    _listaLikes.remove(widget.post.id);
    await _shareprefe.setStringList("like_${widget.userLogId}", _listaLikes);
    _likenum--;

    await ApiPost.modPost(
      Post(
        id: widget.post.id,
        likes: _likenum,
        tags: widget.post.tags,
        image: widget.post.image,
        text: widget.post.text,
        owner: provauser,
      ),
      widget.post.id!,
    );
    setState(() {
      like = !like;
    });
  }

  @override
  void initState() {
    _likenum = widget.post.likes;
    provauser = global.user[0];
    initsharepref();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: () async {
          like == false ? await aggiungipreferiti() : await rimuovipreferiti();
        },
        icon: Icon(like ? Icons.favorite : Icons.favorite_outline),
        label: Text(_likenum.toString()));
  }
}
