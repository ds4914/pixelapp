part of 'api_bloc.dart';

@immutable
abstract class ApiState {}

final class ApiInitial extends ApiState {}

class VerifyPanCardDetailsLoadingState extends ApiState{}


class VerifyPanCardDetailsLoadedState extends ApiState{
  final PanCardDetailsResponseModel responseModel;

  VerifyPanCardDetailsLoadedState({required this.responseModel});
}

class PostalCodeDetailsLoadingState extends ApiState{}

class PostalCodeDetailsLoadedState extends ApiState{
  final PostalCodeDetailsResponseModel responseModel;
  PostalCodeDetailsLoadedState({required this.responseModel});
}

