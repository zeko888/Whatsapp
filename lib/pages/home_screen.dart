import 'package:flutter/material.dart';
import 'status_screen.dart';
import 'calls_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: WhatsAppClone(),
    );
  }
}

class ChatData {
  final String profilePictureFileName;
  final String name;
  final String lastMessage;
  final String time;
  final int unreadMessages;
  ChatData({
    required this.profilePictureFileName,
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.unreadMessages,
  });
}

class WhatsAppClone extends StatefulWidget {
  @override
  _WhatsAppCloneState createState() => _WhatsAppCloneState();
}

class _WhatsAppCloneState extends State<WhatsAppClone> {
  int _currentIndex = 0;
  final List<ChatData> chatDataList = [
    ChatData(
      profilePictureFileName: "just.jpg",
      name: "CA208 CIT",
      lastMessage: "Ardaydan waxaa lagu heystaa..",
      time: "3:15 AM",
      unreadMessages: 1,
    ),
    ChatData(
      profilePictureFileName: "ca208.jpeg",
      name: "CA208",
      lastMessage: "Asc asxpta manta xisada fasax weyan i.a",
      time: "6:15 pM",
      unreadMessages: 7,
    ),
    ChatData(
      profilePictureFileName: "lofera.jpg",
      name: "ravera poi",
      lastMessage: "sxb i want money im poor boy",
      time: "3:05 AM",
      unreadMessages: 1,
    ),
    ChatData(
      profilePictureFileName: "an.jpeg",
      name: "Yuuky",
      lastMessage: "i am a graphic design",
      time: "3:15 pM",
      unreadMessages: 2,
    ),
    ChatData(
      profilePictureFileName: "non.jpg",
      name: "ابراهيم ☕",
      lastMessage: "i go to gym ",
      time: "3:15 AM",
      unreadMessages: 5,
    ),
    ChatData(
      profilePictureFileName: "un.jpeg",
      name: "🐲يوسف البس🛸",
      lastMessage: "الحمد لله انت كيفك",
      time: "12:30 PM",
      unreadMessages: 3,
    ),
    ChatData(
      profilePictureFileName: "kalafa.jpg",
      name: "Kalavazi group ☝️🫡",
      lastMessage: "hahaha",
      time: "3:15 pM",
      unreadMessages: 15,
    ),
    ChatData(
      profilePictureFileName: "abdixa.jpeg",
      name: "عبد حفيد🤖",
      lastMessage: "kdrama SweetHome ma arktaye",
      time: "2:50 AM",
      unreadMessages: 1,
    ),
    ChatData(
      profilePictureFileName: "gavi.jpeg",
      name: "Wll Gavi 30",
      lastMessage: "Shineska xld ka wrn",
      time: "3:00 AM",
      unreadMessages: 1,
    ),
    ChatData(
      profilePictureFileName: "manaf.jpg",
      name: "Manaf🦖",
      lastMessage: "Waa Aa ku waydiin raby Waa hely",
      time: "3:15 AM",
      unreadMessages: 1,
    ),
    ChatData(
      profilePictureFileName: "haroun.jpeg",
      name: "👻هارون🤾🏼‍♂️H",
      lastMessage: "That it is",
      time: "3:15 AM",
      unreadMessages: 1,
    ),
    ChatData(
      profilePictureFileName: "iq.jpeg",
      name: "IQ😪",
      lastMessage: " xld sxb i no have a brain",
      time: "1:30 PM",
      unreadMessages: 3,
    ),
    ChatData(
      profilePictureFileName: "ahmed.jpg",
      name: "Shuhib😎",
      lastMessage: "Asc Sxb xld",
      time: "12:30 PM",
      unreadMessages: 3,
    ),
    ChatData(
      profilePictureFileName: "people.jpg",
      name: "MarCOZ 🎭",
      lastMessage: "Wcs Sxb",
      time: "1:45 PM",
      unreadMessages: 1,
    ),
    ChatData(
      profilePictureFileName: "zeko.jpg",
      name: "اخوي جمال🕵🏽‍♂️",
      lastMessage: "ku aawaye",
      time: "3:15 PM",
      unreadMessages: 1,
    ),
    ChatData(
      profilePictureFileName: "moho.jpg",
      name: "Moha_jacylow",
      lastMessage: "im tell boy but not have a brain",
      time: "3:15 AM",
      unreadMessages: 1,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Change the length to 4 for the new camera tab
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "WhatsApp",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.search,
                size: 31.0,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SearchScreen(allChatDataList: chatDataList),
                  ),
                );
              },
            ),
            IconButton(
              icon: Icon(
                Icons.more_vert,
                size: 31.0,
              ),
              onPressed: () {},
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.camera_alt),
              ),
              Tab(text: "CHATS"),
              Tab(text: "STATUS"),
              Tab(text: "CALLS"),
            ],
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Color.fromARGB(255, 255, 255, 255),
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          backgroundColor: Color(0xff075e54),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: TabBarView(
          children: [
            Container(
              alignment: Alignment.center,
              child: Icon(
                Icons.camera_alt,
                size: 50.0,
                color: Colors.green,
              ),
            ),
            buildChatList(),
            StatusScreen(),
            CallsScreen(),
          ],
        ),
        floatingActionButton: _buildFloatingActionButton(),
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    IconData iconData;
    VoidCallback onPressed;
    switch (_currentIndex) {
      case 0:
        iconData = Icons.message;
        onPressed = () {};
        break;
      case 1:
      case 2:
        iconData = Icons.camera;
        onPressed = () {};
        break;
      case 3:
        iconData = Icons.call;
        onPressed = () {};
        break;
      default:
        throw Exception("Invalid tab index");
    }
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(
        iconData,
        color: Colors.white,
      ),
      backgroundColor: Colors.green,
    );
  }

  Widget buildChatList() {
    return ListView.builder(
      itemCount: chatDataList.length,
      itemBuilder: (context, index) {
        final chatData = chatDataList[index];
        return ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundImage:
                AssetImage("images/${chatData.profilePictureFileName}"),
          ),
          title: Text(chatData.name),
          subtitle: Text(chatData.lastMessage),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(chatData.time),
              if (chatData.unreadMessages > 0)
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    "${chatData.unreadMessages}",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
          onTap: () {},
        );
      },
    );
  }

  Widget buildCallsList() {
    return Center(
      child: Text("Calls"),
    );
  }
}

class SearchScreen extends StatefulWidget {
  final List<ChatData> allChatDataList;
  SearchScreen({required this.allChatDataList});
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  List<ChatData> _filteredChatDataList = [];

  @override
  void initState() {
    super.initState();
    _filteredChatDataList.addAll(widget.allChatDataList);
  }

  void _filterSearchResults(String query) {
    _filteredChatDataList.clear();
    if (query.isEmpty) {
      _filteredChatDataList.addAll(widget.allChatDataList);
    } else {
      _filteredChatDataList.addAll(
        widget.allChatDataList.where((chatData) =>
            chatData.name.toLowerCase().contains(query.toLowerCase())),
      );
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          onChanged: _filterSearchResults,
          decoration: InputDecoration(
            hintText: 'Search...',
            hintStyle: TextStyle(color: Colors.white),
          ),
          style: TextStyle(color: Colors.white),
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
        ),
      ),
      body: ListView.builder(
        itemCount: _filteredChatDataList.length,
        itemBuilder: (context, index) {
          final chatData = _filteredChatDataList[index];

          return ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage:
                  AssetImage("images/${chatData.profilePictureFileName}"),
            ),
            title: Text(chatData.name),
            subtitle: Text(chatData.lastMessage),
            onTap: () {},
          );
        },
      ),
    );
  }
}