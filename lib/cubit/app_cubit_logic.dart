import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit.dart';
import 'package:travel_app/cubit/app_cubits_states.dart';
import 'package:travel_app/pages/home_pages.dart';
import 'package:travel_app/pages/welcom_page.dart';

class AppCubitLogic extends StatefulWidget {
  const AppCubitLogic({Key? key}) : super(key: key);

  @override
  _AppCubitLogicState createState() => _AppCubitLogicState();
}

class _AppCubitLogicState extends State<AppCubitLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubit, CubitsState>(builder: (context, state) {
        if (state is WelcomState) {
          return WelcomPage();
        }
        if (state is LoadedState) {
          return HomePages();
        }
        if(state is LoadingState){
          return Center(child: CircularProgressIndicator());
        }else{
          return Container();
        }
      }),
    );
  }
}
