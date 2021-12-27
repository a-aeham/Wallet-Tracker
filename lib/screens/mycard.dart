import 'package:flutter/material.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:wallet/widgets.dart';

class MyCardInfos extends StatefulWidget {
  const MyCardInfos({Key? key}) : super(key: key);

  @override
  _MyCardInfosState createState() => _MyCardInfosState();
}

class _MyCardInfosState extends State<MyCardInfos> {
  String balance = '0';

  @override
  void initState() {
    tz.initializeTimeZones();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E7E0),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFE5E7E0),
        title: const Text(
          'My Card',
          style: TextStyle(
            fontFamily: 'nunito',
            fontWeight: FontWeight.bold,
            color: Colors.teal,
          ),
        ),
      ),
      body: Builder(builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyCard(balance: balance),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Transactions',
                        style: TextStyle(
                          color: Colors.teal[700],
                          fontFamily: 'Nunito',
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.5,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          width: 5,
                          color: Colors.teal.shade50,
                        ),
                      ),
                    ),
                    child: FutureBuilder<List<TransModel>>(
                      future: DatabaseHelper.instance.getTrans(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<TransModel>> snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(child: Text('Loading...'));
                        }
                        return snapshot.data!.isEmpty
                            ? const Center(
                                child:  Text('No Transactions yet !!'),
                              )
                            : Scrollbar(
                                child: ListView(
                                  children: snapshot.data!.map((trans) {
                                    return Center(
                                      child: Column(
                                        children: [
                                          TransWidget(
                                              transTitle: trans.name,
                                              date: trans.date,
                                              price: trans.price,
                                              type: trans.type),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
