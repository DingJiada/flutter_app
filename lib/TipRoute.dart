import 'package:flutter/material.dart';

class TipRoute extends StatelessWidget {

  TipRoute({
    Key key,
    @required this.text,  // 接收一个text参数
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("提示"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              RaisedButton(
                onPressed: () => Navigator.pop(context,"我是返回值"),
                child: Text("返回"),
              )
            ],
          ),
        ),
      ),
    );
  }
}//路由传值案例。未使用

class RouterTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: RaisedButton(
        onPressed: () async {
          // 打开`TipRoute`，并等待返回结果
          var result = await Navigator.push(context,
            MaterialPageRoute(
                builder:(context) {
                  return TipRoute(
                    //路由参数
                    text: "我是提示xxx",
                  );
                }
            ),
          );
          print("路由返回值:$result");
        },
        child: Text("打开提示页"),
      ),
    );
  }
}//路由传值案例。未使用