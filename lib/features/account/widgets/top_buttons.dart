import 'package:amazon_clone_tutorial/features/account/widgets/account_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TopButtons extends StatefulWidget {
  const TopButtons({super.key});

  @override
  State<TopButtons> createState() => _TopButtonsState();
}

class _TopButtonsState extends State<TopButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(
              buttonText: "Your Orders",
              onTap: () {},
            ),
            AccountButton(
              buttonText: "Turn Seller",
              onTap: () {},
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            AccountButton(
              buttonText: "Log Out",
              onTap: () {},
            ),
            AccountButton(
              buttonText: "Your Wish List",
              onTap: () {},
            ),
          ],
        )
      ],
    );
  }
}
