import 'package:flutter/material.dart';
import 'package:respira_acao/config/services/wordpress_client_http.dart';
import 'package:respira_acao/features/blog/data/models/post_model.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  final controller = WordPressHttpClient();
  late Future<List<PostModel>> blogPosts;

  @override
  void initState() {
    super.initState();

    blogPosts = controller.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        child: FutureBuilder<List<PostModel>>(
            future: blogPosts,
            builder: (context, snapshot) {
              var posts = snapshot.data;
              if (snapshot.hasData) {
                return ListView.builder(
                  itemBuilder: (_, index) => ListTile(
                      title: Text(snapshot.data![index].title.rendered)),
                  itemCount: posts!.length,
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
      )),
    );
  }
}
