import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String balance;
  const MyCard({Key? key, required this.balance}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF34AF8D),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'images/bank-logo.png',
                  height: 90,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  balance,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'CREDC',
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                const Text(
                  'IQD',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'CREDC',
                  ),
                ),
              ],
            ),
            Row(),
          ],
        ),
      ),
    );
  }
}

class TransWidget extends StatelessWidget {
  const TransWidget(
      {Key? key,
      required this.transTitle,
      required this.date,
      required this.price,
      required this.type})
      : super(key: key);
  final String transTitle;
  final String date;
  final String price;
  final int type;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                margin: const EdgeInsets.only(bottom: 10),
                child: (type == 0)
                    ? const Icon(
                        Icons.trending_up,
                        color: Color(0xFF34AF8D),
                      )
                    : const Icon(
                        Icons.trending_down,
                        color: Color(0xFFDC5D5B),
                      ),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transTitle,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        fontFamily: 'Nunito'),
                  ),
                  Text(
                    date,
                    style: const TextStyle(
                        fontSize: 12, color: Colors.grey, fontFamily: 'Nunito'),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Text(
                (type == 0) ? '+' : '-',
                style: TextStyle(
                  fontFamily: 'CREDC',
                  fontWeight: FontWeight.bold,
                  color: (type == 0) ? const Color(0xFF34AF8D) : const Color(0xFFDC5D5B),
                ),
              ),
              Text(
                price,
                style: TextStyle(
                  fontSize: 10,
                  fontFamily: 'CREDC',
                  color: (type == 0) ? const Color(0xFF34AF8D) : const Color(0xFFDC5D5B),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                ' IQD',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 12,
                  color: (type == 0) ? const Color(0xFF34AF8D) : const Color(0xFFDC5D5B),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
