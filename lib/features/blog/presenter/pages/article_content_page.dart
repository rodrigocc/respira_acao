import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class ArticleContentPage extends StatefulWidget {
  final String articleContent;

  const ArticleContentPage({super.key, required this.articleContent});

  @override
  State<ArticleContentPage> createState() => _ArticleContentPageState();
}

class _ArticleContentPageState extends State<ArticleContentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Html(
              data: widget.articleContent,
            ),
          ],
        ),
      ),
    );
  }
}
