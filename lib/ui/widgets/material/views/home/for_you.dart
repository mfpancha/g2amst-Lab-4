import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../../../constants/colors.dart';
import '../../../../../utils/info.dart';

class ForYouView extends StatefulWidget {
  const ForYouView({Key? key}) : super(key: key);

  @override
  _ForYouView createState() => _ForYouView();
}

class _ForYouView extends State<ForYouView> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.background,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: AppColors.text_light,
            ),
            onPressed: () => Navigator.of(context)
                .pushNamed("/cart-view"),
          ),
        ],
        title: Text(
          "For You",
          style: TextStyle(color: AppColors.text_light),
        ),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return ListView(
      children: [
        _carousel(),
        Padding(
          padding: EdgeInsets.all(10),
          child: Text("Discounts",
              style: TextStyle(
                  color: AppColors.text_light,
                  fontSize: 34,
                  fontWeight: FontWeight.bold)),
        ),
        _promo(),
        Padding(
          padding: EdgeInsets.all(10),
          child: Text("Varios",
              style: TextStyle(
                  color: AppColors.text_light,
                  fontSize: 30,
                  fontWeight: FontWeight.bold)),
        ),
        _shirts(),
        Padding(
          padding: EdgeInsets.all(10),
          child: Text("Alimentos",
              style: TextStyle(
                  color: AppColors.text_light,
                  fontSize: 30,
                  fontWeight: FontWeight.bold)),
        ),
        _pants(),
      ],
    );
  }

  Widget _carousel() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 180,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: false,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayInterval: Duration(seconds: 8),
      ),
      items: [
        _carouselImage("assets/images/carousel1.jpg"),
        _carouselImage("assets/images/carousel2.jpg"),
        _carouselImage("assets/images/carousel3.jpg"),
      ],
    );
  }

  Widget _carouselImage(String path) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(path),
            fit: BoxFit.cover,
          )),
    );
  }

  Widget _promo() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.only(left: 20),
        child: Row(
          children: _itemListPromo(),
        ),
      ),
    );
  }

  List<Widget> _itemListPromo() {
    return List.generate(
        promos.length,
            (index) => GestureDetector(
          onTap: () => Navigator.of(context)
              .pushNamed("/product-view", arguments: promos[index]),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                margin: EdgeInsets.only(right: 20),
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                  color: promos[index].color,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                    padding: EdgeInsets.only(bottom: 30,left: 30,right: 30),
                    child: Hero(
                        tag: "${promos[index].id}",child: Image.asset(promos[index].image))),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      promos[index].title,
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                    Text("\$" + promos[index].price.toString())
                  ],
                ),
              )
            ],
          ),
        ));
  }

  List<Widget> _itemListShirts() {
    return List.generate(
        promos.length,
            (index) => Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20),
              height: 180,
              width: 260,
              decoration: BoxDecoration(
                color: promos[index].color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                  padding: EdgeInsets.only(bottom: 50,top: 10),
                  child: Image.asset(promos[index].image,)),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Text(
                    promos[index].title,
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                  Text("\$" + promos[index].price.toString())
                ],
              ),
            )
          ],
        ));
  }

  Widget _shirts() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.only(right: 20),
        child: Row(
          children: _itemListShirts(),
        ),
      ),
    );
  }

  Widget _pants() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.only(right: 20),
        child: Row(
          children: _itemListShirts(),
        ),
      ),
    );
  }
}