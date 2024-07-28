part of 'api_bloc.dart';

@immutable
abstract class ApiEvent {}

class VerifyPanCardDetailsEvent extends ApiEvent{
  final String panCard;
  VerifyPanCardDetailsEvent(this.panCard);
}

class VerifyPostalCodeDetailsEvent extends ApiEvent{
  final int postalCode;
  VerifyPostalCodeDetailsEvent(this.postalCode);
}
