import 'package:flutter/material.dart';
import 'package:newsapp/helper/news.dart';
import 'package:newsapp/models/article_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ArticleModel> articles = <ArticleModel>[];

  bool _loading = true;
  @override
  void initState() {
    super.initState();
    getNews();
  }

  getNews() async {
    News newsBody = News();
    await newsBody.getNews();
    articles = newsBody.news;

    setState(() {
      // _loading = false;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: <Widget>[
            Image.network(
              "http://assets.stickpng.com/thumbs/5842ab75a6515b1e0ad75b0b.png",
              width: 100,
              height: 100,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Card(
                imageUrl:
                    "https://images.unsplash.com/39/lIZrwvbeRuuzqOoWJUEn_Photoaday_CSD%20(1%20of%201)-5.jpg?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YnVzaW5lc3N8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60",
                name: "Business",
              ),
              SizedBox(
                width: 20,
              ),
              Card(
                imageUrl:
                    "https://images.unsplash.com/photo-1470229722913-7c0e2dbbafd3?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80",
                name: "Entertainment",
              ),
              SizedBox(
                width: 20,
              ),
              Card(
                imageUrl:
                    "https://images.unsplash.com/photo-1494059980473-813e73ee784b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1949&q=80",
                name: "General",
              ),
              SizedBox(
                width: 20,
              ),
              Card(
                  imageUrl:
                      "https://images.unsplash.com/photo-1498837167922-ddd27525d352?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8aGVhbHRofGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60",
                  name: "Food and Lifestyle"),
              SizedBox(
                width: 20,
              ),
              Card(
                  imageUrl:
                      "https://images.unsplash.com/photo-1530210124550-912dc1381cb8?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fHNjaWVuY2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60",
                  name: "Health"),
              SizedBox(
                width: 20,
              ),
              Card(
                  imageUrl:
                      "https://images.unsplash.com/photo-1471295253337-3ceaaedca402?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8c3BvcnRzfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60",
                  name: "Sports"),
              SizedBox(
                width: 20,
              ),
              Card(
                  imageUrl:
                      "https://images.unsplash.com/photo-1485827404703-89b55fcc595e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8dGVjaG5vbG9neXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60",
                  name: "Science"),
            ],
          ),
          Container(
            child: ListView.builder(
                itemCount: articles.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return BlogTile(
                      imageUrl: articles[index].urlToImage,
                      title: articles[index].title,
                      desc: articles[index].description);
                }),
          )
        ],
      ),
    );
  }
}

class Card extends StatelessWidget {
  final imageUrl, name;
  const Card({Key? key, this.imageUrl, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("object");
      },
      child: Container(
          child: Stack(
        children: <Widget>[
          Image.network(
            imageUrl,
            width: 300,
            height: 200,
          ),
          // Container(
          //     alignment: Alignment.center,
          //     child: Text(name, style: TextStyle(color: Colors.black)))
        ],
      )),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc;

  const BlogTile({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: <Widget>[
      Image.network(imageUrl),
      Text(title),
      Text(desc),
    ]));
  }
}
