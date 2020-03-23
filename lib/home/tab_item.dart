import 'package:flutter/material.dart';
import 'package:project_julia_ai/values/my_flutter_app_icons.dart';

enum TabItem { home, messages, notifications, profiles }

class TabItemData {
  const TabItemData({@required this.title, @required this.icon});
  final String title;
  final IconData icon;

  static const Map<TabItem, TabItemData> allTabs = {
    TabItem.home: TabItemData(
      title: 'Home',
      icon: MyFlutterApp.newhome,
    ),
    TabItem.messages: TabItemData(
      title: 'Messages',
      icon: MyFlutterApp.message,
    ),
    TabItem.notifications: TabItemData(
      title: 'Notifications',
      icon: MyFlutterApp.bell,
    ),
    TabItem.profiles: TabItemData(
      title: 'Profiles',
      icon: MyFlutterApp.profiles,
    ),
  };
}
