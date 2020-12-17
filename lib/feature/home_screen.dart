import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:piko/core/resources/res_color.dart';
import 'package:piko/core/resources/res_text_style.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    final HomeController controller = Get.put(HomeController());
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          getBanner(),
          getTabs().sliverBox,
          Text(
            'Terbaru',
            style: ResTextStyle.sectionTitle,
          ).paddingAll(16).sliverBox,
          Container(
            height: 200,
            child: ListView(),
          ).sliverBox,
          Text(
            'Populer',
            style: ResTextStyle.sectionTitle,
          ).paddingAll(16).sliverBox,
          Container(
            height: 200,
            child: ListView(),
          ).sliverBox,
        ],
      ),
    );
  }

  DefaultTabController getTabs() {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: TabBar(
        labelColor: ResColor.darkBlue,
        tabs: [
          Tab(text: 'Populer'),
          Tab(text: 'Terbaru'),
          Tab(text: 'Dongeng'),
        ],
      ),
    );
  }

  SliverAppBar getBanner() {
    return SliverAppBar(
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        background: Center(
          child: CachedNetworkImage(
            imageUrl:
                "https://firebasestorage.googleapis.com/v0/b/piko-android-flutter.appspot.com/o/Thumbnail_PIKO.jpg?alt=media&token=80985fd7-f93a-458c-8bc1-6eb4a216cc86",
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}

class HomeController extends GetxController {
  @override
  void onInit() {
    // fetchApi();
    super.onInit();
  }
}
