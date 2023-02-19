import 'package:flutter/material.dart';
import 'package:travel_app_example/models/destination.dart';

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
    return GestureDetector(
      onTap: () {
        ontap(data);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        // height: 150,
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                      image:
                          DecorationImage(image: NetworkImage(data.imageURl))),
                ),
                Expanded(
                  child: Container(
                    height: 150,
                    // color: Colors.brown,
                    margin: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data.title,
                                style: const TextStyle(fontSize: 20),
                                overflow: TextOverflow.ellipsis),
                            const SizedBox(height: 10),
                            Row(
                              children: List.generate(
                                  5,
                                  (index) => Icon(Icons.star_border,
                                      color: index < data.rate
                                          ? Colors.amber
                                          : Colors.black)),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("start from"),
                            const SizedBox(height: 10),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: "\$ ${data.price}",
                                      style: const TextStyle(
                                          fontSize: 30,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold)),
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
              margin: const EdgeInsets.only(top: 10),
              height: 35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFf2f2f2)),
              child: Row(
                children: data.categories
                    .map((category) => BoletPointText(text: category))
                    .toList(),
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
        text: TextSpan(
          children: [
            const TextSpan(
                text: "● ",
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
            TextSpan(text: text, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
