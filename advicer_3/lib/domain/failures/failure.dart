sealed class Failure {}

class InvalidInputFailure extends Failure {}
class OutOfBounceFailure extends Failure {}

class ServerInternalFailure extends Failure {}
class UnknownFailure extends Failure {}
