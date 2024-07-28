import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pixelapp/data/models/postal_code_response_model.dart';
import 'package:pixelapp/data/remote_data_source/api_remote_data_source.dart';
import 'package:pixelapp/data/repository/api_repository_impl.dart';
import 'package:pixelapp/domain/entity/postal_code_details_request_model.dart';
import 'package:pixelapp/domain/usecase/api_usecase.dart';
import 'package:pixelapp/domain/usecase/postal_code_usecase.dart';

import '../../data/models/pan_card_details_response_mode.dart';
import 'package:http/http.dart';

import '../../domain/entity/pan_card_details_request_model.dart';
part 'api_event.dart';
part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  ApiBloc() : super(ApiInitial()) {
    on<ApiEvent>((event, emit) {});
    on<VerifyPanCardDetailsEvent>((event, emit) async {
      emit(VerifyPanCardDetailsLoadingState());
      var data = await VerifyPanDetailsUseCase(ApiRepositoryImpl(ApiRemoteDataSourceImpl(Client()))).call(PanCardDetailsRequestModel(panNumber: event.panCard));
      emit(VerifyPanCardDetailsLoadedState(responseModel: data));
    });
    on<VerifyPostalCodeDetailsEvent>((event, emit) async {
      emit(PostalCodeDetailsLoadingState());
      var data = await PostalCodeDetailsUseCase(ApiRepositoryImpl(ApiRemoteDataSourceImpl(Client()))).call(PostalCodeDetailsRequestModel(postcode: event.postalCode));
      print(data.city!.first.name);
      List<String> cityList = [];
      for(int i = 0;i<data.city!.length;i++){
        cityList.add(data.city![i].name.toString());
      }
      List<String> stateList = [];
      for(int i = 0;i<data.city!.length;i++){
        stateList.add(data.state![i].name.toString());
      }
      emit(PostalCodeDetailsLoadedState(responseModel: data,city: cityList,state: stateList));
    });
  }
}
