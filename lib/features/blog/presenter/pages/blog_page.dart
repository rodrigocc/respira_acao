import 'package:flutter/material.dart';
import 'package:respira_acao/config/services/wordpress/wordpress_client_http.dart';
import 'package:respira_acao/features/blog/data/models/post_model.dart';

import 'article_content_page.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage>
    with SingleTickerProviderStateMixin {
  final controller = WordPressHttpClient();
  late Future<List<PostModel>> blogPosts;
  late AnimationController _animationController;
  final Duration _duration = const Duration(seconds: 2);

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: _duration);

    blogPosts = controller.getPosts();

    _startAnimation();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _startAnimation() {
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        decoration: const BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xFF0089CF), Color(0xFF00CDBA)]),
        ),
        child: FutureBuilder<List<PostModel>>(
            future: blogPosts,
            builder: (context, snapshot) {
              var posts = snapshot.data;
              if (snapshot.hasData) {
                return ListView.builder(
                  itemBuilder: (_, index) => FadeTransition(
                    opacity: Tween<double>(begin: 0.0, end: 1.0)
                        .animate(CurvedAnimation(
                      parent: _animationController,
                      curve: Interval(
                        index / posts!.length,
                        (index + 1) / posts.length,
                        curve: Curves.linear,
                      ),
                    )),
                    child: ListTile(
                      title: Text(
                        snapshot.data![index].title.rendered,
                        style: const TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ArticleContentPage(
                                      articleContent: snapshot
                                          .data![index].content.rendered,
                                    )));
                      },
                    ),
                  ),
                  itemCount: posts!.length,
                );
              } else {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.white,
                ));
              }
            }),
      )),
    );
  }
}
