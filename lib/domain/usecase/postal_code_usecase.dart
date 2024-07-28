import 'package:pixelapp/data/models/pan_card_details_response_mode.dart';
import 'package:pixelapp/data/models/postal_code_response_model.dart';
import 'package:pixelapp/domain/entity/pan_card_details_request_model.dart';
import 'package:pixelapp/domain/repository/api_repository.dart';
import 'package:pixelapp/domain/usecase/usecase.dart';

import '../entity/postal_code_details_request_model.dart';

class PostalCodeDetailsUseCase extends UseCase<PostalCodeDetailsResponseModel,PostalCodeDetailsRequestModel>{
  final ApiRepository apiRepository;
  PostalCodeDetailsUseCase(this.apiRepository);

  @override
  Future<PostalCodeDetailsResponseModel> call(PostalCodeDetailsRequestModel params)async {
    return await apiRepository.postalCodeDetails(params.toJson());
  }
}