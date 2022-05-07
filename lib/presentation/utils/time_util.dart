String millisToReadableTime(int millis) {
  if (millis <= 60 * 1000) {
    return '${millis ~/ 1000} seconds';
  }

  if (millis <= 60 * 60 * 1000) {
    return '${millis ~/ (1000 * 60)} minutes';
  }

  final minutes = millis ~/ (1000 * 60);
  final seconds = millis.remainder(1000 * 60);
  return '$minutes minutes, $seconds seconds';
}
