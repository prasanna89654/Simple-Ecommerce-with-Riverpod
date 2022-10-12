import 'package:flutter/material.dart';
import 'package:lafyuu/view/screens/login.dart';

class notfound extends StatefulWidget {
  notfound({Key? key}) : super(key: key);

  @override
  State<notfound> createState() => _notfoundState();
}

class _notfoundState extends State<notfound> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 160),
            Container(
              height: 300,
              width: double.infinity,
              // color: Colors.red,
              child: Column(
                children: [
                  Container(
                    height: 85,
                    width: 120,
                    decoration: BoxDecoration(
                        // color: Colors.green,
                        // border: Border.all(width: 2),
                        // borderRadius: BorderRadius.circular(180)),
                        ),
                    child: Image.asset(
                      "assets/images/notfound.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  // SizedBox(height: 5),
                  Container(
                    height: 40,
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    // color: Colors.blue,
                    child: Center(
                      child: Text("Product Not Found",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    height: 40,
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(30, 0, 20, 0),
                    // color: Colors.grey,
                    child: Center(
                      child: Text("thank you for shopping using lafyuu",
                          style: TextStyle(
                            fontSize: 14,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Container(
                    // color: Colors.green,
                    height: 60,
                    width: 350,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ));
                      },
                      child: Text(
                        "Back to Home",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
