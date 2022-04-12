import 'package:bloc/bloc.dart';
import 'package:travel_app/cubit/app_cubits_states.dart';
import 'package:travel_app/services/data_services.dart';

class AppCubit extends Cubit<CubitsState>{
  AppCubit({required this.data}) : super(InitialState()){
    emit(WelcomState());
  }
  final DataServices data;
  late final place;
  void getData() async {
    try{
      emit(LoadingState());
      place = await data.getInfo();
      emit(LoadedState(place));
    }catch(e){
      print(e);
    }
  }

}