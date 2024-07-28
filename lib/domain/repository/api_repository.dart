import 'package:pixelapp/data/models/pan_card_details_response_mode.dart';
import 'package:pixelapp/data/models/postal_code_response_model.dart';

abstract class ApiRepository{
  Future<PanCardDetailsResponseModel> verifyPanDetails(Map<String,dynamic> requestBody);
  Future<PostalCodeDetailsResponseModel> postalCodeDetails(Map<String,dynamic> requestBody);
}