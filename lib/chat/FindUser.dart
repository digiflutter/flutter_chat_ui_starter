import 'package:flutter/material.dart';

class FindUser extends StatefulWidget {
  @override
  _FindUserState createState() => new _FindUserState();
}

class _FindUserState extends State<FindUser> {
  TextEditingController controller = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: new AppBar(
          title: new Container(
            child: new Container(
              child: new ListTile(
                title: new TextField(
                  autofocus: true,
                  controller: controller,
                  decoration: new InputDecoration(
                      hintText: 'Search', border: InputBorder.none),
                ),
                trailing: new IconButton(
                  icon: new Icon(Icons.cancel),
                  onPressed: () {
                    controller.clear();
                  },
                ),
              ),
            ),
          ),
          elevation: 1.0,
        ),
      ),
      body: new Column(
        children: <Widget>[
          new Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }
}
