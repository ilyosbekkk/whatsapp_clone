import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatsScreen extends StatefulWidget {
  ChatsScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  List<Widget> appBar = [];
  List<Widget> titleWIdget = [];
  List<Widget> searchBar = [];
  List<Widget> elements = [];
  List<Widget> archivedChats = [];
  List<Widget> broadCastListsAndNewGroups = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    titleWIdget = [getTitleWidget(context)];
    searchBar = [getSearchBarWidget(context)];
    archivedChats = [getArchivedMessages(context, 5)];
    broadCastListsAndNewGroups = [getBroadCastListandNewGroupWidget(context)];

    for (int i = 0; i < 15; i++) {
      elements.add(getContactWidget(context, "anonymus", "hello,man!", DateFormat.Hm().format(DateTime.now())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          leading: Icon(
            Icons.edit,
            color: Colors.blueAccent,
          ),
          title: Text(
            "Chats",
            style: TextStyle(color: Colors.white),
          ),
          actions: [getActions(context)]),
      body: ListView.separated(
          separatorBuilder: (BuildContext context, int index) => Divider(
                color: index == 0 || index == 1 ? Colors.black : Colors.white ,
              ),
          itemCount: titleWIdget.length + searchBar.length + elements.length + archivedChats.length,
          itemBuilder: (context, index) {
            return getWIdgets(context, index);
          }), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget getTitleWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.0),
      color: Colors.black,
      child: Text(
        "Chats",
        style: TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget getWIdgets(BuildContext context, int index) {
    if (index == 0)
      return titleWIdget[index];
    else if (index == 1) {
      index -= searchBar.length;
      return searchBar[index];
    } else if (index == 2) {
      index -= searchBar.length + titleWIdget.length;
      return archivedChats[index];
    } else if (index == 3) {
      index -= searchBar.length + titleWIdget.length + archivedChats.length;
      return broadCastListsAndNewGroups[index];
    } else {
      index -= searchBar.length + titleWIdget.length + archivedChats.length + broadCastListsAndNewGroups.length;
      return elements[index];
    }
  }

  Widget getSearchBarWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0, bottom: 10.0),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white,
      ),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          children: [
            Icon(Icons.search),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search a contact",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getActions(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 10.0),
        alignment: Alignment.center,
        child: GestureDetector(
          child: Text(
            "Edit",
            style: TextStyle(color: Colors.blueAccent, fontSize: 15),
          ),
        ));
  }

  Widget getContactWidget(BuildContext context, String userName, String message, String time) {
    return Container(
      margin: EdgeInsets.only(top: 5.0),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage("https://p7.hiclipart.com/preview/442/17/110/computer-icons-user-profile-male-user.jpg"),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10.0),
                      child: Text(
                        "$userName",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10.0),
                      child: Text(
                        "$message",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(right: 10.0),
              child: Text(
                "$time",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getArchivedMessages(BuildContext context, int number) {
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10.0),
              child: IconButton(
                color: Colors.blueAccent,
                icon: Icon(Icons.archive),
                onPressed: () {
                  // TODO implement functionality
                },
              ),
            ),
            Container(margin: EdgeInsets.only(left: 10.0), child: Text("Archived chats", style: TextStyle(color: Colors.blueAccent)))
          ],
        ),
        Container(
          margin: EdgeInsets.only(right: 10.0),
          child: Text(
            "$number",
            style: TextStyle(color: Colors.white),
          ),
        )
      ]),
    );
  }

  Widget getBroadCastListandNewGroupWidget(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(left: 10.0),
              child: Text(
                "Broadcast Lists",
                style: TextStyle(color: Colors.blueAccent),
              ),
            ),
          ),
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(right: 10.0),
              child: Text(
                "New Group",
                style: TextStyle(color: Colors.blueAccent),
              ),
            ),
          )
        ],
      ),
    );
  }
}
