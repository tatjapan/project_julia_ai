import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_julia_ai/common_widgets/linear_gradient_mask.dart';
import 'package:project_julia_ai/home/tab_item.dart';
import 'package:project_julia_ai/values/values.dart';

class CupertinoHomeScaffold extends StatelessWidget {
  const CupertinoHomeScaffold({
    Key key,
    @required this.currentTab,
    @required this.onSelectTab,
    @required this.widgetBuilders,
    @required this.navigatorKeys,
  }) : super(key: key);

  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;
  final Map<TabItem, WidgetBuilder> widgetBuilders;
  final Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys;

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: AppColors.primaryBackground,
        iconSize: 35.0,
        items: [
          _buildItem(TabItem.home),
          _buildItem(TabItem.messages),
          _buildItem(TabItem.notifications),
          _buildItem(TabItem.profiles),
        ],
        onTap: (index) => onSelectTab(TabItem.values[index]),
      ),
      tabBuilder: (context, index) {
        final item = TabItem.values[index];
        return CupertinoTabView(
          navigatorKey: navigatorKeys[item],
          builder: (context) => widgetBuilders[item](context),
        );
      },
    );
  }

  BottomNavigationBarItem _buildItem(TabItem tabItem) {
    final itemData = TabItemData.allTabs[tabItem];
    final color = currentTab == tabItem
        ? AppColors.primaryText
        : AppColors.primaryElement;

    return BottomNavigationBarItem(
      icon: currentTab == tabItem
          ? LinearGradientMask(
              child: Icon(
                itemData.icon,
                color: color,
              ),
            )
          : Icon(
              itemData.icon,
              color: color,
            ),
      title: currentTab == tabItem
          ? LinearGradientMask(
              child: Text(
                itemData.title,
                style: TextStyle(color: color),
              ),
            )
          : Text(
              itemData.title,
              style: TextStyle(color: color),
            ),
    );
  }
}
