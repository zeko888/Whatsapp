import 'package:flutter/material.dart';

class CallsScreen extends StatelessWidget {
  // Sample call data
  final List<CallData> callDataList = [
    CallData(
      profilePictureFileName: "moho.jpg",
      name: "Moha_jacylow",
      time: "Today, 10:30 AM",
      callType: CallType.incoming,
    ),
    CallData(
      profilePictureFileName: "zeko.jpg",
      name: "اخوي جمال 🕵🏽‍♂️",
      time: "Yesterday, 5:15 PM",
      callType: CallType.outgoing,
    ),
    CallData(
      profilePictureFileName: "haroun.jpeg",
      name: "👻هارون🤾🏼‍♂️H",
      time: "2 days ago, 8:45 AM",
      callType: CallType.missed,
    ),
    // Add more call data as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildCallsList(),
    );
  }

  Widget buildCallsList() {
    return ListView.builder(
      itemCount: callDataList.length,
      itemBuilder: (context, index) {
        final callData = callDataList[index];

        return ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage("images/${callData.profilePictureFileName}"),
          ),
          title: Text(callData.name),
          subtitle: Row(
            children: [
              Icon(
                callData.callType == CallType.incoming
                    ? Icons.call_received
                    : callData.callType == CallType.outgoing
                        ? Icons.call_made
                        : Icons.call_missed,
                color: callData.callType == CallType.missed ? Colors.red : Colors.green,
              ),
              SizedBox(width: 5),
              Text(callData.time),
            ],
          ),
          trailing: Icon(
            Icons.call,
            color: Colors.green,
          ),
          onTap: () {
            // Implement call screen navigation
          },
        );
      },
    );
  }
}

class CallData {
  final String profilePictureFileName;
  final String name;
  final String time;
  final CallType callType;

  CallData({
    required this.profilePictureFileName,
    required this.name,
    required this.time,
    required this.callType,
  });
}

enum CallType {
  incoming,
  outgoing,
  missed,
}
