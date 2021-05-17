import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:async';
import 'RandomWords.dart';
import 'PerfectRoute.dart';
import 'TipRoute.dart';
import 'ListViewRoute.dart';

void main() {
  runApp(MyApp());
//  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
}

Map<String, WidgetBuilder> routes; //路由表

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      home: ScaffoldRoute(),
      home: MyHomePage(title: '音乐节RSS'), //起始页RootPage
      // debugShowCheckedModeBanner: false,//去掉右上角Debug标签
      title: '音乐节RSS',
//      initialRoute: "/",//初始化导航路由
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue, //主题色
        primaryColor: Colors.white,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
//        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

//      //注册路由表
//      routes:{
//        "new_page":(context) => NewViewController(),
//        "/":(context) => MyHomePage(title: 'Flutter Demo Home Page'),
//        // 省略其它路由注册信息
//      } ,
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
} //导航栏

class _MyHomePageState extends State<MyHomePage> {
  Widget header = DrawerHeader(
      padding: EdgeInsets.zero,
      /* padding置为0 */
      child: new Center(
          child: new Row(
              mainAxisSize: MainAxisSize.min,
              /* 宽度只用包住子组件即可 */
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            Expanded(child: SizedBox(), flex: 1),
            Expanded(
                child: new CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://www.itying.com/images/flutter/2.png"),
                  radius: 51.0,
                ),
                flex: 3),
            Expanded(child: SizedBox(), flex: 1),
            Expanded(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(),
                      flex: 1,
                    ),
                    Expanded(
                        child: new Text(
                          "TinyUlt",
                          style: new TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        flex: 1),
                    Expanded(
                        child: new Text(
                          "2590分贝",
                          style: new TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        flex: 1),
                    Expanded(child: SizedBox(), flex: 1),
                  ],
                ),
                flex: 3),
            Expanded(child: SizedBox(), flex: 1),
          ])));

  List<Image> imgs = [
    //建立了一个图片数组
    Image.network(
      "https://www.itying.com/images/flutter/2.png",
      fit: BoxFit.cover,
    ),
    Image.network(
      "https://www.itying.com/images/flutter/2.png",
      fit: BoxFit.cover,
    ),
    Image.network(
      "https://www.itying.com/images/flutter/2.png",
      fit: BoxFit.cover,
    ),
  ];
  double itemS = 15.0;
  Color itemBg = Color.fromRGBO(102, 119, 198, 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("音乐节RSS", style: TextStyle(color: Colors.black)),
          centerTitle: true,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
        ),
        resizeToAvoidBottomPadding: false,
        drawer: Drawer(
          child: Column(
            children: [
              header,
              ListTile(
                title: Text("术语",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18)),
                trailing: Icon(Icons.chevron_right),
              ),
              ListTile(
                title: Text("收藏",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18)),
                trailing: Icon(Icons.chevron_right),
              ),
              ListTile(
                title: Text("关于",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18)),
                trailing: Icon(Icons.chevron_right),
              ),
              ListTile(
                title: Text("投递建议",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18)),
                trailing: Icon(Icons.chevron_right),
              ),
            ],
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(child: _searchUI(), flex: 3),
            Expanded(
                child: new CustomScrollView(shrinkWrap: true,
                    // 内容
                    slivers: <Widget>[
                      new SliverPadding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                          sliver: new SliverList(
                              delegate: new SliverChildListDelegate(<Widget>[
                            Expanded(child: _scrollImage(), flex: 3),
                            Expanded(child: _recentUpdates(), flex: 1),
                            Expanded(child: _horizontalListView(), flex: 3),
                            Expanded(child: _showCalendar(), flex: 1),
                            Expanded(child: _horizontalListViewT(), flex: 6),
                            Expanded(
                                child: Text(
                                  "致力提供最新最全的演出资讯!",
                                  textAlign: TextAlign.center,
                                  style: new TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                flex: 1),
                          ]))),
                    ]),
                flex: 24),
          ],
        ));
  }

  Widget _searchUI() {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Builder(builder: (context) {
              return Container(
                  child: IconButton(
                      icon: Icon(Icons.reorder),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      }));
            }),
          ),
          Expanded(
            flex: 8,
            child: Container(
              height: 45,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(36)),
              child: Row(
                children: <Widget>[
                  SizedBox(width: 8),
                  Icon(Icons.search),
                  SizedBox(width: 6),
                  Expanded(
                    flex: 1,
                    child: TextField(
                      decoration: new InputDecoration(
                          hintText: '乐队、城市、音乐节、演唱会', border: InputBorder.none),
                      // style: CustomText.TextSmall,
                      onChanged: (value) {},
                      // controller: _controller,
                    ),
                  ),
                  SizedBox(width: 6)
                ],
              ),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            flex: 2,
            child: IconButton(
              icon: Icon(Icons.dashboard, color: Colors.black),
              onPressed: () {
                print("right click dashboard");
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _scrollImage() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      height: 205,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          //条目构建函数传入了index,根据index索引到特定图片
          return imgs[index];
        },
        itemCount: imgs.length,
        autoplay: true,
        pagination: new SwiperPagination(
            builder: DotSwiperPaginationBuilder(
                //小圆点控制器
                color: Colors.black,
                size: 8.0,
                activeSize: 10.0)), //这些都是控件默认写好的,直接用
      ),
    );
  }

  Widget _recentUpdates() {
    return Container(
      height: 80,
      child: Row(
        children: <Widget>[
          Expanded(child: SizedBox(), flex: 1),
          Expanded(
              child: Text("最近更新",
                  style: TextStyle(fontSize: 20), textAlign: TextAlign.left),
              flex: 8),
          Expanded(child: SizedBox(), flex: 3),
          Expanded(child: Icon(Icons.keyboard_arrow_right), flex: 2),
        ],
      ),
    );
  }

  Widget _horizontalListView() {
    return Center(
      child: Container(
        height: 220.0,
        child: ListView(
            // 内边距
            padding: EdgeInsets.all(0),
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(width: itemS, color: Colors.white, child: SizedBox()),
              Container(
                width: 140.0,
                color: itemBg, //102,119,198
                child: _horizontalListViewChild(
                    titleTL: "北京",
                    titleTR: "星期天",
                    titleBO: "xxx音乐会",
                    titleBT: "2021-02-02",
                    imagePathV: "https://www.itying.com/images/flutter/2.png"),
              ),
              Container(width: itemS, color: Colors.white, child: SizedBox()),
              Container(
                width: 140.0,
                color: itemBg,
                child: _horizontalListViewChild(
                    titleTL: "北京",
                    titleTR: "星期天",
                    titleBO: "xxx音乐会",
                    titleBT: "2021-02-02",
                    imagePathV: "https://www.itying.com/images/flutter/2.png"),
              ),
              Container(width: itemS, color: Colors.white, child: SizedBox()),
              Container(
                width: 140.0,
                color: itemBg,
                child: _horizontalListViewChild(
                    titleTL: "北京",
                    titleTR: "星期天",
                    titleBO: "xxx音乐会",
                    titleBT: "2021-02-02",
                    imagePathV: "https://www.itying.com/images/flutter/2.png"),
              ),
              Container(width: itemS, color: Colors.white, child: SizedBox()),
              Container(
                width: 140.0,
                color: itemBg,
                child: _horizontalListViewChild(
                    titleTL: "北京",
                    titleTR: "星期天",
                    titleBO: "xxx音乐会",
                    titleBT: "2021-02-02",
                    imagePathV: "https://www.itying.com/images/flutter/2.png"),
              ),
              Container(width: itemS, color: Colors.white, child: SizedBox()),
            ]),
      ),
    );
  }

  Widget _showCalendar() {
    return Container(
      height: 80,
      child: Row(
        children: <Widget>[
          Expanded(child: SizedBox(), flex: 1),
          Expanded(
              child: Text("演出日历",
                  style: TextStyle(fontSize: 20), textAlign: TextAlign.left),
              flex: 8),
          Expanded(child: SizedBox(), flex: 3),
          Expanded(child: Icon(Icons.keyboard_arrow_right), flex: 2),
        ],
      ),
    );
  }

  Widget _horizontalListViewT() {
    return Center(
      child: Container(
        height: 280.0,
        child: ListView(
            padding: EdgeInsets.all(10),
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(width: itemS, color: Colors.white, child: SizedBox()),
              _createItem(),
              Container(width: itemS, color: Colors.white, child: SizedBox()),
              _createItem(),
              Container(width: itemS, color: Colors.white, child: SizedBox()),
              _createItem(),
            ]),
      ),
    );
  }

  Widget _horizontalListViewChild({
    final String titleTL,
    final String titleTR,
    final String titleBO,
    final String titleBT,
    final String imagePathV,
  }) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
              child: Row(children: <Widget>[
                Expanded(child: SizedBox(), flex: 1),
                Expanded(
                    child: Text(titleTL,
                        style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.left),
                    flex: 3),
                // Expanded(child: SizedBox(), flex: 2),
                Expanded(
                    child: Text(titleTR,
                        style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.center),
                    flex: 4),
              ]),
              flex: 1),
          Expanded(child: Image.network(imagePathV), flex: 4),
          Expanded(
              child: Text(titleBO,
                  style: TextStyle(fontSize: 15), textAlign: TextAlign.left),
              flex: 1),
          Expanded(
              child: Text(titleBT,
                  style: TextStyle(fontSize: 15), textAlign: TextAlign.left),
              flex: 1),
        ],
      ),
    );
  }

  Widget _horizontalListViewTChild({
    final String titleTO,
    final String titleTT,
    final String titleBO,
    final String titleBT,
  }) {
    return Container(
        child: Column(children: <Widget>[
      Expanded(
          child: Column(children: <Widget>[
            Text("data"),
            Text("data"),
          ]),
          flex: 1),
      Expanded(
          child: ListView(padding: EdgeInsets.all(20), children: <Widget>[
            ListTile(
                title: Text('定军山音乐节',
                    style: TextStyle(fontSize: 24, color: Colors.red)),
                subtitle: Text('北京'),
                trailing: Icon(Icons.inbox, size: 40)),
          ]),
          flex: 3),
    ]));
  }

  Widget _createItem() {
    return Container(
        width: 280.0,
        child:
            // _horizontalListViewTChild(
            //     titleTO: "1", titleTT: "1", titleBO: "1", titleBT: "1")
            Column(
          children: <Widget>[
            Expanded(
                child: Container(
                  width: 280,
                  color: Colors.yellow,
                  child: Column(children: <Widget>[
                    Text("星期六",
                        style: TextStyle(fontSize: 22, color: Colors.black)),
                    Text("2021-03-06",
                        style: TextStyle(fontSize: 17, color: Colors.black)),
                  ]),
                ),
                flex: 1),
            _breakLine(),
            Expanded(
                child: ListView(padding: EdgeInsets.all(20), children: <Widget>[
                  ListTile(
                      title: Text('定军山音乐节',
                          style: TextStyle(fontSize: 24, color: Colors.black)),
                      subtitle: Text('北京',
                          style: TextStyle(fontSize: 15, color: Colors.black)),
                      trailing: Icon(Icons.inbox, size: 40)),
                  _breakLine(),
                  ListTile(
                      title: Text('定军山音乐节',
                          style: TextStyle(fontSize: 24, color: Colors.black)),
                      subtitle: Text('北京',
                          style: TextStyle(fontSize: 15, color: Colors.black)),
                      trailing: Icon(Icons.inbox, size: 40)),
                  _breakLine(),
                  ListTile(
                      title: Text('定军山音乐节',
                          style: TextStyle(fontSize: 24, color: Colors.black)),
                      subtitle: Text('北京',
                          style: TextStyle(fontSize: 15, color: Colors.black)),
                      trailing: Icon(Icons.inbox, size: 40)),
                  _breakLine(),
                ]),
                flex: 3),
          ],
        ));
  }

  //分割线
  Widget _breakLine() {
    return Container(
        padding: EdgeInsets.only(left: 0, right: 0),
        height: 1,
        child: Divider(
          height: 0.1,
          color: Colors.black,
          indent: 0,
        ));
  }
}

//nav左边自带drawer
class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        //移除抽屉菜单顶部默认留白
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.asset(
                        "images/yes.jpg",
                        width: 80,
                        height: 80,
                      ),
                    ),
                  ),
                  Text(
                    "username",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('Add account'),
                    onTap: onAddAccount,
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Manage accounts'),
                    onTap: onManageAccount,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void onAddAccount() {
    print("单击AddAccount");
  }

  void onManageAccount() {
    print("单击ManageAccount");
  }
}
//class _MyHomePageState extends State<MyHomePage> {
//  int _counter = 0;
//
//  void _incrementCounter() {
//    setState(() {
//      // This call to setState tells the Flutter framework that something has
//      // changed in this State, which causes it to rerun the build method below
//      // so that the display can reflect the updated values. If we changed
//      // _counter without calling setState(), then the build method would not be
//      // called again, and so nothing would appear to happen.
//      _counter+=1;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // This method is rerun every time setState is called, for instance as done
//    // by the _incrementCounter method above.
//    //
//    // The Flutter framework has been optimized to make rerunning build methods
//    // fast, so that you can just rebuild anything that needs updating rather
//    // than having to individually change instances of widgets.
//    return Scaffold(
//      appBar: AppBar(
//        // Here we take the value from the MyHomePage object that was created by
//        // the App.build method, and use it to set our appbar title.
//        title: Text(widget.title),
//      ),
//      body: Center(
//        // Center is a layout widget. It takes a single child and positions it
//        // in the middle of the parent.
//        child: Column(
//          // Column is also a layout widget. It takes a list of children and
//          // arranges them vertically. By default, it sizes itself to fit its
//          // children horizontally, and tries to be as tall as its parent.
//          //
//          // Invoke "debug painting" (press "p" in the console, choose the
//          // "Toggle Debug Paint" action from the Flutter Inspector in Android
//          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//          // to see the wireframe for each widget.
//          //
//          // Column has various properties to control how it sizes itself and
//          // how it positions its children. Here we use mainAxisAlignment to
//          // center the children vertically; the main axis here is the vertical
//          // axis because Columns are vertical (the cross axis would be
//          // horizontal).
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Text(
//              'You have clicked the button this many times:',
//            ),
//            Text(
//              '$_counter',
//              style: Theme.of(context).textTheme.headline4,
//            ),
//            FlatButton(
//              child: Text("open new ViewController"),
//              textColor: Colors.blue,
//              onPressed: () {
//                //导航到新页面(路由)
//                Navigator.pushNamed(context, "new_page");//通过路由名打开路由页
//                /*Navigator.push( context,
//                    MaterialPageRoute(builder: (context) {
//                      return NewViewController();
//                    }));*/
//
//              },
//            ),
//            RandomWordsWidget(),//随机字符串
//          ],
//        ),
//      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
//    );
//  }
//}

class NewViewController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("路由"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("This is new ViewController"),
            RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("返回"),
            ),
            RaisedButton(
              child: Text("Next"),
              onPressed: () {},
            ),
            Image(
              image: AssetImage("images/yes.jpg"),
              width: 300.0,
              height: 300.0,
            ),
          ],
        ),
      ),
    );
  }
} //路由（NewRoute）

class TabBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(title: Text("首页"), icon: Icon(Icons.menu)),
          BottomNavigationBarItem(
              title: Text("项目"), icon: Icon(Icons.business)),
          BottomNavigationBarItem(
              title: Text("我的"), icon: Icon(Icons.account_box)),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          /// ignore: missing_return
          builder: (context) {
            switch (index) {
              case 0:
                return FirstPage();
                break;
              case 1:
                return TwoPage();
                break;
              case 2:
                return ThreePage();
                break;
            }
          },
        );
      },
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("首页"),
      ),
      child: Center(
        child: CupertinoButton(
          child: Text("展示详情"),
          onPressed: () {
            Navigator.of(context)
                .push(CupertinoPageRoute(builder: (BuildContext context) {
              return NewViewController();
            }));
          },
        ),
      ),
    );
  }
}

class TwoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("项目"),
      ),
      child: Center(
        child: CupertinoButton(
          child: Text("展示详情"),
          onPressed: () {
            Navigator.of(context)
                .push(CupertinoPageRoute(builder: (BuildContext context) {
              return NewViewController();
            }));
          },
        ),
      ),
    );
  }
}

class ThreePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("我的"),
      ),
      child: Center(
        child: CupertinoButton(
          child: Text("展示详情"),
          onPressed: () {
            Navigator.of(context)
                .push(CupertinoPageRoute(builder: (BuildContext context) {
              return NewViewController();
            }));
          },
        ),
      ),
    );
  }
}
