import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_julia_ai/home/cupertino_home_scaffold.dart';
import 'package:project_julia_ai/home/home.dart';
import 'package:project_julia_ai/home/tab_item.dart';
import 'package:project_julia_ai/profiles/profiles.dart';

class TabStateControllPage extends StatefulWidget {
  @override
  _TabStateControllPageState createState() => _TabStateControllPageState();
}

class _TabStateControllPageState extends State<TabStateControllPage> {
  TabItem _currentTab = TabItem.home;

  final Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys = {
    TabItem.home: GlobalKey<NavigatorState>(),
    TabItem.messages: GlobalKey<NavigatorState>(),
    TabItem.notifications: GlobalKey<NavigatorState>(),
    TabItem.profiles: GlobalKey<NavigatorState>(),
  };

  Map<TabItem, WidgetBuilder> get widgetBuilders {
    return {
      TabItem.home: (_) => Home(),
      TabItem.messages: (_) => Container(
            child: Text("Messages"),
          ),
      TabItem.notifications: (_) => Container(
            child: Text("Notifications"),
          ),
      TabItem.profiles: (_) => Profiles(),
    };
  }

  void _select(TabItem tabItem) {
    if (tabItem == _currentTab) {
      navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>
          !await navigatorKeys[_currentTab].currentState.maybePop(),
      child: CupertinoHomeScaffold(
        currentTab: _currentTab,
        onSelectTab: _select,
        widgetBuilders: widgetBuilders,
        navigatorKeys: navigatorKeys,
      ),
    );
  }
}
