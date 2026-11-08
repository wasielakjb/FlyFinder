abstract class BaseError {}

sealed class FirebaseError extends BaseError {}

final class FirebasePermissionError extends FirebaseError {}

final class FirebaseNotFoundError extends FirebaseError {}

final class FirebaseUnavailableError extends FirebaseError {}

final class FirebaseTimeoutError extends FirebaseError {}

final class FirebaseUnknownError extends FirebaseError {}

final class DataParsingError extends BaseError {}

final class FormIncorrectRequestMapping extends BaseError {}
