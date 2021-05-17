import 'package:flutter/cupertino.dart';//iOS风格库
import 'package:flutter/material.dart';

class ScaffoldRoute extends StatefulWidget {
  @override
  _ScaffoldRouteState createState() => _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State<ScaffoldRoute>
                  with SingleTickerProviderStateMixin {

  TabController _tabController;

  List tabs = ["新闻","历史","图片"];

  int _selectedIndex = 0;

  final pages = [HomePage(),BusinessPage(),SchoolPage()];//页面数组

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 4, vsync: this);

    _tabController.addListener(() {//点击调用2次，滑动调用一次
      print(_tabController.index);
      switch(_tabController.index) {
        case 0: print("because1");
          break;
        case 1: print("because2");
          break;
        case 2: print("because3");
          break;
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("App Name"),
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(Icons.dashboard,color: Colors.white),
            onPressed: () {
              // 打开抽屉菜单
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.share),onPressed: () {
            print("点击分享");
            //ios风格弹窗
            showCupertinoAlert(context);
          },),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs.map((e) => Tab(text: e)).toList(),
        ),
      ),
      drawer: new MyDrawer(),//左抽屉
      bottomNavigationBar:
//      BottomAppBar(
//        color: Colors.white,
//        shape: CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
//        child: Row(
//          children: [
//            IconButton(icon: Icon(Icons.home)),
//            IconButton(icon: Icon(Icons.search)),
//            SizedBox(), //中间位置空出
//            IconButton(icon: Icon(Icons.email)),
//            IconButton(icon: Icon(Icons.person)),
//          ],
//          mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
//        ),
//
//      ),
      BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home),title: Text("首页")),
          BottomNavigationBarItem(icon: Icon(Icons.email),title: Text("信息")),
          BottomNavigationBarItem(icon: Icon(Icons.person),title: Text("我的")),

        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _onAdd,
      ),
//      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//      body: pages[_selectedIndex],//TabBar单个页面
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) {
          return Container(
            alignment: Alignment.center,
            child: Text(e,textScaleFactor: 5),
          );
        }).toList(),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAdd() {
    print("点击添加");
  }

  buildBotomItem(int selectIndex, int index, IconData iconData, String title) {
    //未选中状态的样式
    TextStyle textStyle = TextStyle(fontSize: 12.0,color: Colors.grey);
    MaterialColor iconColor = Colors.grey;
    double iconSize=20;
    EdgeInsetsGeometry padding =  EdgeInsets.only(top: 8.0);

    if(selectIndex == index){
      //选中状态的文字样式
      textStyle = TextStyle(fontSize: 13.0,color: Colors.blue);
      //选中状态的按钮样式
      iconColor = Colors.blue;
      iconSize=25;
      padding =  EdgeInsets.only(top: 6.0);
    }
    Widget padItem = SizedBox();
    if (iconData != null) {
      padItem = Padding(
        padding: padding,
        child: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              children: <Widget>[
                Icon(
                  iconData,
                  color: iconColor,
                  size: iconSize,
                ),
                Text(
                  title,
                  style: textStyle,
                )
              ],
            ),
          ),
        ),
      );
    }
    Widget item = Expanded(
      flex: 1,
      child: new GestureDetector(
        onTap: () {
          if (index != _selectedIndex) {
            setState(() {
              _selectedIndex = index;
            });
          }
        },
        child: SizedBox(
          height: 52,
          child: padItem,
        ),
      ),
    );
    return item;
  }

  void showCupertinoAlert(widgetContext) {
    showCupertinoDialog(
      context: widgetContext,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text('分享'),
          actions: [
            CupertinoDialogAction(
              child: Text('确认'),
              onPressed: () {
                print("点击确定");
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              child: Text('取消'),
              isDestructiveAction: true,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}

//左抽屉
class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key:key);

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
                      padding: const EdgeInsets.symmetric(horizontal:  16.0),
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


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
//      appBar: AppBar (
//        title: Text("首页"),
//      ),
      body: Center(
        child: RaisedButton (
          child: Text("this is tab #0"),
          onPressed: () {

          },
        ),
      ),
    );
  }
}

class BusinessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
//      appBar: AppBar (
//        title: Text("Business"),
//      ),
      body: Center(
        child: RaisedButton (
          child: Text("this is tab #1"),
          onPressed: () {

          },
        ),
      ),
    );
  }
}

class SchoolPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
//      appBar: AppBar (
//        title: Text("School"),
//      ),
      body: Center(
        child: RaisedButton (
          child: Text("this is tab #2"),
          onPressed: () {

          },
        ),
      ),
    );
  }
}