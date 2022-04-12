import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit.dart';
import 'package:travel_app/cubit/app_cubits_states.dart';
import 'package:travel_app/widgets/app_text.dart';

class HomePages extends StatefulWidget {
  const HomePages({Key? key}) : super(key: key);

  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> with TickerProviderStateMixin {
  var images = {
    "balloning.png": "Balloning",
    "hiking.png": "Hiking",
    "kayaking.png": "Kayaking",
    "snorkling.png": "Snorkling",
  };

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
        body: BlocBuilder<AppCubit, CubitsState>(builder: (context, state) {
      if (state is LoadedState) {
        var info = state.place;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //menu text
            Container(
              padding: const EdgeInsets.only(top: 70, left: 20),
              child: Row(
                children: [
                  Container(
                    child: IconButton(
                      icon: const Icon(Icons.menu_outlined),
                      onPressed: () {},
                      color: Colors.black54,
                      iconSize: 30,
                    ),
                  ),
                  Expanded(child: Container()),
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withOpacity(0.5)),
                  )
                ],
              ),
            ),
            const SizedBox(height: 15),
            //text
            Container(
              padding: const EdgeInsets.only(left: 30),
              child: AppLargeText(
                  text: "Discover",
                  colors: Colors.black54,
                  fontWeight: FontWeight.w100,
                  size: 33),
            ),
            const SizedBox(height: 15),
            //tabbar
            Container(
              child: TabBar(
                  labelPadding: const EdgeInsets.only(left: 30, right: 20),
                  isScrollable: true,
                  labelColor: Colors.black,
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.label,
                  unselectedLabelColor: Colors.grey,
                  indicator:
                      CircleTabbarIndication(color: Colors.purple, radius: 3),
                  tabs: const [
                    Tab(
                      text: "Places",
                    ),
                    Tab(
                      text: "Inspiration",
                    ),
                    Tab(
                      text: "Emotions",
                    ),
                  ]),
            ),
            const SizedBox(height: 10),
            //tabbarview
            Container(
              padding: const EdgeInsets.only(left: 30),
              width: double.maxFinite,
              height: 250,
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: info.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          margin: const EdgeInsets.only(right: 10),
                          height: 250,
                          width: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage("https://jsonplaceholder.typicode.com/posts" + info[index].img),
                              fit: BoxFit.cover,
                            ),
                          ));
                    },
                  ),
                  Text("hi"),
                  Text("hi")
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            //explore_more
            Container(
              padding: const EdgeInsets.only(left: 30, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppLargeText(
                    text: "Explore more",
                    colors: Colors.black54,
                    size: 20,
                  ),
                  Text(
                    "See all",
                    style: TextStyle(color: Colors.purple.shade200),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 18,
            ),
            //list menu
            Container(
              height: 120,
              width: double.maxFinite,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (_, index) {
                    return Column(children: [
                      Container(
                        margin: const EdgeInsets.only(right: 13, left: 30),
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey,
                            image: DecorationImage(
                                image: AssetImage(
                                    "img/" + images.keys.elementAt(index)))),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 18),
                        child: AppLargeText(
                          text: images.values.elementAt(index),
                          size: 14,
                          fontWeight: FontWeight.w100,
                          colors: Colors.black38,
                        ),
                      )
                    ]);
                  }),
            ),
          ],
        );
      } else {
        return Container();
      }
    }));
  }
}

class CircleTabbarIndication extends Decoration {
  final Color color;
  double radius;

  CircleTabbarIndication({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return CirclePainter(color: color, radius: radius);
  }
}

class CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 + radius * 2,
        configuration.size!.height / 2 + radius * 4);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
