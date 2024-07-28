import 'package:pixelapp/data/models/pan_card_details_response_mode.dart';
import 'package:pixelapp/domain/entity/pan_card_details_request_model.dart';
import 'package:pixelapp/domain/repository/api_repository.dart';
import 'package:pixelapp/domain/usecase/usecase.dart';

class VerifyPanDetailsUseCase extends UseCase<PanCardDetailsResponseModel,PanCardDetailsRequestModel>{
  final ApiRepository apiRepository;
  VerifyPanDetailsUseCase(this.apiRepository);

  @override
  Future<PanCardDetailsResponseModel> call(PanCardDetailsRequestModel params)async {
   return await apiRepository.verifyPanDetails(params.toJson());
  }
}