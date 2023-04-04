import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shlop/constants/colors.dart';
import 'package:shlop/constants/textStyling.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late ScrollController _scrollController;
  var _showBackToTopButton = false;

  scrollToTop() {
    _scrollController.animateTo(0,
        duration: Duration(seconds: 2), curve: Curves.easeIn);
  }

  @override
  void initState() {
    // TODO: implement initState
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          if (_scrollController.offset >= 400) {
            _showBackToTopButton = true;
          } else {
            _showBackToTopButton = false;
          }
        });
      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: blackDark,
        floatingActionButton: _showBackToTopButton == true
            ? InkWell(
                onTap: () {
                  scrollToTop();
                },
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: 88.0,
                  ),
                  width: 65.0,
                  height: 65.0,
                  decoration: BoxDecoration(
                    color: creamLight,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_upward,
                        size: 24.0,
                        color: blackDark,
                      ),
                    ],
                  ),
                ),
              )
            : Container(),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                CustomScrollView(
                  controller: _scrollController,
                  physics: BouncingScrollPhysics(),
                  slivers: [
                    SliverAppBar(
                      floating: true,
                      elevation: 0.0,
                      centerTitle: true,
                      backgroundColor: blackDark,
                      automaticallyImplyLeading: false,
                      title: Text(
                        "My Lists",
                        style: hSplashTitle,
                      ),
                      leading: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add,
                          color: creamLight,
                          size: 30.0,
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate([
                        SizedBox(height: 10.0),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20.0),
                          child: CupertinoTextField(
                            padding: EdgeInsets.only(
                              left: 10.0,
                              right: 15.0,
                              top: 10.0,
                              bottom: 10.0,
                            ),
                            decoration: BoxDecoration(
                              color: darkLighter,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            placeholder: "Search",
                            placeholderStyle: hPlaceholderText,
                            style: hNormalText,
                            prefix: Padding(
                              padding: EdgeInsets.only(
                                left: 10.0,
                              ),
                              child: Icon(
                                Icons.search,
                                size: 20.0,
                                color: creamLight,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        ListTab(
                          listTitle: "Car parts",
                          tickedItems: 8,
                          totalItems: 10,
                        ),
                        ListTab(
                          listTitle: "Groceries",
                          tickedItems: 5,
                          totalItems: 10,
                        ),
                        ListTab(
                          listTitle: "Farm supplies",
                          tickedItems: 2,
                          totalItems: 10,
                        ),
                        SizedBox(height: 90.0),
                      ]),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 85.0,
                    width: double.infinity,
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: darkLighter,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                top: 5.0,
                                bottom: 5.0,
                                left: 15.0,
                                right: 15.0,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: creamLight.withOpacity(0.2),
                              ),
                              child: Icon(
                                Icons.menu,
                                size: 26.0,
                                color: creamLight,
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Text("Lists", style: hSubtitleText),
                          ],
                        ),
                        SizedBox(width: 120.0),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                left: 15.0,
                                top: 5.0,
                                bottom: 5.0,
                                right: 15.0,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.transparent,
                              ),
                              child: Icon(
                                Icons.settings,
                                size: 26.0,
                                color: creamLight,
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Text("Settings", style: hSubtitleText),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ListTab extends StatelessWidget {
  final String listTitle;
  final int tickedItems;
  final int totalItems;

  ListTab({
    required this.listTitle,
    required this.tickedItems,
    required this.totalItems,
  });

  calculateLength(totalWidth) {
    var tickedItemsPercentage = tickedItems / totalItems * 100;
    var tickedBarLength = tickedItemsPercentage / 100 * totalWidth;
    return tickedBarLength;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        bottom: 15.0,
      ),
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: darkLighter,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(listTitle, style: hBoldTitle),
              Icon(
                CupertinoIcons.ellipsis_vertical,
                size: 20.0,
                color: creamLight,
              ),
            ],
          ),
          SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 120,
                decoration: BoxDecoration(
                  color: creamLight.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                height: 10.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: calculateLength(
                          MediaQuery.of(context).size.width - 120),
                      decoration: BoxDecoration(
                        color: creamLight,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      height: 10.0,
                    ),
                  ],
                ),
              ),
              Text("$tickedItems/$totalItems", style: hSubtitleText),
            ],
          ),
        ],
      ),
    );
  }
}
