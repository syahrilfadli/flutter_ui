import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:octo_image/octo_image.dart';
import 'package:flutter_ui/AppFeature/Constant/AppKitProConstant.dart';

import 'TourUIDetail.dart';

const duration = Duration(milliseconds: 300);

class TourUIFirst extends StatefulWidget {
  @override
  _TourUIFirstState createState() => _TourUIFirstState();
}

const backgroundColor = Color(0xFF000000);

class _TourUIFirstState extends State<TourUIFirst> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [backgroundColor.withOpacity(0.5), backgroundColor],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle.light,
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text('Tour', style: TextStyle(color: Colors.white)),
          ),
          body: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: locationslist.length,
                  onPageChanged: (page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  controller: PageController(viewportFraction: 0.7),
                  itemBuilder:
                      (_, index) => AnimatedOpacity(
                        duration: duration,
                        opacity: _currentPage == index ? 1.0 : 0.5,
                        child: TravelItem(
                          item: locationslist[index],
                          itemSelected: _currentPage == index,
                        ),
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  '${_currentPage + 1}/${locationslist.length}',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TravelItem extends StatefulWidget {
  final bool? itemSelected;
  final LocationData? item;

  const TravelItem({Key? key, this.itemSelected, this.item}) : super(key: key);

  @override
  _TravelItemState createState() => _TravelItemState();
}

class _TravelItemState extends State<TravelItem> {
  bool _selected = false;

  void _onTap() {
    if (_selected) {
      final page = TourUIDetail(location: widget.item);
      Navigator.of(context).push(
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 700),
          pageBuilder: (_, animation1, __) => page,
          transitionsBuilder: (_, animation1, animation2, child) {
            return FadeTransition(opacity: animation1, child: child);
          },
        ),
      );
    } else {
      setState(() {
        _selected = !_selected;
      });
    }
  }

  void _onVerticalDrag(DragUpdateDetails details) {
    if (details.primaryDelta! > 3.0) {
      setState(() {
        _selected = false;
      });
    }
  }

  Widget _buildStar({bool starSelected = true}) => Expanded(
    child: Icon(
      Icons.star,
      size: 20,
      color: starSelected ? Colors.yellow : Colors.grey,
    ),
  );

  @override
  Widget build(BuildContext context) {
    if (!widget.itemSelected!) {
      _selected = false;
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        final itemHeight =
            constraints.maxHeight * (widget.itemSelected! ? 0.55 : 0.52);
        final itemWidth = constraints.maxWidth * 0.82;

        final borderRadius = BorderRadius.circular(5.0);
        final backWidth = _selected ? itemWidth * 1.2 : itemWidth;
        final backHeight = _selected ? itemHeight * 1.1 : itemHeight;
        return Container(
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: _onTap,
            onVerticalDragUpdate: _onVerticalDrag,
            child: Stack(
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: borderRadius,
                    child: AnimatedContainer(
                      duration: duration,
                      height: backHeight,
                      width: backWidth,
                      color: Colors.white,
                      margin: EdgeInsets.only(
                        top: _selected ? itemHeight * 0.15 : 0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            widget.item!.location!,
                            style: TextStyle(fontSize: 11, color: Colors.black),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14.0,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    widget.item!.price!,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    children: [
                                      _buildStar(),
                                      _buildStar(),
                                      _buildStar(),
                                      _buildStar(),
                                      _buildStar(starSelected: false),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14.0,
                              vertical: 10.0,
                            ),
                            child: Row(
                              children:
                                  featureimglist
                                      .map(
                                        (f) => Align(
                                          widthFactor: 0.85,
                                          child:
                                              AppKitProConstant.isfirebaseimage
                                                  ? CircleAvatar(
                                                    radius: 15,
                                                    child: ClipOval(
                                                      child: OctoImage(
                                                        image:
                                                            CachedNetworkImageProvider(
                                                              f['imgurl']!,
                                                            ),
                                                        placeholderBuilder:
                                                            OctoPlaceholder.blurHash(
                                                              f['blurUrl']!,
                                                            ),
                                                        errorBuilder:
                                                            OctoError.icon(
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                        height:
                                                            MediaQuery.of(
                                                              context,
                                                            ).size.height,
                                                        width:
                                                            MediaQuery.of(
                                                              context,
                                                            ).size.width,
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  )
                                                  : CircleAvatar(
                                                    backgroundImage: AssetImage(
                                                      f['localimg']!,
                                                    ),
                                                    radius: 15,
                                                  ),
                                        ),
                                      )
                                      .toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: ClipRRect(
                    borderRadius: borderRadius,
                    child: AnimatedContainer(
                      duration: duration,
                      decoration: BoxDecoration(
                        borderRadius: borderRadius,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            blurRadius: 10.0,
                            offset: Offset(0.0, 5.0),
                            spreadRadius: 5.0,
                          ),
                        ],
                      ),
                      height: itemHeight,
                      width: itemWidth,
                      margin: EdgeInsets.only(
                        bottom: _selected ? itemHeight * 0.5 : 0,
                      ),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Hero(
                              tag: widget.item!.title!,
                              child:
                                  AppKitProConstant.isfirebaseimage
                                      ? OctoImage(
                                        image: CachedNetworkImageProvider(
                                          widget.item!.imageUrl!,
                                        ),
                                        placeholderBuilder:
                                            OctoPlaceholder.blurHash(
                                              widget.item!.blurUrl!,
                                            ),
                                        errorBuilder: OctoError.icon(
                                          color: Colors.grey,
                                        ),
                                        fit: BoxFit.cover,
                                      )
                                      : Image.asset(
                                        widget.item!.localimg!,
                                        fit: BoxFit.cover,
                                      ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                widget.item!.title!,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class LocationData {
  final String? title;
  final String? imageUrl;
  final String? location;
  final String? price;
  final String? blurUrl;
  final String? description;
  final String? localimg;

  LocationData({
    this.title,
    this.imageUrl,
    this.location,
    this.price,
    this.blurUrl,
    this.description,
    this.localimg,
  });
}

List<LocationData> locationslist = [
  LocationData(
    title: "Fairy Pools",
    location: "Scotland",
    price: "\$50",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
    localimg: "assets/travelapp/image/toptrip_c.jpg",
    blurUrl: "LB9k~KrqHXtSD4bbRjg3uiIUM_xu",
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/flutter_ui-8e62c.appspot.com/o/travelapp%2Ftoptrip_c.jpg?alt=media&token=529bd6fa-7772-4f43-9480-2013a3ab2aeb',
  ),
  LocationData(
    title: "Railay Beach",
    location: "Thailand",
    price: "\$129",
    localimg: "assets/travelapp/image/toptrip_e.jpg",
    blurUrl: "L*Br.kt7adfQu6ofaeayXTjEfkj[",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/flutter_ui-8e62c.appspot.com/o/travelapp%2Ftoptrip_e.jpg?alt=media&token=62e805e1-82c1-4ad0-931f-d3a5e839069b',
  ),
  LocationData(
    title: "The CN Tower",
    location: "Bremner Blvd, Toronto, ON, Canada",
    price: "\$229",
    localimg: "assets/travelapp/image/slide_image_c.jpg",
    blurUrl: "LfE47TVYslg4_NSOadRjpIsmozRi",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/flutter_ui-8e62c.appspot.com/o/travelapp%2Fslide_image_c.jpg?alt=media&token=837467fe-003a-4b74-ae4b-739259ab4ccf',
  ),
  LocationData(
    title: "British Columbia",
    location: "Vancouver, Canada",
    price: "\$329",
    localimg: "assets/travelapp/image/slide_image_d.jpg",
    blurUrl: "LXJG{9o~ENs.~qo#WXay5roMxGR+",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/flutter_ui-8e62c.appspot.com/o/travelapp%2Fslide_image_d.jpg?alt=media&token=6d0343c8-0abb-49cf-838a-4d26fa865a6b',
  ),
];

final featureimglist = [
  {
    'localimg': "assets/travelapp/image/detail_image_a.jpg",
    'blurUrl': "LlF70ZnNsmbv_Noze.RjkXxaogV@",
    'imgurl':
        'https://firebasestorage.googleapis.com/v0/b/flutter_ui-8e62c.appspot.com/o/travelapp%2Fdetail_image_a.jpg?alt=media&token=95c2b092-9969-413a-8990-0ee8ab77e3e6',
  },
  {
    'localimg': "assets/travelapp/image/detail_image_b.jpg",
    'blurUrl': "LRG9Hi9F%May~qRjxtxu-;fkaxt6",
    'imgurl':
        'https://firebasestorage.googleapis.com/v0/b/flutter_ui-8e62c.appspot.com/o/travelapp%2Fdetail_image_b.jpg?alt=media&token=1b82c38c-da7c-4e29-8948-be6ac0d5b3d1',
  },
  {
    'localimg': "assets/travelapp/image/detail_image_c.jpg",
    'blurUrl': "LhG_F[RjjZWC*JbHj[j@J.kCbHkC",
    'imgurl':
        'https://firebasestorage.googleapis.com/v0/b/flutter_ui-8e62c.appspot.com/o/travelapp%2Fdetail_image_c.jpg?alt=media&token=4597cb2b-eb8b-4006-ab69-290ea7613dcb',
  },
  {
    'localimg': "assets/travelapp/image/detail_video_a.jpg",
    'blurUrl': "L4EMRZ-=V@-=00_4o#Mx0000oJj@",
    'imgurl':
        'https://firebasestorage.googleapis.com/v0/b/flutter_ui-8e62c.appspot.com/o/travelapp%2Fdetail_video_a.jpg?alt=media&token=4f4aebf0-6f09-41bd-ac72-9f9cbe7b5a7b',
  },
];
