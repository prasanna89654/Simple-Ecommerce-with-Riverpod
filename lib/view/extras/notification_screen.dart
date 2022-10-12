import 'package:flutter/material.dart';
import 'package:lafyuu/view/widgets/app_bar.dart';

class nscreen extends StatefulWidget {
  nscreen({Key? key}) : super(key: key);

  @override
  State<nscreen> createState() => _nscreenState();
}

class _nscreenState extends State<nscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65.0),
          child: autoappbar(text: "Notifications")),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 0),
            Container(
                height: 300,
                // color: Colors.red,
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: ListView(
                  children: [
                    ListTile(
                      title: const Text(
                        'Offer',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      leading: ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxHeight: 30,
                          // s,
                          // minHeight: 40,
                          // minWidth: 40,
                        ),
                        child: Image.asset(
                          'assets/images/offers.png',
                          color: Colors.blue,
                        ),
                      ),
                      onTap: () {},
                    ),
                    const SizedBox(height: 3),
                    ListTile(
                      title: const Text('Feed',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      onTap: () {},
                      leading: ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxHeight: 30,
                          // s,
                          // minHeight: 40,
                          // minWidth: 40,
                        ),
                        child: Image.asset(
                          'assets/images/feed.png',
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    const SizedBox(height: 3),
                    ListTile(
                      title: const Text(
                        'Activity',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      onTap: () {},
                      leading: ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxHeight: 30,
                          // s,
                          // minHeight: 40,
                          // minWidth: 40,
                        ),
                        child: Image.asset(
                          'assets/images/noti.png',
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
