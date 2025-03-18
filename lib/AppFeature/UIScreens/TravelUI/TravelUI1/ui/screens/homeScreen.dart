import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:octo_image/octo_image.dart';
import 'package:flutter_ui/AppFeature/Constant/AppKitProConstant.dart';
import 'package:flutter_ui/AppFeature/UIScreens/TravelUI/TravelUI1/models/country.dart';
import 'package:flutter_ui/AppFeature/UIScreens/TravelUI/TravelUI1/models/placeDetails.dart';
import 'package:flutter_ui/AppFeature/UIScreens/TravelUI/TravelUI1/utils/convertNumber.dart';
// First install video_player package by adding to pubspec.yaml:
// video_player: ^2.7.0
import 'package:video_player/video_player.dart';

final String placeDummyDetails =
    "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.";

final List<Country> countries = [
  Country(
    name: "Indonesia",
    places: [
      PlaceDetails(
        country: "Indonesia",
        name: "Jakarta",
        videoPath: "assets/travelUI/videos/01.mp4",
        localimagePath: "assets/travelUI/images/01.jpg",
        imagePath:
            "https://firebasestorage.googleapis.com/v0/b/flutter_ui-8e62c.appspot.com/o/travelui%2F01.jpg?alt=media&token=df3961da-b882-4d6f-a763-9eb1184b059e",
        blurUrl: "LLDAb:wP%G%L_LkVM|WADitPS\$M{",
        details: placeDummyDetails,
        address: "Jakarta Pusat, Jakarta",
        cost: "\$250",
        distance: "250 KM",
        duration: "5 hrs",
        review: "4.9",
        temperature: "21 C",
      ),
      PlaceDetails(
        country: "Indonesia",
        name: "Monas",
        videoPath: "assets/travelUI/videos/02.mp4",
        localimagePath: "assets/travelUI/images/02.jpg",
        imagePath:
            "https://firebasestorage.googleapis.com/v0/b/flutter_ui-8e62c.appspot.com/o/travelui%2F02.jpg?alt=media&token=c783d77a-d0b9-45cf-995b-bd049bda78f9",
        blurUrl: "L48N@2?r9[RV}]nmX4n,HvIVn2%1",
        details: placeDummyDetails,
        address: "Jakarta Pusat, Jakarta",
        cost: "\$250",
        distance: "250 KM",
        duration: "5 hrs",
        review: "4.9",
        temperature: "21 C",
      ),
      PlaceDetails(
        country: "Indonesia",
        name: "Ragunan",
        videoPath: "assets/travelUI/videos/03.mp4",
        localimagePath: "assets/travelUI/images/03.jpg",
        imagePath:
            "https://firebasestorage.googleapis.com/v0/b/flutter_ui-8e62c.appspot.com/o/travelui%2F03.jpg?alt=media&token=9a14b1c7-5a81-4e6e-933c-474bf1336b23",
        blurUrl: "L397%*s7~d-p05049JbD00~n%\$D*",
        details: placeDummyDetails,
        address: "Jakarta Pusat, Jakarta",
        cost: "\$250",
        distance: "250 KM",
        duration: "5 hrs",
        review: "4.9",
        temperature: "21 C",
      ),
    ],
  ),
  Country(
    name: "New Zealand",
    places: [
      PlaceDetails(
        country: "New Zealand",
        name: "Auckland Zoo",
        videoPath: "assets/travelUI/videos/02.mp4",
        localimagePath: "assets/travelUI/images/02.jpg",
        imagePath:
            "https://firebasestorage.googleapis.com/v0/b/flutter_ui-8e62c.appspot.com/o/travelui%2F02.jpg?alt=media&token=c783d77a-d0b9-45cf-995b-bd049bda78f9",
        blurUrl: "L48N@2?r9[RV}]nmX4n,HvIVn2%1",
        details: placeDummyDetails,
        address: "Jakarta Pusat, Jakarta",
        cost: "\$250",
        distance: "250 KM",
        duration: "5 hrs",
        review: "4.9",
        temperature: "21 C",
      ),
      PlaceDetails(
        country: "New Zealand",
        name: "Wellington Zoo",
        videoPath: "assets/travelUI/videos/03.mp4",
        localimagePath: "assets/travelUI/images/03.jpg",
        imagePath:
            "https://firebasestorage.googleapis.com/v0/b/flutter_ui-8e62c.appspot.com/o/travelui%2F03.jpg?alt=media&token=9a14b1c7-5a81-4e6e-933c-474bf1336b23",
        blurUrl: "L397%*s7~d-p05049JbD00~n%\$D*",
        details: placeDummyDetails,
        address: "Jakarta Pusat, Jakarta",
        cost: "\$250",
        distance: "250 KM",
        duration: "5 hrs",
        review: "4.9",
        temperature: "21 C",
      ),
    ],
  ),
  Country(
    name: "UK",
    places: [
      PlaceDetails(
        country: "UK",
        name: "London Sanctuary",
        videoPath: "assets/travelUI/videos/03.mp4",
        localimagePath: "assets/travelUI/images/03.jpg",
        imagePath:
            "https://firebasestorage.googleapis.com/v0/b/flutter_ui-8e62c.appspot.com/o/travelui%2F03.jpg?alt=media&token=9a14b1c7-5a81-4e6e-933c-474bf1336b23",
        blurUrl: "L397%*s7~d-p05049JbD00~n%\$D*",
        details: placeDummyDetails,
        address: "Jakarta Pusat, Jakarta",
        cost: "\$250",
        distance: "250 KM",
        duration: "5 hrs",
        review: "4.9",
        temperature: "21 C",
      ),
      PlaceDetails(
        country: "UK",
        name: "Dublin Sanctuary",
        videoPath: "assets/travelUI/videos/04.mp4",
        localimagePath: "assets/travelUI/images/04.jpg",
        imagePath:
            "https://firebasestorage.googleapis.com/v0/b/flutter_ui-8e62c.appspot.com/o/travelui%2F04.jpg?alt=media&token=3b9eba7a-1cad-4b70-a408-af514fe0cd12",
        blurUrl: "L7E:myDXI@EO*Co_Rlaf9_X5?ART",
        details: placeDummyDetails,
        address: "Jakarta Pusat, Jakarta",
        cost: "\$250",
        distance: "250 KM",
        duration: "5 hrs",
        review: "4.9",
        temperature: "21 C",
      ),
      PlaceDetails(
        country: "UK",
        name: "Liverpool Sanctuary",
        videoPath: "assets/travelUI/videos/05.mp4",
        localimagePath: "assets/travelUI/images/05.jpg",
        imagePath:
            "https://firebasestorage.googleapis.com/v0/b/flutter_ui-8e62c.appspot.com/o/travelui%2F05.jpg?alt=media&token=94be4023-ef90-4f35-b72f-212897e5e78d",
        blurUrl: "LQHLx7Xg_Mx[?dMf-pxuNG%Mj=t8",
        details: placeDummyDetails,
        address: "Jakarta Pusat, Jakarta",
        cost: "\$250",
        distance: "250 KM",
        duration: "5 hrs",
        review: "4.9",
        temperature: "21 C",
      ),
    ],
  ),
  Country(
    name: "Canada",
    places: [
      PlaceDetails(
        country: "Canada",
        name: "Montreal Sanctuary",
        videoPath: "assets/travelUI/videos/04.mp4",
        localimagePath: "assets/travelUI/images/04.jpg",
        imagePath:
            "https://firebasestorage.googleapis.com/v0/b/flutter_ui-8e62c.appspot.com/o/travelui%2F04.jpg?alt=media&token=3b9eba7a-1cad-4b70-a408-af514fe0cd12",
        blurUrl: "L7E:myDXI@EO*Co_Rlaf9_X5?ART",
        details: placeDummyDetails,
        address: "Jakarta Pusat, Jakarta",
        cost: "\$250",
        distance: "250 KM",
        duration: "5 hrs",
        review: "4.9",
        temperature: "21 C",
      ),
      PlaceDetails(
        country: "Canada",
        name: "Torrento Sanctuary",
        videoPath: "assets/travelUI/videos/05.mp4",
        localimagePath: "assets/travelUI/images/05.jpg",
        imagePath:
            "https://firebasestorage.googleapis.com/v0/b/flutter_ui-8e62c.appspot.com/o/travelui%2F05.jpg?alt=media&token=94be4023-ef90-4f35-b72f-212897e5e78d",
        blurUrl: "LQHLx7Xg_Mx[?dMf-pxuNG%Mj=t8",
        details: placeDummyDetails,
        address: "Jakarta Pusat, Jakarta",
        cost: "\$250",
        distance: "250 KM",
        duration: "5 hrs",
        review: "4.9",
        temperature: "21 C",
      ),
    ],
  ),
  Country(
    name: "Sri Lanka",
    places: [
      PlaceDetails(
        country: "Sri Lanka",
        name: "Colombo Zoo",
        videoPath: "assets/travelUI/videos/05.mp4",
        localimagePath: "assets/travelUI/images/05.jpg",
        imagePath:
            "https://firebasestorage.googleapis.com/v0/b/flutter_ui-8e62c.appspot.com/o/travelui%2F05.jpg?alt=media&token=94be4023-ef90-4f35-b72f-212897e5e78d",
        blurUrl: "LQHLx7Xg_Mx[?dMf-pxuNG%Mj=t8",
        details: placeDummyDetails,
        address: "Jakarta Pusat, Jakarta",
        cost: "\$250",
        distance: "250 KM",
        duration: "5 hrs",
        review: "4.9",
        temperature: "21 C",
      ),
      PlaceDetails(
        country: "Sri Lanka",
        name: "Galle Sanctuary",
        videoPath: "assets/travelUI/videos/01.mp4",
        localimagePath: "assets/travelUI/images/01.jpg",
        imagePath:
            "https://firebasestorage.googleapis.com/v0/b/flutter_ui-8e62c.appspot.com/o/travelui%2F01.jpg?alt=media&token=df3961da-b882-4d6f-a763-9eb1184b059e",
        blurUrl: "LLDAb:wP%G%L_LkVM|WADitPS\$M{",
        details: placeDummyDetails,
        address: "Jakarta Pusat, Jakarta",
        cost: "\$250",
        distance: "250 KM",
        duration: "5 hrs",
        review: "4.9",
        temperature: "21 C",
      ),
    ],
  ),
];

//height of video container widget, whiteLayerContainer and topVideoLayerContainer
final videoContainerHeightPercentage = 0.625;
//
final videoContainerDetailsHeightPercentage = 0.9;
//
final double videoContainerTextBottomPadding = 20.0;

//
final double placeNameLeftPadding = 30.0;

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  //it will
  List<GlobalKey<_VideoContainerState>> _videoPlayerKeys = [];

  //to display video in pageView
  List<VideoPlayerController?> _videoControllers = [];

  //to display video in pageView
  List<GlobalKey> _coutnryNameKeys = [];

  //to track which place user visited of given country
  //storing placeDetails index
  List<int> currentCountryPlaceIndexs = [];

  PageController? _pageController;

  //index of current country(place) in pageview
  int currentCountryIndex = 0;

  //currently index of place to show in details
  int detailsCountryPlaceIndex = -1;

  //controller for top layer video contianer
  VideoPlayerController? _videoPlayerController;

  //enable touch on top white and video layer
  bool enableTouchOnTopLayer = false;

  //to show whiteBottom layer
  bool showWhiteLayer = true;

  //to animate country name list
  late AnimationController countriesNameAnimationController;
  late Tween<double> countriesNamePositionTween;
  Animation<double>? countriesNamePositionAnimation;

  //to animate topVideoLayerContainer
  late AnimationController _animationController;

  //to animate topWhiteLayer
  late AnimationController _whiteLayerAnimationController;

  late AnimationController _placeDetailsOpacityAnimationController;

  //late Animation<double> _placeDetailsOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _placeDetailsOpacityAnimationController, curve: Curves.easeInOut));

  //to animate topWhiteLayer
  late AnimationController _placeStoryViewAnimationController;

  late Animation<double> _placeStoryViewAnimation;

  late Animation<double> _whiteLayerOpacityUpAnimation;
  late Animation<double> _translateWhiteLayerAnimation;
  late Animation<double> _whiteLayerOpacityDownAnimation;

  //topVideoLayer animation
  late Animation<double> _translateTopVideoLayerAnimation;
  late Animation<double> _topVideoLayerPlaceDetailsOpacityAnimation; //0.0,0.3
  late Animation<double> _topVideoLayerCountryOpacityAnimation;

  late Animation<double> _topVideoLayerTextAlignmentX;
  late Animation<double> _topVideoLayerTextAlignmentY;

  //button background animations
  late Animation<double> _buttonBackgroundContainerAnimation;

  @override
  void initState() {
    _pageController = PageController(viewportFraction: 0.825);
    //to animate country name list
    countriesNameAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    countriesNamePositionTween = Tween(begin: 0.0, end: 0.0);
    countriesNamePositionAnimation = countriesNamePositionTween.animate(
      CurvedAnimation(
        parent: countriesNameAnimationController,
        curve: Curves.easeInOut,
      ),
    );
    //to animate topWhiteLayer
    _whiteLayerAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1150),
    )..addListener(addWhiteLayerAnimationControllerListener);

    _whiteLayerOpacityUpAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _whiteLayerAnimationController,
        curve: Interval(0.0, 0.15, curve: Curves.easeInOutExpo),
      ),
    );
    _translateWhiteLayerAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _whiteLayerAnimationController,
        curve: Interval(0.15, 0.85, curve: Curves.easeInOutExpo),
      ),
    );
    _whiteLayerOpacityDownAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _whiteLayerAnimationController,
        curve: Interval(0.85, 1.0, curve: Curves.easeInOut),
      ),
    );

    //to animate topVideoLayerContainer
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1000))
          ..addListener(addAnimationListener)
          ..addStatusListener(addAnimationStatusListener);

    _placeDetailsOpacityAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    //late Animation<double> _placeDetailsOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _placeDetailsOpacityAnimationController, curve: Curves.easeInOut));

    //to animate topWhiteLayer
    _placeStoryViewAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _placeStoryViewAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _placeStoryViewAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    _translateTopVideoLayerAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.15, 1.0, curve: Curves.easeInOutExpo),
      ),
    );
    _topVideoLayerPlaceDetailsOpacityAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.3, curve: Curves.easeInOutQuart),
      ),
    ); //0.0,0.3
    _topVideoLayerCountryOpacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.6, 1.0, curve: Curves.easeInOutQuart),
      ),
    );

    _topVideoLayerTextAlignmentX = Tween<double>(begin: 1.0, end: 0.1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.5, 1.0, curve: Curves.easeInOut),
      ),
    );
    _topVideoLayerTextAlignmentY = Tween<double>(begin: 1.0, end: -0.1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.5, 1.0, curve: Curves.easeInOut),
      ),
    );

    //button background animations
    _buttonBackgroundContainerAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.25, curve: Curves.easeInOut),
      ),
    );

    _buttonBackgroundContainerAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.25, curve: Curves.easeInOut),
      ),
    );
    initVideoControllers();
    initKeys();
    super.initState();
  }

  void initKeys() {
    for (var i = 0; i < countries.length; i++) {
      _videoPlayerKeys.add(GlobalKey<_VideoContainerState>());
      _coutnryNameKeys.add(GlobalKey());
    }
  }

  //init controllers

  //_videoPlayerController is for topVideoLayerContainer
  void initVideoControllers() {
    //assgin controller (video)
    _videoPlayerController =
        VideoPlayerController.asset(countries.first.places.first.videoPath)
          ..addListener(addTopLayerVideoListener)
          ..initialize();

    //add video controller for pageview
    for (var i = 0; i < countries.length; i++) {
      //
      currentCountryPlaceIndexs.add(0);
      _videoControllers.add(
        VideoPlayerController.asset(countries[i].places.first.videoPath)
          ..initialize().then((value) {
            setState(() {
              //
              if (_videoControllers.first!.value.isPlaying == false) {
                Future.delayed(
                  Duration(milliseconds: 100),
                ).then((value) => _videoControllers.first!.play());
              }
            });
          }),
      );
    }
  }

  @override
  void dispose() {
    _videoControllers.forEach((element) {
      element!.dispose();
    });
    _videoPlayerController!.dispose();
    _animationController.removeListener(addAnimationListener);
    _animationController.removeStatusListener(addAnimationStatusListener);
    _whiteLayerAnimationController.removeListener(
      addWhiteLayerAnimationControllerListener,
    );
    _whiteLayerAnimationController.dispose();
    _animationController.dispose();
    _pageController!.dispose();

    countriesNameAnimationController.dispose();
    _placeDetailsOpacityAnimationController.dispose();
    _placeStoryViewAnimationController.dispose();
    super.dispose();
  }

  void addAnimationListener() {
    if (_animationController.value > 0.15) {
      if (!enableTouchOnTopLayer) {
        setState(() {
          enableTouchOnTopLayer = !enableTouchOnTopLayer;
        });
      }
    }
  }

  //for _animationController
  void addAnimationStatusListener(AnimationStatus animationStatus) {
    if (animationStatus == AnimationStatus.completed) {
      //as soon as animation completed for topVideoLayerContainer
      //video will play for topVideoLayerContainer
      _videoPlayerController!.play();
    }
  }

  //
  void addWhiteLayerAnimationControllerListener() {
    if (_whiteLayerAnimationController.value >= 0.85) {
      //to show white layer animation
      if (showWhiteLayer) {
        //stop at 0.85
        _whiteLayerAnimationController.stop();

        _placeDetailsOpacityAnimationController.forward();

        //showWhiteLayer to false (means we need to hide the white layer)
        showWhiteLayer = !showWhiteLayer;
      }
    }
  }

  //to change video for topVideoLayerContainer
  //this will be call when pageView changes to new index
  void changeTopLayerVideoContainer(String videoPath, bool playVideo) {
    //disposing the controller that contains lod videos
    final oldController = _videoPlayerController;
    //add post framework callback
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      //dispose old video controller
      oldController!.removeListener(addTopLayerVideoListener);
      await oldController.dispose();
      //assign new video controller
      _videoPlayerController =
          VideoPlayerController.asset(videoPath)
            ..addListener(addTopLayerVideoListener)
            ..initialize().then((value) {
              setState(() {});
              if (playVideo) {
                _videoPlayerController!.play();
              }
            });
    });
    //set video controller to null
    setState(() {
      _videoPlayerController = null;
    });
  }

  //to change video for pageview container
  void changeCurrentCountryVideo(String videoPath) {
    //remove listener
    _videoPlayerKeys[currentCountryIndex].currentState!.removeListener();

    //disposing the controller that contains old videos
    final oldController = _videoControllers[currentCountryIndex];
    //add post framework callback
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      //dispose old video controller

      await oldController!.dispose();
      //assign new video controller
      _videoControllers[currentCountryIndex] = VideoPlayerController.asset(
          videoPath,
        )
        ..initialize().then((value) {
          _videoPlayerKeys[currentCountryIndex].currentState!.addListener();
          setState(() {});
        });
    });
    //set video controller to null
    setState(() {
      _videoControllers[currentCountryIndex] = null;
    });
  }

  //to display details of place for given country
  void moveToDetailsContainer() {
    //duration from video controller will be start
    Duration duration = _videoControllers[currentCountryIndex]!.value.duration;

    //change duration of top video layer to duration of in pageview
    _videoPlayerController!.seekTo(duration);
    //change detailsPlace index to currentCountryIndex
    setState(() {
      detailsCountryPlaceIndex = currentCountryIndex;
    });
    //start animations
    _whiteLayerAnimationController.forward(from: 0.0);
    _animationController.forward();
  }

  //back press event
  void backToHomeContainer() {
    if (_placeStoryViewAnimationController.isCompleted) {
      //move topLayerVideoContainer to zero duration
      _videoPlayerController!.seekTo(Duration.zero);
      _placeStoryViewAnimationController.reverse();
      return;
    }
    if (_animationController.isCompleted) {
      //video player settings
      _videoPlayerController!.seekTo(Duration.zero);
      _videoPlayerController!.pause();

      //hide white container
      _whiteLayerAnimationController.forward(from: 0.85).then((value) {
        showWhiteLayer = !showWhiteLayer;
        _placeDetailsOpacityAnimationController.reverse();
      });

      _animationController.reverse().then((value) {
        //after tapping back button
        setState(() {
          enableTouchOnTopLayer = !enableTouchOnTopLayer;
          detailsCountryPlaceIndex = -1;
        });
        _videoControllers[currentCountryIndex]!.play();
      });
    }
  }

  //to see video in full view
  void moveToStoryView() {
    _placeStoryViewAnimationController.forward();
  }

  // topLayerVideoContainer listener
  void addTopLayerVideoListener() {
    //means user is in story view
    if (_placeStoryViewAnimationController.isCompleted) {
      //play next place video of this country

      if (_videoPlayerController!.value.position ==
          _videoPlayerController!.value.duration) {
        playNextCountryPlaceVideo();
      }
    } else {
      if (_videoPlayerController!.value.position ==
          _videoPlayerController!.value.duration) {
        _videoPlayerController!.play();
      }
    }
  }

  //In story view
  void playNextCountryPlaceVideo() {
    _videoPlayerController!.removeListener(addTopLayerVideoListener);
    //it will change details of background image and current country index's video container

    if (currentCountryPlaceIndexs[currentCountryIndex] ==
        (countries[currentCountryIndex].places.length - 1)) {
      setState(() {
        currentCountryPlaceIndexs[currentCountryIndex] = 0;
      });
    } else {
      setState(() {
        currentCountryPlaceIndexs[currentCountryIndex] =
            currentCountryPlaceIndexs[currentCountryIndex] + 1;
      });
    }

    changeTopLayerVideoContainer(
      countries[currentCountryIndex]
          .places[currentCountryPlaceIndexs[currentCountryIndex]]
          .videoPath,
      true,
    );
    changeCurrentCountryVideo(
      countries[currentCountryIndex]
          .places[currentCountryPlaceIndexs[currentCountryIndex]]
          .videoPath,
    );
  }

  //

  Widget _buildHorizontalCountryList() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsetsDirectional.only(
          top: MediaQuery.of(context).size.height * (0.115),
        ),
        height: 30,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          padding: EdgeInsetsDirectional.only(
            start: MediaQuery.of(context).size.width * (0.075),
          ),
          scrollDirection: Axis.horizontal,
          children:
              countries.map((e) {
                int index = countries.indexOf(e);
                return Container(
                  key: _coutnryNameKeys[index],
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    e.name,
                    style: TextStyle(
                      color:
                          index == currentCountryIndex
                              ? Colors.white
                              : Colors.white60,
                      fontSize: 16.0,
                    ),
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Container(
      height: MediaQuery.of(context).size.height,
      child:
          AppKitProConstant.isfirebaseimage
              ? OctoImage(
                image: CachedNetworkImageProvider(
                  countries[currentCountryIndex]
                      .places[currentCountryPlaceIndexs[currentCountryIndex]]
                      .imagePath,
                ),
                placeholderBuilder: OctoPlaceholder.blurHash(
                  countries[currentCountryIndex]
                      .places[currentCountryPlaceIndexs[currentCountryIndex]]
                      .blurUrl,
                  fit: BoxFit.cover,
                ),
                errorBuilder: OctoError.icon(color: Colors.black),
                fit: BoxFit.fitHeight,
              )
              : Image.asset(
                countries[currentCountryIndex]
                    .places[currentCountryPlaceIndexs[currentCountryIndex]]
                    .localimagePath,
                fit: BoxFit.fitHeight,
              ),
    );
  }

  Widget _buildTopBlackLayer() {
    return Opacity(
      opacity: 0.5,
      child: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.black45,
      ),
    );
  }

  Widget _buildVideoListContainer() {
    return Align(
      alignment: Alignment.topCenter,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Container(
          height:
              MediaQuery.of(context).size.height *
              videoContainerHeightPercentage,
          margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * (0.25),
          ),
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              //to play only currentCountryIndex video
              _videoControllers[index]!.play();
              _videoControllers[currentCountryIndex]!.pause();

              setState(() {
                currentCountryIndex = index;
              });
              //
              changeTopLayerVideoContainer(
                countries[currentCountryIndex]
                    .places[currentCountryPlaceIndexs[currentCountryIndex]]
                    .videoPath,
                false,
              );
            },
            itemCount: countries.length,
            itemBuilder: (context, index) {
              return Opacity(
                opacity: index == detailsCountryPlaceIndex ? 0.0 : 1.0,
                child: VideoContainer(
                  key: _videoPlayerKeys[index],
                  placeDetails:
                      countries[index].places[currentCountryPlaceIndexs[index]],
                  moveToDetailsContainer: moveToDetailsContainer,
                  videoPlayerController: _videoControllers[index],
                  index: index,
                  currentCountryIndex: currentCountryIndex,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildTopLayerVideoContainer() {
    return Align(
      alignment: Alignment.topCenter,
      child: IgnorePointer(
        ignoring: !enableTouchOnTopLayer,
        child: AnimatedBuilder(
          animation: _placeStoryViewAnimationController,
          builder: (context, child) {
            return AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                double topMargin =
                    _translateTopVideoLayerAnimation
                        .drive(Tween<double>(begin: 0.25, end: 0.0))
                        .value;
                double horizontalMargin =
                    _translateTopVideoLayerAnimation
                        .drive(Tween<double>(begin: 0.0875, end: 0.0))
                        .value;
                double height =
                    _translateTopVideoLayerAnimation
                        .drive(
                          Tween<double>(
                            begin: videoContainerHeightPercentage,
                            end: videoContainerDetailsHeightPercentage,
                          ),
                        )
                        .value +
                    0.4 * _placeStoryViewAnimation.value;

                return Opacity(
                  opacity: detailsCountryPlaceIndex == -1 ? 0.0 : 1.0,
                  child: GestureDetector(
                    onTap: () {
                      if (_placeStoryViewAnimationController.isCompleted) {
                        playNextCountryPlaceVideo();
                      } else {
                        moveToStoryView();
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * topMargin,
                        left:
                            MediaQuery.of(context).size.width *
                            horizontalMargin,
                        right:
                            MediaQuery.of(context).size.width *
                            horizontalMargin,
                      ),
                      height: MediaQuery.of(context).size.height * height,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          25.0 * (1.0 - _translateTopVideoLayerAnimation.value),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Opacity(
                            opacity: _placeStoryViewAnimation.value,
                            child: Container(color: Colors.white60),
                          ),
                          _videoPlayerController == null
                              ? Container()
                              : ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  25.0 *
                                      (1.0 -
                                          _translateTopVideoLayerAnimation
                                              .value),
                                ),
                                child: VideoPlayer(_videoPlayerController!),
                              ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                25.0 *
                                    (1.0 -
                                        _translateTopVideoLayerAnimation.value),
                              ),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.white.withOpacity(0.0),
                                  Colors.grey.withOpacity(0.1),
                                  Colors.black.withOpacity(
                                    0.7 *
                                        (1.0 -
                                            _translateTopVideoLayerAnimation
                                                .value),
                                  ),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                          _videoPlayerController == null
                              ? Container()
                              : Align(
                                alignment: Alignment(
                                  -_topVideoLayerTextAlignmentX.value +
                                      (-1.0 * _placeStoryViewAnimation.value),
                                  _topVideoLayerTextAlignmentY.value +
                                      (1.2 * _placeStoryViewAnimation.value),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: placeNameLeftPadding,
                                    bottom:
                                        MediaQuery.of(context).size.height *
                                            videoContainerHeightPercentage *
                                            (0.15) +
                                        videoContainerTextBottomPadding +
                                        10,
                                  ),
                                  child: Text(
                                    "${countries[currentCountryIndex].places[currentCountryPlaceIndexs[currentCountryIndex]].name}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                          _videoPlayerController == null
                              ? Container()
                              : Opacity(
                                opacity:
                                    _topVideoLayerCountryOpacityAnimation.value,
                                child: Align(
                                  alignment: Alignment(
                                    -_topVideoLayerTextAlignmentX.value +
                                        (-1.0 * _placeStoryViewAnimation.value),
                                    _topVideoLayerTextAlignmentY.value +
                                        (1.2 * _placeStoryViewAnimation.value),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: 10.0,
                                      left: placeNameLeftPadding + 5,
                                      bottom:
                                          MediaQuery.of(context).size.height *
                                          videoContainerHeightPercentage *
                                          (0.075 +
                                              (0.075 *
                                                  _placeStoryViewAnimation
                                                      .value)),
                                    ),
                                    child: Text(
                                      "${countries[currentCountryIndex].name}",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          _videoPlayerController == null
                              ? Container()
                              : Opacity(
                                opacity:
                                    _topVideoLayerPlaceDetailsOpacityAnimation
                                        .value,
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: placeNameLeftPadding,
                                      bottom: videoContainerTextBottomPadding,
                                    ),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                          videoContainerHeightPercentage *
                                          (0.15),
                                      child: Text(
                                        "${countries[currentCountryIndex].places[currentCountryPlaceIndexs[currentCountryIndex]].details}",
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          _videoPlayerController == null
                              ? Container()
                              : Opacity(
                                opacity: _placeStoryViewAnimation.value,
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: LayoutBuilder(
                                    builder: (context, constraints) {
                                      return Container(
                                        padding: EdgeInsets.only(
                                          left: constraints.maxWidth * 0.05,
                                          right: constraints.maxWidth * 0.05,
                                          bottom: 25.0,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children:
                                              countries[currentCountryIndex].places.map((
                                                e,
                                              ) {
                                                return VideoDurationContainer(
                                                  videoPlayerController:
                                                      _videoPlayerController,
                                                  maxWidth:
                                                      constraints.maxWidth /
                                                      (countries[currentCountryIndex]
                                                              .places
                                                              .length
                                                              .toDouble() +
                                                          0.5),
                                                  currentCountryPlaceIndex:
                                                      currentCountryPlaceIndexs[currentCountryIndex],
                                                  index:
                                                      countries[currentCountryIndex]
                                                          .places
                                                          .indexOf(e),
                                                );
                                              }).toList(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildTopLayerWhiteContaienr() {
    return Align(
      alignment: Alignment.topCenter,
      child: IgnorePointer(
        ignoring: !enableTouchOnTopLayer,
        child: AnimatedBuilder(
          animation: _placeStoryViewAnimationController,
          builder: (context, child) {
            return AnimatedBuilder(
              animation: _whiteLayerAnimationController,
              builder: (context, child) {
                double topMargin =
                    _translateWhiteLayerAnimation
                        .drive(Tween<double>(begin: 0.25, end: 0.45))
                        .value +
                    videoContainerHeightPercentage *
                        _placeStoryViewAnimation.value;
                double horizontalMargin =
                    _translateWhiteLayerAnimation
                        .drive(Tween<double>(begin: 0.0875, end: 0.0))
                        .value;
                double opacityDown = _whiteLayerOpacityDownAnimation.value;
                if (opacityDown >= 0.75 && opacityDown <= 1.0) {
                  opacityDown = 1.0;
                }
                print("Animation:" + opacityDown.toString());
                return Opacity(
                  opacity: opacityDown,
                  child: Opacity(
                    opacity: _whiteLayerOpacityUpAnimation.value,
                    child: Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * topMargin,
                        left:
                            MediaQuery.of(context).size.width *
                            horizontalMargin,
                        right:
                            MediaQuery.of(context).size.width *
                            horizontalMargin,
                      ),
                      height:
                          MediaQuery.of(context).size.height *
                          videoContainerHeightPercentage,
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * (0.075),
                      ),
                      child: FadeTransition(
                        opacity: _placeDetailsOpacityAnimationController,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(height: 25.0),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: Text(
                                        "${countries[currentCountryIndex].places[currentCountryPlaceIndexs[currentCountryIndex]].address}",
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.0),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                    ),
                                  ),
                                  SizedBox(width: 5.0),
                                  Text(
                                    "${countries[currentCountryIndex].places[currentCountryPlaceIndexs[currentCountryIndex]].review}",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 25.0),
                              PlaceDetailsMenu(),
                              SizedBox(height: 15.0),
                              Container(
                                margin: EdgeInsets.only(right: 15.0),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "${countries[currentCountryIndex].places[currentCountryPlaceIndexs[currentCountryIndex]].details}",
                                  style: TextStyle(fontSize: 16.0),
                                  maxLines: 5,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(height: 20.0),
                              Padding(
                                padding: EdgeInsets.only(
                                  right:
                                      MediaQuery.of(context).size.width * (0.1),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${countries[currentCountryIndex].places[currentCountryPlaceIndexs[currentCountryIndex]].duration}",
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "Duration",
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${countries[currentCountryIndex].places[currentCountryPlaceIndexs[currentCountryIndex]].distance}",
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "Distance",
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${countries[currentCountryIndex].places[currentCountryPlaceIndexs[currentCountryIndex]].temperature}",
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "Temperature",
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 25.0),
                              Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    width:
                                        MediaQuery.of(context).size.width *
                                        (0.3),
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      border: Border.all(
                                        color: Theme.of(context).primaryColor,
                                        width: 1.5,
                                      ),
                                    ),
                                    child: Text(
                                      "${countries[currentCountryIndex].places[currentCountryPlaceIndexs[currentCountryIndex]].cost}",
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width *
                                        (0.075),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width:
                                        MediaQuery.of(context).size.width *
                                        (0.45),
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    child: Text(
                                      "Book now",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(
                            25.0 * (1.0 - _translateWhiteLayerAnimation.value),
                          ),
                          bottomRight: Radius.circular(
                            25.0 * (1.0 - _translateWhiteLayerAnimation.value),
                          ),
                          topLeft: Radius.circular(25.0),
                          topRight: Radius.circular(25.0),
                        ),
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildBackButton() {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * (0.035),
          left: 15.0,
        ),
        child: IconButton(
          onPressed: () {
            if (_animationController.isCompleted) {
              backToHomeContainer();
              Future.value(false);
            } else {
              Navigator.pop(context);
            }
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildBackButtonBackground() {
    return Align(
      alignment: Alignment.topLeft,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Opacity(
            opacity: _buttonBackgroundContainerAnimation.value,
            child: GestureDetector(
              onTap: () {
                backToHomeContainer();
              },
              child: Container(
                transformAlignment: Alignment.center,
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * (0.035) + 8.0,
                  left: 23.0,
                ),
                height: 32.0,
                width: 32.0,
                decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(7.5),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSearchButtonBackground() {
    return Align(
      alignment: Alignment.topRight,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Opacity(
            opacity: _buttonBackgroundContainerAnimation.value,
            child: Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * (0.035) + 8.0,
                right: 23.0,
              ),
              height: 32.0,
              width: 32.0,
              decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.circular(7.5),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSearchButton() {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * (0.035),
          right: 15.0,
        ),
        child: IconButton(
          onPressed: () {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Search')));
          },
          icon: Icon(Icons.search, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (_animationController.isCompleted) {
          backToHomeContainer();
          return Future.value(false);
        }

        return Future.value(true);
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
        child: Scaffold(
          body: Stack(
            clipBehavior: Clip.none,
            children: [
              _buildBackgroundImage(),
              _buildTopBlackLayer(),
              _buildVideoListContainer(),
              _buildHorizontalCountryList(),
              _buildTopLayerVideoContainer(),
              _buildTopLayerWhiteContaienr(),
              _buildBackButtonBackground(),
              _buildBackButton(),
              _buildSearchButtonBackground(),
              _buildSearchButton(),
            ],
          ),
        ),
      ),
    );
  }
}

//
class VideoContainer extends StatefulWidget {
  final Function moveToDetailsContainer;
  final VideoPlayerController? videoPlayerController;
  final int currentCountryIndex;
  final PlaceDetails placeDetails;
  final int index;
  const VideoContainer({
    Key? key,
    required this.placeDetails,
    required this.moveToDetailsContainer,
    required this.videoPlayerController,
    required this.currentCountryIndex,
    required this.index,
  }) : super(key: key);

  @override
  _VideoContainerState createState() => _VideoContainerState();
}

class _VideoContainerState extends State<VideoContainer> {
  @override
  void initState() {
    super.initState();
    addListener();
  }

  @override
  void dispose() {
    removeListener();
    super.dispose();
  }

  void addListener() {
    widget.videoPlayerController!.addListener(addVideoListener);
  }

  void removeListener() {
    widget.videoPlayerController!.removeListener(addVideoListener);
  }

  void addVideoListener() {
    if (widget.videoPlayerController!.value.position ==
        widget.videoPlayerController!.value.duration) {
      widget.videoPlayerController!.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.moveToDetailsContainer();
        widget.videoPlayerController!.seekTo(Duration.zero);
        widget.videoPlayerController!.pause();
      },
      child: Transform.scale(
        scale: widget.index == widget.currentCountryIndex ? 1.0 : 0.9,
        alignment: Alignment.center,
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25.0)),
          child: Stack(
            children: [
              widget.videoPlayerController == null
                  ? Container()
                  : ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: VideoPlayer(widget.videoPlayerController!),
                  ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.0),
                      Colors.grey.withOpacity(0.1),
                      Colors.black.withOpacity(0.7),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: placeNameLeftPadding,
                    bottom:
                        MediaQuery.of(context).size.height *
                            videoContainerHeightPercentage *
                            (0.15) +
                        videoContainerTextBottomPadding +
                        10,
                  ),
                  child: Text(
                    "${widget.placeDetails.name}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: placeNameLeftPadding,
                    bottom: videoContainerTextBottomPadding,
                  ),
                  child: Container(
                    height:
                        MediaQuery.of(context).size.height *
                        videoContainerHeightPercentage *
                        (0.15),
                    child: Text(
                      "${widget.placeDetails.details}",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//to display timeline in storyview
class VideoDurationContainer extends StatefulWidget {
  final double maxWidth; //highest width for container to display time
  final int currentCountryPlaceIndex;
  final int index; //idnex of this videoDurationContainer
  final VideoPlayerController? videoPlayerController;
  VideoDurationContainer({
    Key? key,
    required this.videoPlayerController,
    required this.maxWidth,
    required this.currentCountryPlaceIndex,
    required this.index,
  }) : super(key: key);

  @override
  _VideoDurationContainerState createState() => _VideoDurationContainerState();
}

class _VideoDurationContainerState extends State<VideoDurationContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  //listener will trigger animation
  void _addVideoListener() {
    if (widget.index == widget.currentCountryPlaceIndex) {
      int currentDuration =
          widget.videoPlayerController!.value.position.inSeconds;
      int totalDuration =
          widget.videoPlayerController!.value.duration.inSeconds;

      //convert video duration into 0 to 1 range so can change animationController value
      _animationController.value = ConvertNumber.inRange(
        currentValue: currentDuration.toDouble(),
        minValue: 0.0,
        maxValue: totalDuration.toDouble(),
        newMaxValue: 1.0,
        newMinValue: 0.0,
      );
    }
  }

  void addListener() {
    widget.videoPlayerController!.addListener(_addVideoListener);
  }

  void removeListener() {
    widget.videoPlayerController!.removeListener(_addVideoListener);
  }

  @override
  void initState() {
    addListener();
    _animationController = AnimationController(vsync: this);
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    super.initState();
  }

  @override
  void dispose() {
    removeListener();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2.5),
            color: Colors.white60,
          ),
          height: 2.5,
          width: widget.maxWidth,
        ),
        widget.index < widget.currentCountryPlaceIndex
            ? Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.5),
                color: Colors.white,
              ),
              height: 2.5,
              width: widget.maxWidth,
            )
            : Opacity(
              opacity:
                  widget.index == widget.currentCountryPlaceIndex ? 1.0 : 0.0,
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.5),
                      color: Colors.white,
                    ),
                    height: 2.5,
                    width: widget.maxWidth * _animation.value,
                  );
                },
              ),
            ),
      ],
    );
  }
}

class PlaceDetailsMenu extends StatefulWidget {
  PlaceDetailsMenu({Key? key}) : super(key: key);

  @override
  _PlaceDetailsMenuState createState() => _PlaceDetailsMenuState();
}

class _PlaceDetailsMenuState extends State<PlaceDetailsMenu> {
  int currentSelectedIndex = 0;

  TextStyle _buildTextStyle(int index) {
    return TextStyle(
      color: index == currentSelectedIndex ? Colors.black : Colors.grey,
      fontSize: 16,
      fontWeight:
          index == currentSelectedIndex ? FontWeight.w500 : FontWeight.normal,
    );
  }

  double inBetweenWdithPercentage = 0.075;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              currentSelectedIndex = 0;
            });
          },
          child: Text("Overview", style: _buildTextStyle(0)),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * inBetweenWdithPercentage,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              currentSelectedIndex = 1;
            });
          },
          child: Text("Details", style: _buildTextStyle(1)),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * inBetweenWdithPercentage,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              currentSelectedIndex = 2;
            });
          },
          child: Text("Reviews", style: _buildTextStyle(2)),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * inBetweenWdithPercentage,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              currentSelectedIndex = 3;
            });
          },
          child: Text("Costs", style: _buildTextStyle(3)),
        ),
      ],
    );
  }
}
