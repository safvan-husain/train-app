//will use this for throwing error and later showing snack bar with this message.
class AppError extends Error {
  final String message;
  AppError(this.message);
}
