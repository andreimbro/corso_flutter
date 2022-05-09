// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:social/models/post.dart';

// import '../api/api_post.dart';
// import '../models/user.dart';

// class LikeButton extends StatefulWidget {
//   final Post post;
//   final String userLogId;
//   const LikeButton(this.post, {required this.userLogId, Key? key})
//       : super(key: key);

//   @override
//   State<LikeButton> createState() => _LikeButtonState();
// }

// class _LikeButtonState extends State<LikeButton> {
//   // bool like = false;
//   // late int likenum;
//   // void initsharepref() async {
//   //   SharedPreferences shareprefe = await SharedPreferences.getInstance();
//   //   final initlike = shareprefe.getStringList("like_${widget.userLogId}") ?? [];
//     //   // if (mounted) {
//     //   //   setState(() {
//     //   //     like = initlike.contains(widget.post.id);
//     //   //     if (like) {
//     //   //       likenum++;
//     //   //     }
//     //   //   }

//     //   //   );
//     //   // }
//   }

//   // void aggiungipreferiti() async {
//   //   SharedPreferences shareprefe = await SharedPreferences.getInstance();
//   //   var newlike = shareprefe.getStringList("like_${widget.userLogId}") ?? [];
//   //   newlike.add(widget.post.id!);
//   //   await shareprefe.setStringList("like_${widget.userLogId}", newlike);
//   //   setState(() {
//   //     like = !like;
//   //     if (like) {
//   //       likenum++;
//   //     } else {
//   //       likenum--;
//   //     }
//   //   });
//   //   await ApiPost.modPost(
//   //     Post(
//   //       id: widget.post.id,
//   //       likes: likenum,
//   //       tags: widget.post.tags,
//   //       image: widget.post.image,
//   //       text: widget.post.text,
//   //       owner: const User(
//   //           id: "60d0fe4f5311236168a109ca",
//   //           title: "ms",
//   //           firstName: "Sara",
//   //           lastName: "Andersen",
//   //           picture: "https://randomuser.me/api/portraits/women/58.jpg",
//   //           email: "ciao@gmail.com"),
//   //     ),
//   //     widget.userLogId,
//   //   );
//   // }

//   // void rimuovipreferiti() async {
//   //   SharedPreferences shareprefe = await SharedPreferences.getInstance();
//   //   var removelike = shareprefe.getStringList("like_${widget.userLogId}") ?? [];
//   //   removelike.remove(widget.post.id);
//   //   await shareprefe.setStringList("like_${widget.userLogId}", removelike);
//   //   setState(() {
//   //     like = !like;
//   //     if (like) {
//   //       likenum++;
//   //     } else {
//   //       likenum--;
//   //     }
//   //   });
//   //   await ApiPost.modPost(
//   //     Post(
//   //       id: widget.post.id,
//   //       likes: likenum,
//   //       tags: widget.post.tags,
//   //       image: widget.post.image,
//   //       text: widget.post.text,
//   //       owner: const User(
//   //           id: "60d0fe4f5311236168a109ca",
//   //           title: "ms",
//   //           firstName: "Sara",
//   //           lastName: "Andersen",
//   //           picture: "https://randomuser.me/api/portraits/women/58.jpg",
//   //           email: "ciao@gmail.com"),
//   //     ),
//   //     widget.userLogId,
//   //   );
//   // }

//   // @override
//   // void initState() {
//   //   likenum = widget.post.likes;

//   //   initsharepref();

//   //   super.initState();
//   // }

//   // @override
//   // Widget build(BuildContext context) {
//   //   return TextButton.icon(
//   //       onPressed: () {
//   //         like == false ? aggiungipreferiti() : rimuovipreferiti();
//   //       },
//   //       icon: Icon(like ? Icons.favorite : Icons.favorite_outline),
//   //       label: Text(likenum.toString()));
//   // }

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api/api_post.dart';
import '../models/post.dart';
import '../models/user.dart';

class LikeButton extends StatefulWidget {
  final Post post;
  final String userLogId;
  const LikeButton(this.post, {required this.userLogId, Key? key})
      : super(key: key);

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool _conLike = false;
  late int _numLikes;
  late List<String> _listaLikes;
  late SharedPreferences _sp;

  initLike() async {
    final sp = await SharedPreferences.getInstance();
    //lista dei post a cui ha messo like l'utente loggato
    final listaLike = sp.getStringList('like_${widget.userLogId}') ?? [];
    setState(() {
      _conLike = listaLike.contains(widget.post.id);
      _listaLikes = listaLike;
      _sp = sp;
    });
  }

  void togglePrefreriti() async {
    _conLike
        ? _listaLikes.remove(widget.post.id!)
        : _listaLikes.add(widget.post.id!);

    await _sp.setStringList('like_${widget.userLogId}', _listaLikes);

    _conLike ? _numLikes-- : _numLikes++;

    await ApiPost.modPost(
        Post(
            tags: widget.post.tags,
            image: widget.post.image,
            text: widget.post.text,
            id: widget.post.id,
            likes: _numLikes,
            owner: const User(firstName: 'Elisa', lastName: 'Cattaneo')),
        widget.userLogId);

    setState(() {
      _conLike = !_conLike;
    });
  }

  @override
  void initState() {
    _numLikes = widget.post.likes;
    initLike();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: togglePrefreriti,
        icon: Icon(_conLike ? Icons.favorite : Icons.favorite_outline),
        label: Text(_numLikes.toString()));
  }
}
