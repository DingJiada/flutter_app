import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
          title: new Text("音乐节RSS"),
          backgroundColor: Colors.redAccent,
        ), //头部的标题AppBar
        body: Column(
          children: <Widget>[
            Expanded(child: _searchUI(), flex: 2),
            Expanded(
                child: new CustomScrollView(shrinkWrap: true,
                    // 内容
                    slivers: <Widget>[
                      new SliverPadding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 35),
                          sliver: new SliverList(
                              delegate: new SliverChildListDelegate(<Widget>[
                                Expanded(child: _scrollImage(), flex: 3),
                                Expanded(child: _recentUpdates(), flex: 1),
                                Expanded(child: _horizontalListView(), flex: 3),
                                Expanded(child: _showCalendar(), flex: 1),
                                Expanded(child: _horizontalListViewT(), flex: 6),
                                Expanded(
                                    child: Text(
                                      "2021-03-05 19:17",
                                      textAlign: TextAlign.center,
                                    ),
                                    flex: 1),
                              ]))),
                    ]),
                flex: 13),
          ],
        ));
  }

  Widget _searchUI() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Icon(Icons.reorder),
              ),
              Expanded(
                flex: 8,
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(36)),
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 6),
                      Icon(Icons.search),
                      SizedBox(width: 6),
                      Expanded(
                        flex: 1,
                        child: TextField(
                          decoration: new InputDecoration(
                              hintText: '乐队、城市、音乐节', border: InputBorder.none),
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
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.search),
              )
            ],
          ),
          SizedBox(
            height: 10,
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
        pagination: new SwiperPagination(), //这些都是控件默认写好的,直接用
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