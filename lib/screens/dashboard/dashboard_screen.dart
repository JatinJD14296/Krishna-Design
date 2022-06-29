import 'package:flutter/material.dart';
import 'package:krishna_design/common/widgets/icon_and_images.dart';
import 'package:krishna_design/screens/home_page/home_screen.dart';
import 'package:krishna_design/utils/colors.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  final List<Widget> _pageList = [
    const HomeScreen(),
    Container(
      height: 100,
      width: 100,
      color: Colors.green,
    ),
    Container(
      height: 100,
      width: 100,
      color: Colors.blueAccent,
    ),
  ];

  Widget tab() => Tab(
        text: 'Home',
        icon: icons(icon: Icons.home),
      );

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: _pageList,
      ),
      bottomNavigationBar: TabBar(
        controller: _tabController,
        tabs: <Widget>[
          tab(),
          tab(),
          tab(),
        ],
        indicatorColor: transparent,
        labelColor: darkTextColor,
        unselectedLabelColor: primaryColor,
      ),
    );
  }
}
