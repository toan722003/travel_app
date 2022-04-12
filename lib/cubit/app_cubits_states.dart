import 'package:equatable/equatable.dart';
import 'package:travel_app/model/date_model.dart';

abstract class CubitsState extends Equatable{

}

class InitialState extends CubitsState{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class WelcomState extends CubitsState{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class HomePageState extends CubitsState{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadingState extends CubitsState{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadedState extends CubitsState{
  final List<DataModel> place;
  LoadedState(this.place);
  @override
  // TODO: implement props
  List<Object> get props => [place];
}