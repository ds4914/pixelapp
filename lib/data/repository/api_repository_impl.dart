import 'package:pixelapp/data/models/pan_card_details_response_mode.dart';
import 'package:pixelapp/data/models/postal_code_response_model.dart';
import 'package:pixelapp/data/remote_data_source/api_remote_data_source.dart';
import 'package:pixelapp/domain/repository/api_repository.dart';

class ApiRepositoryImpl extends ApiRepository{
  final ApiRemoteDataSource apiRemoteDataSource;
  ApiRepositoryImpl(this.apiRemoteDataSource);

  @override
  Future<PanCardDetailsResponseModel> verifyPanDetails(Map<String, dynamic> requestBody)async {
   final response = await apiRemoteDataSource.verifyPanDetails(requestBody);
   return response;
  }

  @override
  Future<PostalCodeDetailsResponseModel> postalCodeDetails(Map<String, dynamic> requestBody)async {
  return await apiRemoteDataSource.postalCodeDetails(requestBody);
  }
}