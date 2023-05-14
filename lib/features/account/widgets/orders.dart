import 'package:amazon_clone_tutorial/constants/global_variables.dart';
import 'package:amazon_clone_tutorial/features/account/widgets/single_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  List list = [
    'https://media.istockphoto.com/id/1403278751/photo/abstract-particle-background.jpg?s=612x612&w=is&k=20&c=XbX0rC18HZzfMJO--txzNvndnzS_u1CheCTsqa-7RgQ=',
    'https://media.istockphoto.com/id/1403278751/photo/abstract-particle-background.jpg?s=612x612&w=is&k=20&c=XbX0rC18HZzfMJO--txzNvndnzS_u1CheCTsqa-7RgQ=',
    'https://media.istockphoto.com/id/1403278751/photo/abstract-particle-background.jpg?s=612x612&w=is&k=20&c=XbX0rC18HZzfMJO--txzNvndnzS_u1CheCTsqa-7RgQ=',
    'https://media.istockphoto.com/id/1403278751/photo/abstract-particle-background.jpg?s=612x612&w=is&k=20&c=XbX0rC18HZzfMJO--txzNvndnzS_u1CheCTsqa-7RgQ='
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15),
              child: const Text(
                "Your Orders",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 15, top: 5),
              child: Text(
                "See All",
                style: TextStyle(
                  color: GlobalVariables.selectedNavBarColor,
                ),
              ),
            ),
          ],
        ),
        Container(
          height: 170,
          padding: const EdgeInsets.only(
            left: 10,
            top: 20,
            right: 0,
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return SingleProduct(imageLink: list[index]);
            },
          ),
        ),
      ],
    );
  }
}
