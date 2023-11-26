sealed class InternetConnectionState {}

final class InternetConnectionInitial extends InternetConnectionState {}

final class InternetConnectedState extends InternetConnectionState {
  final String internetState;

  InternetConnectedState(this.internetState);
}

final class InternetNotConnectedState extends InternetConnectionState {
  final String internetState;

  InternetNotConnectedState(this.internetState);
}

