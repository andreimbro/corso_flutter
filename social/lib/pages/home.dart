import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social/api/api_post.dart';
import 'package:social/components/card_post.dart';
import 'package:social/models/post.dart';
import 'package:social/models/post_response.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<Post> _listPost;
  late Future<List<Post>> _future;
  late int _skipPost;
  late bool _hasMorePost;
  late int _page;

  @override
  void initState() {
    super.initState();
    inizializeInitVariables();
  }

  Future<List<Post>> _fetchPost() async {
    final PostResponse result = await ApiPost.getPostList(page: _page);

    setState(() {
      _skipPost = _skipPost + result.limit;
      _hasMorePost = (result.total - _skipPost) > 0;
      _listPost = _listPost + result.data;
      _page++;
    });

    return _listPost;
  }

  void inizializeInitVariables() {
    _listPost = [];
    _hasMorePost = false;
    _skipPost = 0;
    _page = 0;

    _future = _fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        drawer: Drawer(
            child: SafeArea(
          child: ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () async {
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.setString('logKey', "");
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/', (Route<dynamic> route) => false);
              }),
        )),
        body: FutureBuilder(
            future: _future,
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data is List<Post>) {
                final listPost = (snapshot.data as List<Post>);
                return ListView.builder(
                    itemCount: listPost.length,
                    itemBuilder: (context, index) {
                      if (index == _listPost.length - 1 && _hasMorePost) {
                        _future = _fetchPost();

                        return Column(
                          children: [
                            CardPost(post: listPost[index]),
                            if (index < _listPost.length)
                              CircularProgressIndicator(),
                          ],
                        );
                      }
                      return CardPost(post: listPost[index]);
                    });
              }
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
