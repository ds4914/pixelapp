import "dart:convert";

import "package:http/http.dart";
import "package:pixelapp/constants/api_constants.dart";
import "package:pixelapp/data/models/pan_card_details_response_mode.dart";
import "package:pixelapp/data/models/postal_code_response_model.dart";

abstract class ApiRemoteDataSource {
  Future<PanCardDetailsResponseModel> verifyPanDetails(Map<String,dynamic> requestBody);
  Future<PostalCodeDetailsResponseModel> postalCodeDetails(Map<String,dynamic> requestBody);
}


class ApiRemoteDataSourceImpl extends ApiRemoteDataSource{
  final Client _client;
  ApiRemoteDataSourceImpl(this._client);
  @override
  Future<PanCardDetailsResponseModel> verifyPanDetails(Map<String, dynamic> requestBody)async {
    final response = await _client.post(Uri.parse(ApiConstants.verifyPanAPI),body: jsonEncode(requestBody));
    final verifyPanDetailsModel = panCardDetailsResponseModelFromJson(response.body);
    return verifyPanDetailsModel;
  }

  @override
  Future<PostalCodeDetailsResponseModel> postalCodeDetails(Map<String, dynamic> requestBody)async {
    final response = await _client.post(Uri.parse(ApiConstants.postCodeAPI),body: jsonEncode(requestBody));
    final postalCodeModel = postalCodeDetailsResponseModelFromJson(response.body);
    return postalCodeModel;
  }
}