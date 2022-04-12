import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/reponsive_button.dart';

class WelcomPage extends StatefulWidget {
  const WelcomPage({Key? key}) : super(key: key);

  @override
  _WelcomPageState createState() => _WelcomPageState();
}

class _WelcomPageState extends State<WelcomPage> {
  List<String> images = [
    "welcom_one.png",
    "welcom_two.png",
    "welcom_three.png"
  ];
  int _currenterIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          itemCount: images.length,
          scrollDirection: Axis.vertical,
          onPageChanged: (index) {
            setState(() {
              _currenterIndex = index;
            });
          },
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("img/" + images[index]),
                      fit: BoxFit.cover)),
              child: Container(
                padding: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(
                            text: 'Trips', fontWeight: FontWeight.bold),
                        AppLargeText(
                            text: 'Mountain', fontWeight: FontWeight.w100),
                        SizedBox(height: 20),
                        Container(
                          width: 250,
                          child: AppLargeText(
                            text:
                                "Mountains hikes give you an incredible sense of freedom along with endurance text",
                            size: 14,
                            colors: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 32),
                        GestureDetector(
                          onTap: (){
                            BlocProvider.of<AppCubit>(context).getData();
                          },
                          child: Container(
                            child: ResponsiveButton(width: 80,colors: Colors.purple.shade400,isResponsive: true,),
                          ),
                        )
                      ],
                    ),
                    Column(
                        children: List.generate(3, (index) {
                      return Container(
                        width: 6,
                        height: index == _currenterIndex ? 25 : 8,
                        margin: const EdgeInsets.only(bottom: 2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: index == _currenterIndex
                                ? Colors.purple
                                : Colors.white70.withOpacity(0.3)),
                      );
                    })),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
