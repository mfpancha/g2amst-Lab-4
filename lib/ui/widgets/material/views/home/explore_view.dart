import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../constants/colors.dart';
import '../../../../../models/filter_chip.dart';
import '../../../../../models/product.dart';
import '../../../../../utils/info.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  _Explore createState() => _Explore();
}

class _Explore extends State<Explore> {
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
        title: Text(
          "Explore",
          style: TextStyle(color: AppColors.text_light),
        ),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Wrap(runSpacing: 5, spacing: 15, children: _buildFilterChips()),
          ),
          Expanded(
              child: GridView.builder(
                padding: EdgeInsets.only(left: 15),
                itemCount: promos.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.85,
                ),
                itemBuilder: (context, index) => ItemCard(product: promos[index]),
              )),
        ]);
  }

  List<Widget> _buildFilterChips() {
    return List.generate(categories.length, (index) => chip(categories[index]));
  }

  Widget chip(FilterChipData data) => FilterChip(
      selected: data.isSelected,
      label: Text(data.label),
      onSelected: (isSelected) {
        setState(() {
          data.isSelected = isSelected;
        });
      });
}

class ItemCard extends StatelessWidget {
  final Product product;

  const ItemCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 180,
          width: 180,
          decoration: BoxDecoration(
            color: product.color,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
              padding: EdgeInsets.all(10),
              child: Hero(
                  tag: "${product.id}", child: Image.asset(product.image))),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.title,
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
            Text("\$" + product.price.toString())
          ],
        )
      ],
    );
  }
}