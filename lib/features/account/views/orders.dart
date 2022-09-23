import 'package:amazon_clone/common/widgets/single_product.dart';
import 'package:amazon_clone/constants/constants.dart';
import 'package:amazon_clone/constants/global_vaiables.dart';
import 'package:flutter/material.dart';

const tempImageList = [
  "https://images.unsplash.com/photo-1640936343842-268f9d87e764?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGdhZGdldHN8ZW58MHwyfDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1560701814-de5e72b8d346?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Z2FkZ2V0c3xlbnwwfDJ8MHx8&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1547043884-975a4f9ea025?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8Z2FkZ2V0c3xlbnwwfDJ8MHx8&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1654648662327-5d4d32cf67bd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fGdhZGdldHN8ZW58MHwyfDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
];

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // head
        ListTile(
          title: const Text(
            'Your Orders',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing: Text(
            'See All',
            style: TextStyle(color: GlobalVariables.selectedNavBarColor),
          ),
        ),

        // display orders
        Container(
          height: 170,
          padding: const EdgeInsets.only(left: 10, top: 20),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: tempImageList.length,
            itemBuilder: (context, index) =>
                SingleProduct(image: tempImageList[index]),
          ),
        )
      ],
    );
  }
}
