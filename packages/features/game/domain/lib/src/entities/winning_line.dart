import 'package:meta/meta.dart';

/// Three aligned cells. Carried by a finished game so the UI can stroke the line
/// without working out the alignment again.
@immutable
class WinningLine {
  const WinningLine(this.first, this.second, this.third);

  final int first;
  final int second;
  final int third;

  List<int> get indexes => [first, second, third];

  bool contains(int index) => index == first || index == second || index == third;

  @override
  bool operator ==(Object other) =>
      other is WinningLine &&
      other.first == first &&
      other.second == second &&
      other.third == third;

  @override
  int get hashCode => Object.hash(first, second, third);

  @override
  String toString() => 'WinningLine($first, $second, $third)';
}
