import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
// import 'package:lafyuu/view/widgets/recom.dart';

import '../../controller/riverpod_management.dart';
import '../widgets/app_bar.dart';
import '../widgets/listmaker.dart';

class flashscreen extends ConsumerWidget {
  const flashscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watchflashproduct = ref.watch(flashproductsRiverpod);
    var readflashproduct = ref.read(flashproductsRiverpod);

    var readflashfav = ref.watch(productRiverpod);
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(65.0),
          child: autoappbar(
            text: 'Super Flash Sale',
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      // height: 250,
                      width: 400,

                      child: Image.asset(
                        'assets/images/off.png',
                        fit: BoxFit.fill,
                        // height: 190,
                        // width: 400,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, top: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Super Flash Sale \n50% off ",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          SizedBox(height: 20),
                          TimerCountdown(
                            timeTextStyle: TextStyle(color: Colors.white),
                            colonsTextStyle: TextStyle(color: Colors.white),
                            descriptionTextStyle:
                                TextStyle(color: Colors.white),
                            format:
                                CountDownTimerFormat.daysHoursMinutesSeconds,
                            endTime: DateTime.now().add(
                              Duration(
                                days: 5,
                                hours: 14,
                                minutes: 27,
                                seconds: 34,
                              ),
                            ),
                            onEnd: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                  height: 600,
                  padding: const EdgeInsets.only(bottom: 40),
                  child: GridView.builder(
                      itemCount: readflashproduct.flashproducts.length,
                      // shrinkWrap: true,
                      padding: const EdgeInsets.fromLTRB(6, 0, 6, 52),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return listmaker(
                          productModels: watchflashproduct.flashproducts[index],
                          // setFav: () => readflashfav.setFavorite(
                          //     watchflashproduct.flashproducts[index]),
                          // setFav: null,
                        );
                      }))
            ],
          ),
        ));
  }
}
