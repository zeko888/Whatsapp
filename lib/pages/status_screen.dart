import 'package:flutter/material.dart';

class StatusScreen extends StatelessWidget {
  // Sample status data
  final List<StatusData> statusDataList = [
    StatusData(
      profilePictureFileName: "j.jpg",
      name: "me",
      time: "Today, 10:30 AM",
    ),
    StatusData(
      profilePictureFileName: "a.jpg",
      name: "Wll Gavi 30",
      time: "Today, 12:45 PM",
    ),
    StatusData(
      profilePictureFileName: "na.jpg",
      name: "👻هارون🤾🏼‍♂️H",
      time: "Yesterday, 5:15 PM",
    ),
    // Add more status data as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildStatusList(),
    );
  }

  Widget buildStatusList() {
    return ListView.builder(
      itemCount: statusDataList.length,
      itemBuilder: (context, index) {
        final statusData = statusDataList[index];

        return ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage("images/${statusData.profilePictureFileName}"),
          ),
          title: Text(statusData.name),
          subtitle: Text(statusData.time),
          onTap: () {
            // Implement status screen navigation
          },
        );
      },
    );
  }
}

class StatusData {
  final String profilePictureFileName;
  final String name;
  final String time;

  StatusData({
    required this.profilePictureFileName,
    required this.name,
    required this.time,
  });
}
