import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_button.dart';
import 'package:travel_app/widgets/app_text.dart';
import '../widgets/reponsive_button.dart';

class DetialPage extends StatefulWidget {
  const DetialPage({Key? key}) : super(key: key);

  @override
  _DetialPageState createState() => _DetialPageState();
}

class _DetialPageState extends State<DetialPage> {
  int countStart = 4;
  int checkColor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.maxFinite,
      height: double.maxFinite,
      child: Stack(
        children: [
          Positioned(
            child: Container(
              width: double.maxFinite,
              height: 310,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("img/yosemite.png"), fit: BoxFit.cover),
              ),
            ),
          ),
          Positioned(
              left: 20,
              top: 50,
              child: Row(
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
                ],
              )),
          Positioned(
              top: 280,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(
                          30,
                        ))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(
                          text: "Yosemite",
                          colors: Colors.black54,
                          fontWeight: FontWeight.w300,
                        ),
                        AppLargeText(
                          text: "\$ 250",
                          colors: Colors.purple.shade100,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Colors.purple.shade100,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "USA, California",
                          style: TextStyle(
                              color: Colors.purple.shade100, fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) {
                            return Icon(
                              Icons.star,
                              color: index < countStart
                                  ? Colors.yellowAccent.shade400
                                  : Colors.grey.shade400,
                            );
                          }),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text("(4.0)"),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(
                          text: "People",
                          colors: Colors.black54,
                          fontWeight: FontWeight.w400,
                        ),
                        AppLargeText(
                          text: "Number of people in your group",
                          colors: Colors.black54,
                          size: 14,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Wrap(
                      children: List.generate(5, (index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              checkColor = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: AppButtons(
                              color: Colors.black,
                              backgroundColor: checkColor == index
                                  ? Colors.black54
                                  : Colors.grey.shade300,
                              borderColor: Colors.grey.shade300,
                              size: 50,
                              isIcon: true,
                              text: (index + 1).toString(),
                              icon: Icons.favorite_outline_outlined,
                            ),
                          ),
                        );
                      }),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AppLargeText(
                      text: "Description",
                      colors: Colors.black54,
                      fontWeight: FontWeight.w100,
                      size: 25,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    AppLargeText(
                      text:
                          "Yosemite National Park is located in the central Sierra Nevada of California . "
                          "It is located nears the wild protected areas",
                      colors: Colors.black54,
                      fontWeight: FontWeight.w100,
                      size: 15,
                    ),
                  ],
                ),
              )),
          Positioned(
              left: 20,
              bottom: 10,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppButtons(
                    color: Colors.black54,
                    backgroundColor: Colors.grey.shade300,
                    borderColor: Colors.grey.shade300,
                    size: 50,
                    icon: Icons.favorite_outline_outlined,
                  ),
                  SizedBox(width: 20,),
                  ResponsiveButton(
                    colors: Colors.purple.shade400,
                    width: 250,
                    height: 50,
                    isResponsive: false,
                  ),
                ],
              ))
        ],
      ),
    ));
  }
}
