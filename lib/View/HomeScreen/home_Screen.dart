import 'package:demo/View/HomeScreen/news_details_screen.dart';
import 'package:demo/ViewModel/get_news_view_model.dart';
import 'package:demo/apiModel/api_services/api_response.dart';
import 'package:demo/apiModel/model/ResponseModel/get_news_response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  GetNewsViewModel _getNewsViewModel = Get.put(GetNewsViewModel());
  TabController? _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 13, vsync: this);
    _getNewsViewModel.getAllSportTypeViewModel(type: 'all');

    super.initState();
  }

  getAll() async {}
  int sel = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              color: Colors.white,
              width: Get.width,
              child: TabBar(
                onTap: (val) {
                  setState(() {});
                  if (val == 1) {
                    _getNewsViewModel.getAllSportTypeViewModel(
                        type: 'national');
                  } else if (val == 2) {
                    _getNewsViewModel.getAllSportTypeViewModel(
                        type: 'business');
                  } else if (val == 3) {
                    _getNewsViewModel.getAllSportTypeViewModel(type: 'sport');
                  } else if (val == 4) {
                    _getNewsViewModel.getAllSportTypeViewModel(type: 'world');
                  } else if (val == 5) {
                    _getNewsViewModel.getAllSportTypeViewModel(
                        type: 'politics');
                  } else if (val == 6) {
                    _getNewsViewModel.getAllSportTypeViewModel(
                        type: 'technology');
                  } else if (val == 7) {
                    _getNewsViewModel.getAllSportTypeViewModel(type: 'startup');
                  } else if (val == 8) {
                    _getNewsViewModel.getAllSportTypeViewModel(
                        type: 'entertainment');
                  } else if (val == 9) {
                    _getNewsViewModel.getAllSportTypeViewModel(
                        type: 'miscellaneous');
                  } else if (val == 10) {
                    _getNewsViewModel.getAllSportTypeViewModel(type: 'hatke');
                  } else if (val == 11) {
                    _getNewsViewModel.getAllSportTypeViewModel(type: 'science');
                  } else if (val == 12) {
                    _getNewsViewModel.getAllSportTypeViewModel(
                        type: 'automobile');
                  } else {
                    _getNewsViewModel.getAllSportTypeViewModel(type: 'all');
                  }
                },
                unselectedLabelColor: Colors.black,
                labelColor: Colors.white,
                indicatorColor: Color(0xFF828282),
                controller: _tabController,
                indicator: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(8)),
                isScrollable: true,
                tabs: [
                  Tab(
                    text: "all",
                  ),
                  Tab(
                    text: "national",
                  ),
                  Tab(
                    text: "business",
                  ),
                  Tab(
                    text: "sport",
                  ),
                  Tab(
                    text: "world",
                  ),
                  Tab(
                    text: "politics",
                  ),
                  Tab(
                    text: "technology",
                  ),
                  Tab(
                    text: "startup",
                  ),
                  Tab(
                    text: "entertainment",
                  ),
                  Tab(
                    text: "miscellaneous",
                  ),
                  Tab(
                    text: "hatke",
                  ),
                  Tab(
                    text: "science",
                  ),
                  Tab(
                    text: "automobile",
                  ),
                ],
              ),
            ),
            Expanded(
              child: GetBuilder<GetNewsViewModel>(
                builder: (controller) {
                  if (controller.getNewsApiResponse.status == Status.COMPLETE) {
                    GetNewsResponseModel data =
                        controller.getNewsApiResponse.data;
                    print('dfdfdf==${data.data![0].title}');
                    return TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: _tabController,
                      children: [
                        ...List.generate(
                            13,
                            (index) => ListView.builder(
                                  itemCount: data.data!.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index1) {
                                    return GestureDetector(
                                      onTap: () {
                                        Get.to(NewsDetailsScreen(
                                          title: '${data.data![index1].title}',
                                          content:
                                              '${data.data![index1].content}',
                                          time: '${data.data![index1].time}',
                                          imageUrl:
                                              '${data.data![index1].imageUrl}',
                                          readMoreUrl:
                                              '${data.data![index1].readMoreUrl}',
                                        ));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          child: Row(
                                            children: [
                                              Container(
                                                height: Get.height * 0.10,
                                                width: Get.height * 0.10,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Image.network(
                                                    '${data.data![index1].imageUrl}',
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Flexible(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '${data.data![index1].title}',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          overflow: TextOverflow
                                                              .ellipsis),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      '${data.data![index1].author}',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          overflow: TextOverflow
                                                              .ellipsis),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      '${data.data![index1].time}',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          overflow: TextOverflow
                                                              .ellipsis),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                )),
                      ],
                    );
                  } else {
                    if (controller.getNewsApiResponse.status == Status.ERROR) {
                      return Center(
                        child: Text('Something Went Wrong'),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
