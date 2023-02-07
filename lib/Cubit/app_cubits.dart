import 'package:bloc/bloc.dart';
import 'package:travel/Cubit/app_cubit_states.dart';
import 'package:travel/model/data_model.dart';
import 'package:travel/services/dataServices.dart';

class AppCubits extends Cubit<CubitStates>{
  AppCubits({required this.data}) :super(InitialStates()){
        emit(WelcomeState());

  }
  final DataServices data;
  late final places;
  void getData()async{
       try {
         emit(LoadingState());
         places=await data.getInfo();
         emit(LoadedState(places));
       } catch (e) {
         print(e);
                emit(WelcomeState());
       }


  }
  void getDetailsOfOnePlace(DataModel data){
   emit(DetailState(data));
   print('fdsg');
  }
  void goHome(){
    emit(LoadedState(places));
  }

}