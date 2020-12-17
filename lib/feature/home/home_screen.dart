import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:piko/core/model/Book.dart';
import 'package:piko/core/resources/res_color.dart';
import 'package:piko/core/resources/res_text_style.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          getLatestList(controller).sliverBox,
          Text(
            'Populer',
            style: ResTextStyle.sectionTitle,
          ).paddingAll(16).sliverBox,
          getPopulerList(controller).sliverBox,
        ],
      ),
    );
  }

  Container getLatestList(HomeController controller) {
    return Container(
      height: 200,
      child: Obx(
        () => ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 6),
          scrollDirection: Axis.horizontal,
          itemCount: controller.booksObs.length,
          itemBuilder: (context, index) {
            final book = controller.booksObs[index];
            return SizedBox(
              width: 150,
              height: 180,
              child: CachedNetworkImage(
                imageUrl: book.coverUrl,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ).paddingSymmetric(horizontal: 6);
          },
        ),
      ),
    );
  }

  Container getPopulerList(HomeController controller) {
    return Container(
      height: 200,
      child: Obx(
        () => ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 6),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: controller.booksObs.length,
          itemBuilder: (context, index) {
            final book = controller.booksObs[index];
            return SizedBox(
              width: 150,
              height: 180,
              child: CachedNetworkImage(
                imageUrl: book.coverUrl,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ).paddingSymmetric(horizontal: 6);
          },
        ),
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
  final booksObs = <Book>[].obs;
  @override
  void onInit() {
    getAllBook();
    super.onInit();
  }

  void getAllBook() async {
    final query = FirebaseFirestore.instance.collection(Book.KEY);

    final rawBooks = await query.get();
    final books = rawBooks.docs
        .map<Book>(
          (d) => Book.fromJson(d.data()),
        )
        .toList();

    booksObs.addAll(books);
    update();
  }
}
