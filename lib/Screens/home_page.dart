import 'dart:convert';
import 'package:ebook_with_audio_player/Consts/app_colors.dart';
import 'package:ebook_with_audio_player/Screens/app_taps.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  ScrollController? _scrollController;
  TabController? _tabController;
  List? popularBooks;
  List? books;
  List? trendingBooks;
  List? newBooks;
  readData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/popularBooks.json")
        .then((s) {
      setState(() {
        popularBooks = json.decode(s);
      });
    });
    await DefaultAssetBundle.of(context)
        .loadString("json/books.json")
        .then((s) {
      setState(() {
        books = json.decode(s);
      });
    });

    await DefaultAssetBundle.of(context)
        .loadString("json/trendingBooks.json")
        .then((s) {
      setState(() {
        trendingBooks = json.decode(s);
      });
    });

    await DefaultAssetBundle.of(context)
        .loadString("json/newBooks.json")
        .then((s) {
      setState(() {
        newBooks = json.decode(s);
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    _tabController = TabController(length: 3, vsync: this);
    readData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: AppColor.appBackground,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ImageIcon(
                      AssetImage('assets/imgs/menu.png'),
                      size: 24,
                      color: Colors.black,
                    ),
                    Row(
                      children: [
                        Icon(Icons.search),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.notifications),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      'NEW Books',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              //--------------------------------making  view list of NEW Books------------------------------------------------------
              Container(
                height: 180,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: -20,
                      right: 0,
                      child: Container(
                        height: 180,
                        child: PageView.builder(
                            controller: PageController(viewportFraction: 0.8),
                            itemCount: newBooks == null ? 0 : newBooks!.length,
                            itemBuilder: (_, i) {
                              return Container(
                                height: 180,
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      image: AssetImage(newBooks![i]["img"]),
                                    )),
                              );
                            }),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: NestedScrollView(
                      controller: _scrollController,
                      headerSliverBuilder:
                          (BuildContext context, bool isScroll) {
                        return [
                          SliverAppBar(
                            pinned: true,
                            backgroundColor: AppColor.silverBackground,
                            bottom: PreferredSize(
                              child: Container(
                                margin: EdgeInsets.only(bottom: 10, left: 10),
                                child: TabBar(
                                    indicatorPadding: EdgeInsets.all(0),
                                    indicatorSize: TabBarIndicatorSize.label,
                                    labelPadding: EdgeInsets.only(right: 5),
                                    controller: _tabController,
                                    isScrollable: true,
                                    indicator: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            blurRadius: 7,
                                            offset: Offset(0, 0),
                                          )
                                        ]),
                                    //------------------------Setting our Books Taps--------------------------
                                    tabs: [
                                      MyAppTabs(
                                        color: AppColor.menu1Color,
                                        text: 'New',
                                      ),
                                      MyAppTabs(
                                        color: AppColor.menu2Color,
                                        text: 'Popular',
                                      ),
                                      MyAppTabs(
                                        color: AppColor.menu3Color,
                                        text: 'Trending',
                                      ),
                                    ]),
                              ),
                              preferredSize: Size.fromHeight(50),
                            ),
                          )
                        ];
                      },
                      body: TabBarView(controller: _tabController, children: [
                        myNewListViewBuilder(),
                        myPopularListViewBuilder(),
                        myTrendingListViewBuilder(),
                        // myMaterialWidget('content3'),
                      ])))
            ],
          ),
        ),
      ),
    );
  }

//-------------------------putting  data of the popular books-----------------------
  Widget myPopularListViewBuilder() {
    return ListView.builder(
        itemCount: books == null ? 0 : books!.length,
        itemBuilder: (_, i) {
          return Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.tabVarViewColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 2,
                        offset: Offset(0, 0),
                      )
                    ]),
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Container(
                          width: 90,
                          height: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage(books![i]['img']),
                              ))),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: 20,
                                color: AppColor.starColor,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                books![i]['rating'],
                                style: TextStyle(
                                  color: AppColor.menu2Color,
                                ),
                              )
                            ],
                          ),
                          Text(
                            books![i]['title'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            books![i]['text'],
                            style: TextStyle(color: AppColor.subTitleText),
                          ),
                          Container(
                            width: 60,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppColor.menu3Color,
                            ),
                            child: Text(
                              'Love',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.silverBackground),
                            ),
                            alignment: Alignment.center,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ));
        });
  }

//--------------------------putting  data of the New books--------------------------
  Widget myNewListViewBuilder() {
    return ListView.builder(
        itemCount: newBooks == null ? 0 : newBooks!.length,
        itemBuilder: (_, i) {
          return Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.tabVarViewColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 2,
                        offset: Offset(0, 0),
                      )
                    ]),
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Container(
                          width: 90,
                          height: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage(newBooks![i]['img']),
                              ))),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: 20,
                                color: AppColor.starColor,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                newBooks![i]['rating'],
                                style: TextStyle(
                                  color: AppColor.menu2Color,
                                ),
                              )
                            ],
                          ),
                          Text(
                            newBooks![i]['title'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            newBooks![i]['text'],
                            style: TextStyle(color: AppColor.subTitleText),
                          ),
                          Container(
                            width: 60,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppColor.menu3Color,
                            ),
                            child: Text(
                              'Love',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.silverBackground),
                            ),
                            alignment: Alignment.center,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ));
        });
  }

//---------------------------putting  data of the trending books--------------------
  Widget myTrendingListViewBuilder() {
    return ListView.builder(
        itemCount: trendingBooks == null ? 0 : trendingBooks!.length,
        itemBuilder: (_, i) {
          return Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.tabVarViewColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 2,
                        offset: Offset(0, 0),
                      )
                    ]),
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Container(
                          width: 90,
                          height: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage(trendingBooks![i]['img']),
                              ))),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: 20,
                                color: AppColor.starColor,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                trendingBooks![i]['rating'],
                                style: TextStyle(
                                  color: AppColor.menu2Color,
                                ),
                              )
                            ],
                          ),
                          Text(
                            trendingBooks![i]['title'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            trendingBooks![i]['text'],
                            style: TextStyle(color: AppColor.subTitleText),
                          ),
                          Container(
                            width: 60,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppColor.menu3Color,
                            ),
                            child: Text(
                              'Love',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.silverBackground),
                            ),
                            alignment: Alignment.center,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ));
        });
  }
}
