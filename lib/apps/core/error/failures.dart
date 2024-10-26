abstract class Failure {
  final String message;

  Failure(this.message);
}

class SomeSpecificError extends Failure {
  SomeSpecificError(String message) : super(message);
}

class SomeSpecificErrorWithTitle extends SomeSpecificError {
  final String? title;
  SomeSpecificErrorWithTitle(this.title, super.message);
}
