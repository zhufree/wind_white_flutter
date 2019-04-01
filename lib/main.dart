import 'package:flutter/material.dart';
import 'article_page.dart';
void main() => runApp(WindApp());

class WindApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WindHomePage(title: '风灵玉秀'),
      routes: <String, WidgetBuilder>{
        // TODO 增加跳转页面
//        '/c': (BuildContext context) => new MyPage(title: 'page C'),
      },
    );
  }
}

class WindHomePage extends StatefulWidget {
  WindHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WindHomePageState createState() => _WindHomePageState();
}

class _WindHomePageState extends State<WindHomePage> {
  int showFragmentIndex = 0;

  void _changeFragment(int index) {
    setState(() {
      showFragmentIndex = index;
    });
  }

  _showFragment() {
    switch (showFragmentIndex) {
      case 0:
        return ArticlePage();
        break;
      case 1:
        return Text("图片");
        break;
      case 2:
        return Text("设置");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              height: 180,
              color: Colors.blueGrey,
              child: Center(
                child: Container(
                  width: 100,
                  height: 130,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        margin: EdgeInsets.only(bottom: 8.0),
                        child: new ClipOval(
                          child: new FadeInImage.assetNetwork(
                            placeholder: "images/normal_user_icon.webp",
                            //预览图
                            fit: BoxFit.cover,
                            image:
                                "http://bmob-cdn-22405.b0.upaiyun.com/2019/02/24/92214ee240a420b580898df91ccedf97.jpg",
                            width: 100.0,
                            height: 100.0,
                          ),
                        ),
                      ),
                      Text("username")
                    ],
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.library_books),
              title: Text('文章'),
              onTap: () {
                _changeFragment(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_album),
              title: Text('图片墙'),
              onTap: () {
                _changeFragment(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('设置'),
              onTap: () {
                _changeFragment(2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: _showFragment(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _changeFragment(0),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
