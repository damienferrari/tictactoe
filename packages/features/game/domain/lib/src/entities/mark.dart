enum Mark {
  o('O'),
  x('X');

  const Mark(this.label);

  final String label;

  Mark get opponent => switch (this) {
    Mark.o => Mark.x,
    Mark.x => Mark.o,
  };
}
