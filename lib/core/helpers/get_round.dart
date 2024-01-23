int getRound({
  bool isMinus = false,
  required int playersLen,
  required int round,
}) {
  int maxRound = (52 / playersLen).floor();
  int currentRound = round + 1;
  if (currentRound < maxRound) {
    return currentRound;
  }
  if (currentRound >= maxRound) {
    final res = currentRound - ((currentRound - maxRound) * 2);
    return isMinus ? res * -1 : res;
  }
  return 0;
}
