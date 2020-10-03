import 'package:flutter/material.dart';

import 'ConversationPage.dart';

class ConversationPageList extends StatefulWidget {
  @override
  _ConversationPageListState createState() => _ConversationPageListState();
}

class _ConversationPageListState extends State<ConversationPageList> {
  List _friends = [
    {'_id': '1', 'name': 'Ishwar ', 'username': '22rf12331'},
    {'_id': '2', 'name': 'Chandra', 'username': '04859w3320'},
  ];
  void startChat(user) {
    print(user);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ConversationPage(friend: user),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          // new Container(
          //   padding: EdgeInsets.symmetric(horizontal: 15.0),
          //   child: GestureDetector(
          //     child: Text("Messages",
          //         style: Theme.of(context).textTheme.headline4),
          //     onTap: () => {},
          //   ),
          // ),
          SizedBox(height: 30.0),
          new Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: SizedBox(
              height: 50,
              child: TextField(
                readOnly: true,
                onTap: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                  Navigator.pushNamed(context, '/FindUser');
                  // Navigator.pushReplacementNamed(context, '/FindUser');
                },
                textInputAction: TextInputAction.done,
                onSubmitted: (_) {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                },
                autofocus: false,
                decoration: InputDecoration(
                  border: new OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  hintText: 'Search',
                  labelStyle: Theme.of(context)
                      .textTheme
                      .button
                      .copyWith(color: Color(0xFF8A9299)),
                  suffixIcon: IconButton(
                    iconSize: 30,
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, '/FindUser'),
                    icon: Icon(Icons.search,
                        color: Theme.of(context).iconTheme.color),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          new Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: ListView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _friends.length,
                itemBuilder: (BuildContext context, int index) {
                  var friend = _friends[index];
                  var _friendsName = friend['name'];
                  var _friendsUserName = friend['username'];
                  return ListTile(
                      contentPadding: EdgeInsets.all(5),
                      leading: Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            new BoxShadow(
                              blurRadius: 5.0,
                              offset: new Offset(2.0, 2.0),
                            )
                          ],
                        ),
                        child: CircleAvatar(
                          child: Icon(
                            Icons.person,
                          ),
                          radius: 25,
                        ),
                      ),
                      title: new Container(
                        padding: EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              flex: 0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    flex: 0,
                                    child: Text(
                                      _friendsName,
                                      overflow: TextOverflow.ellipsis,
                                      style:
                                          Theme.of(context).textTheme.subtitle2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Expanded(
                            //   flex: 0,
                            //   child: Text(
                            //     '9 PM',
                            //     overflow: TextOverflow.ellipsis,
                            //     style: Theme.of(context)
                            //         .textTheme
                            //         .overline
                            //         .copyWith(fontSize: 9),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      subtitle: new Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                  flex: 0,
                                  child: Text(
                                    '@' + _friendsUserName,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Expanded(
                                  flex: 0,
                                  child: SizedBox(
                                    height: 15,
                                  ),
                                ),
                                Expanded(
                                  flex: 0,
                                  child: Divider(
                                    height: 1,
                                    thickness: 1,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      onTap: () => startChat(friend));
                },
              ))
        ],
      ),
    );
  }
}
