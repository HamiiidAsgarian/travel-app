import 'package:flutter/material.dart';
import 'package:travel_app_example/models/destination.dart';

import '../core/consts.dart';

class DestinationCards extends StatelessWidget {
  final Function ontap;
  final Destination data;
  const DestinationCards({
    required this.data,
    required this.ontap,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    double cardHeight = 120;

    return GestureDetector(
      onTap: () {
        ///Sends the selected items data to the parent
        ontap(data);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: cardHeight,
                  height: cardHeight,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                      image:
                          DecorationImage(image: NetworkImage(data.imageURl))),
                ),
                Expanded(
                  child: Container(
                    height: cardHeight,
                    margin: const EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data.title,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis),
                            const SizedBox(height: 5),
                            Row(
                              children: List.generate(
                                  5,
                                  (index) => Icon(Icons.star_rounded,
                                      size: 20,
                                      color: index < data.rate
                                          ? Colors.amber
                                          : Colors.grey)),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 5),
                            const Text(
                              "start from",
                              style: TextStyle(fontSize: 12),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: "\$${data.price}",
                                      style: const TextStyle(
                                          fontSize: 25,
                                          color: Color(0xFF5f83e1),
                                          fontWeight: FontWeight.w900)),
                                  const TextSpan(
                                      text: '/Person',
                                      style: TextStyle(color: Colors.grey)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              margin: const EdgeInsets.only(top: 20),
              height: 35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFf2f2f2)),
              child: ListView(
                scrollDirection: Axis.horizontal,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BoletPointText(text: data.categories.join(",")),
                  BoletPointText(text: "${data.tourNumber} Tours"),
                  BoletPointText(text: "${data.capacity} Person")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BoletPointText extends StatelessWidget {
  final String text;
  const BoletPointText({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          children: [
            const TextSpan(
                text: "• ",
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
            TextSpan(
                text: text,
                style: const TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}

class DecorativeNavBar extends StatelessWidget {
  const DecorativeNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      height: 70,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppConsts.mainBlue,
                borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Row(
                children: const [
                  Icon(Icons.home_outlined, color: Colors.white),
                  Text(
                    ' Home',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          const Icon(
            Icons.notifications_outlined,
            color: Color(0xFFCACACA),
          ),
          const Icon(Icons.calendar_today_outlined, color: Color(0xFFCACACA)),
          const Icon(Icons.person_2_outlined, color: Color(0xFFCACACA))
        ],
      ),
    );
  }
}
