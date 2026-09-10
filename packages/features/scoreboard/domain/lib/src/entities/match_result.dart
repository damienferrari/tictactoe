/// How a finished game counted for the player.
///
/// This feature's own vocabulary: it deliberately says nothing about boards or marks,
/// which is what lets it stay independent of the game feature.
enum MatchResult { draw, loss, win }
