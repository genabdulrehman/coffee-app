import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_text/circular_text/model.dart';
import 'package:flutter_circular_text/circular_text/widget.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    animation = Tween<double>(begin: 0, end: 340)
        .animate(CurvedAnimation(parent: controller, curve: Curves.bounceOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          // controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });

    // controller.forward();
  }

  int count = 0;
  bool isAnimate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 90,
                        child: CircularText(children: [
                          TextItem(
                            text: Text(
                              "Barista".toUpperCase(),
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.black,
                              ),
                            ),
                            space: 12,
                            startAngle: -90,
                            startAngleAlignment: StartAngleAlignment.center,
                            direction: CircularTextDirection.clockwise,
                          ),
                        ]),
                      ),
                      Positioned(
                        top: 50,
                        left: 170,
                        child: Text("C O F F E E",
                            style: GoogleFonts.roboto(
                              color: Color.fromARGB(255, 255, 128, 0),
                              fontWeight: FontWeight.w800,
                              wordSpacing: 5,
                              fontSize: 12,
                            )),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 320,
                          ),
                          count == 0
                              ? Text(
                                  "Americano",
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40,
                                    color: Colors.black,
                                  ),
                                )
                              : Flash(
                                  delay: Duration(seconds: 2),
                                  child: Text(
                                    "Latte",
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Drag Your Cuppa",
                            style: GoogleFonts.publicSans(
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          SizedBox(
                              height: 30,
                              width: 30,
                              child: Image.asset(
                                "assets/arrow.png",
                                color: Colors.grey,
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Positioned(
                            left: 20,
                            top: 20,
                            child: SizedBox(
                                // height: 400,
                                width: 400,
                                child: Image.asset(
                                  "assets/plate.png",
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: Image.asset(
                                    "assets/minus.png",
                                    color: Colors.grey,
                                  )),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                "${count}",
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 40,
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: Image.asset(
                                    "assets/plus.png",
                                    color: Colors.grey,
                                  )),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                  left: 100,
                  top: 30 + animation.value,
                  child: SizedBox(
                    height: 250,
                    width: 250,
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            count++;
                          });
                          controller.forward();
                        },
                        child: Image.asset("assets/cup2.png")),
                  ),
                ),
                Positioned(
                  left: 85,
                  top: 60,
                  child: SizedBox(
                    height: animation.value * 0.7,
                    width: animation.value * 0.7,
                    child: GestureDetector(
                        onTap: () {
                          controller.forward();
                        },
                        child: Image.asset("assets/cup5.png")),
                  ),
                ),
              ],
            ),

            // * cups
          ],
        ),
      ),
    );
  }
}
