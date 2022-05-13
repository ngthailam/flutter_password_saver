String millisToReadableTime(int millis) {
  if (millis <= 60 * 1000) {
    return '${(millis / 1000).ceil()} seconds';
  }

  if (millis <= 60 * 60 * 1000) {
    return '${(millis / (1000 * 60)).ceil()} minutes';
  }

  final minutes = (millis / (1000 * 60)).ceil();
  final seconds = millis.remainder(1000 * 60);
  return '$minutes minutes, $seconds seconds';
}
