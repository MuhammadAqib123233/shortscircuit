import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shortscircuit/controllers/PageRouteController.dart';
import 'package:shortscircuit/controllers/SearchController.dart';
import 'package:shortscircuit/views/screens/FavScreen.dart';
import 'package:shortscircuit/views/screens/FoodCategory.dart';
import 'package:shortscircuit/views/screens/Nearme.dart';
import 'package:shortscircuit/views/screens/SearchPage.dart';
import 'package:shortscircuit/views/utills/Colors.dart';
import 'package:shortscircuit/views/widgets/SuggestionTile.dart';

import 'Homepage.dart';

class PageRouter extends StatefulWidget {
  PageRouter({super.key});

  @override
  State<PageRouter> createState() => _PageRouterState();
}

class _PageRouterState extends State<PageRouter> {
  bool isSearch = false;

  bool isSearchvisible = false;

  //  final PageController _controller = PageController();
  final PageRouteController _controller = Get.put(PageRouteController());
   ScrollController _scrollController = new ScrollController();
    @override
  void initState() {
    super.initState();

    // Attach the scroll controller to the SingleChildScrollView
    _scrollController.addListener(() {
      // Do nothing for now, just listening to scroll events
    });
  }
  final List<Widget> _screens = [
    HomePage(screenIndex: 0),
    FavScreen(screenIndex: 1),
    Nearme(),
    FoodCategory(),
    // Add more screens
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: NestedScrollView(
        controller: _scrollController,
      floatHeaderSlivers: true,
      headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [SliverAppBar(
                    pinned: true,
                    floating: true,
                    snap: true,
                     elevation: 0,
                  leading: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Image.asset("assets/images/logo.png"),
                        ),
                         InkWell(
                          onTap: (){
                            _controller.changePage(2);
                            setState(() {});
                            print(_controller.selectedIndex.value);
                          },
                          child: _controller.selectedIndex.value == 2 ? Row(children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10,),
                              child: Text("Near me",
                              style: GoogleFonts.plusJakartaSans(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff0094FF),
                                    ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, right: 16),
                              child: SvgPicture.asset("assets/icons/send.svg", color: Color(0xff0094FF),),
                            )
                          ],) : Row(children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10,),
                              child: Text("Near me",
                              style: GoogleFonts.plusJakartaSans(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, right: 16),
                              child: SvgPicture.asset("assets/icons/send.svg"),
                            )
                          ],),
                        )
                      ],
                    ),
                  ),
                  leadingWidth: MediaQuery.of(context).size.width,
                  backgroundColor: AppColors().primaryColor,
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(100.0), // Set the preferred size for the input field area
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20), // Adjust padding as needed
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: GetBuilder<Search_Controller>(
                            init: Search_Controller(),
                            builder: (controller){
                              return TextFormField(
                                onTap: () {
                                  isSearch = !controller.isSearch;
                                  setState(() {});
                                  _scrollController.jumpTo(0);
                                  controller.showHistory();
                                },
                                style: GoogleFonts.plusJakartaSans(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff000000).withOpacity(0.4),
                                  ),
                                   decoration: InputDecoration(
                                          hintText: 'Search circuits by City or landmark', // Placeholder text
                                          hintStyle: GoogleFonts.plusJakartaSans(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff000000).withOpacity(0.4),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                          suffixIcon: Padding(
                                             padding: const EdgeInsets.symmetric(horizontal: 20),
                                            child: SvgPicture.asset(
                            "assets/icons/search.svg",
                            color: Color(0xff000000).withOpacity(0.5),
                            width: 25,
                            height: 25,
                          ),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none
                                          )
                                        ),
                                  );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  )];
                },
       body: Stack(
          children: [
            Obx(() => _screens[_controller.selectedIndex.value]),
            AnimatedContainer(
               duration: Duration(milliseconds: 500),
              margin: EdgeInsets.only(bottom: isSearch ? 0 : MediaQuery.of(context).size.height,),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: AppColors().primaryColor
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 300,
                        child: ListView(
                          children: [
                            InkWell(
                              onTap: (){
                                _screens.insert(_screens.length ,SearchPage(searchResults: "Bangkok (City)"));
                                _controller.changePage(_screens.length - 1);
                                isSearch = false;
                                //print(_controller.selectedIndex.value);
                                 setState(() {});
                                //Get.to(transition: Transition.zoom, duration: Duration(milliseconds: 500),()=>SearchPage(searchResults: "Bangkok", isSearch: false,));
                              },
                              child: SuggestionTile(suggestionTitle: "Bangkok (City)",)
                              ),
                            InkWell(
                              onTap: (){
                                _screens.insert(_screens.length ,SearchPage(searchResults: "Baltimore (City)"));
                                _controller.changePage(_screens.length - 1);
                                isSearch = false;
                                //print(_controller.selectedIndex.value);
                                 setState(() {});
                              },
                              child: SuggestionTile(suggestionTitle: "Baltimore (City)")),
                            InkWell(
                              onTap: (){
                                _screens.insert(_screens.length ,SearchPage(searchResults: "Baku (City)"));
                                _controller.changePage(_screens.length - 1);
                                isSearch = false;
                                //print(_controller.selectedIndex.value);
                                 setState(() {});
                              },
                              child: SuggestionTile(suggestionTitle: "Baku (City)")),
                            InkWell(
                              onTap: (){
                                _screens.insert(_screens.length ,SearchPage(searchResults: "Bartan Superdrome (Landmark)"));
                                _controller.changePage(_screens.length - 1);
                                isSearch = false;
                                //print(_controller.selectedIndex.value);
                                 setState(() {});
                              },
                              child: SuggestionTile(suggestionTitle: "Bartan Superdrome (Landmark)"))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Text(
                                "Recent Searches",
                                style: GoogleFonts.plusJakartaSans(
                                   fontSize: 16,
                                   fontWeight: FontWeight.w700,
                                   color: Colors.white,
                                   decoration: TextDecoration.none
                                 ),
                              ),
                      ),
                      //  Container(
                      //   height: 300,
                      //   child: ListView(
                      //     children: [
                      //       SuggestionTile(suggestionTitle: "Night markets of Shanghai"),
                      //     ],
                      //   ),
                      //              ),
                       Container(
                        width: MediaQuery.of(context).size.height,
                        child: SuggestionTile(suggestionTitle: "Night markets of Shanghai")),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
    ),
    bottomNavigationBar: isSearch == true ? BottomAppBar() : BottomNavigationBar(
      showSelectedLabels: false,
          showUnselectedLabels: false,
        elevation: 0,
      //currentIndex: _controller.selectedIndex.value, // You need to define and update _selectedIndex
      onTap:(index) {
         _controller.changePage(index);
         setState(() {});
         _scrollController.jumpTo(0.0);
      }, // You need to define the onTap function
      items: [
      BottomNavigationBarItem(
        icon: Container(
          alignment: Alignment.center,
          child: CircleAvatar(
            radius: 25,
            child: Center(
              child: SvgPicture.asset(
                "assets/icons/Home.svg",
                width: 30,
                color:  _controller.selectedIndex.value == 0 ? Colors.white : Colors.black,
              ),
            ),
            backgroundColor:  _controller.selectedIndex.value == 0 ? AppColors().primaryColor : Colors.transparent,
          ),
        ),
        label: 'Home', // Optional label for accessibility
      ),
      BottomNavigationBarItem(
        icon: CircleAvatar(
          radius: 25,
          child: Center(
            child: SvgPicture.asset("assets/icons/location.svg",  color:  _controller.selectedIndex.value == 1 ? Colors.white : Colors.black,),
          ),
          backgroundColor: _controller.selectedIndex.value == 1 ? AppColors().primaryColor : Colors.transparent,
        ),
        label: 'Favorites', // Optional label for accessibility
      ),
      BottomNavigationBarItem(
        icon: CircleAvatar(
          radius: 25,
          child: Center(
            child: SvgPicture.asset("assets/icons/ai.svg", color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
        ),
        label: 'AI', // Optional label for accessibility
      ),
      BottomNavigationBarItem(
        icon: CircleAvatar(
          radius: 25,
          child: Center(
            child: SvgPicture.asset("assets/icons/settings.svg", color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
        ),
        label: 'Settings', // Optional label for accessibility
      ),
      ],
    ),
    );
  }
}