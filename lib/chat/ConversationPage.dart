import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class ConversationPage extends StatefulWidget {
  var friend;
  ConversationPage({Key key, @required this.friend}) : super(key: key);
  @override
  _ConversationPageState createState() => _ConversationPageState(this.friend);
}

class _ConversationPageState extends State<ConversationPage> {
  var friend;
  _ConversationPageState(this.friend);

  //ChatListWidget, //Chat list
  final ScrollController listScrollController = new ScrollController();

  List _chats = [
    {
      'to': '1',
      'from': '2',
      'content': 'Tesing Chat',
      "type": "text",
      'date': 1565888474278
    },
    {
      'to': '2',
      'from': '1',
      'content': 'Tesing Chat Ok',
      "type": "text",
      'date': 1565888474272
    },
    {
      'to': '2',
      'from': '1',
      'content': 'All Done!',
      "type": "text",
      'date': 1565588474278
    }
  ];

  //InputWidget
  final TextEditingController textEditingController =
      new TextEditingController();

  void handleSubmitToSendMessage() async {
    try {
      if (textEditingController.text != '' &&
          textEditingController.text != null) {
        var data = {
          'from': friend['_id'],
          'to': friend['_id'] == 1 ? 2 : friend['_id'],
          'content': textEditingController.text,
          "date": 1565588474278,
          "type": "text",
        };

        setState(() {
          _chats.insert(0, data);
        });
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    // print('friend $friend');
    return Container(
      
      child: Scaffold(
        backgroundColor: Colors.teal[50],
        appBar: appBar(),
        body: Stack(children: <Widget>[
          Column(
            children: <Widget>[
              //ChatListWidget, //Chat list
              new Container(
                child: Flexible(
                  child: ListView.builder(
                      padding: EdgeInsets.all(10.0),
                      itemCount: _chats.length,
                      reverse: true,
                      controller: listScrollController,
                      itemBuilder: (BuildContext context, int index) {
                        var chat = _chats[index];
                        var from = chat['from'];
                        var to = chat['to'];
                        var date = chat['date'];
                        var content = chat['content'];
                        // print('$from $to $date $content');
                        return (friend['_id'] == to)
                            ? Container(
                                child: Column(children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      child: Text(
                                        content,
                                      ),
                                      padding: EdgeInsets.fromLTRB(
                                          15.0, 10.0, 15.0, 10.0),
                                      width: 200.0,
                                      decoration: BoxDecoration(
                                          color: Colors.teal[300],
                                          borderRadius:
                                              BorderRadius.circular(8.0)),
                                      margin: EdgeInsets.only(right: 10.0),
                                    )
                                  ],
                                  mainAxisAlignment: MainAxisAlignment
                                      .end, // aligns the chatitem to right end
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Container(
                                        child: Text(
                                          DateFormat('dd MMM kk:mm').format(
                                              DateTime
                                                  .fromMillisecondsSinceEpoch(
                                                      date)),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12.0,
                                              fontStyle: FontStyle.normal),
                                        ),
                                        margin: EdgeInsets.only(
                                            left: 5.0, top: 5.0, bottom: 5.0),
                                      )
                                    ])
                              ]))
                            : Container(
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                            content,
                                            // style: TextStyle(color: Palette.otherMessageColor),
                                          ),
                                          padding: EdgeInsets.fromLTRB(
                                              15.0, 10.0, 15.0, 10.0),
                                          width: 200.0,
                                          decoration: BoxDecoration(
                                              color: Colors.teal[100],
                                              borderRadius:
                                                  BorderRadius.circular(8.0)),
                                          margin: EdgeInsets.only(left: 10.0),
                                        )
                                      ],
                                    ),
                                    Container(
                                      child: Text(
                                        DateFormat('dd MMM kk:mm').format(
                                            DateTime.fromMillisecondsSinceEpoch(
                                                date)),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.0,
                                            fontStyle: FontStyle.normal),
                                      ),
                                      margin: EdgeInsets.only(
                                          left: 5.0, top: 5.0, bottom: 5.0),
                                    )
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                ),
                                margin: EdgeInsets.only(bottom: 10.0),
                              );
                      }),
                ),
              ),

              // InputWidget The input widget
              new Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: <Widget>[
                    // Material(
                    //   child: new Container(
                    //     margin: new EdgeInsets.symmetric(horizontal: 1.0),
                    //     child: new IconButton(
                    //       onPressed: () {},
                    //       icon: new Icon(Icons.face),
                    //     ),
                    //   ),
                    // ),

                    // Text input
                    Flexible(
                      child: Container(
                        child: TextField(
                          textInputAction: TextInputAction.done,
                          style: TextStyle(fontSize: 15.0),
                          controller: textEditingController,
                          decoration: InputDecoration.collapsed(
                            hintText: 'Type a message',
                          ),
                          onSubmitted: (_) => handleSubmitToSendMessage(),
                        ),
                      ),
                    ),

                    // Send Message Button
                    Material(
                      child: new Container(
                        margin: new EdgeInsets.symmetric(horizontal: 8.0),
                        child: new IconButton(color: Colors.teal,
                          icon: new Icon(Icons.send),
                          onPressed: () => handleSubmitToSendMessage(),
                        ),
                      ),
                    ),
                  ],
                ),
                width: double.infinity,
                height: 50.0,
                decoration: new BoxDecoration(color: Colors.grey[50],
                  // border: new Border(top: new BorderSide(width: 0.5)),
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }

  //appbar
  Widget appBar() => AppBar(
        title: Row(children: <Widget>[
          Expanded(
              flex: 4,
              child: Center(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                      child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                          flex: 0,
                          child: Container(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text('Friend Name',
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .subtitle1),
                              Text(
                                '@UserName',
                                style: Theme.of(context).textTheme.subtitle2,
                              )
                            ],
                          ))),
                    ],
                  )),
                ],
              ))),
          Expanded(
              flex: 0,
              child: Container(
                child: CircleAvatar(
                  child: Icon(
                    Icons.person,
                  ),
                ),
              )),
        ]),
      );
}
