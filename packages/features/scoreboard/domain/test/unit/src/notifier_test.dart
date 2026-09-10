import 'package:riverpod/riverpod.dart';
import 'package:scoreboard_domain/scoreboard_domain.dart';
import 'package:test/test.dart';

class _InMemoryRepository implements ScoreboardRepository {
  _InMemoryRepository([this.stored = Scoreboard.empty]);

  Scoreboard stored;

  @override
  Future<Scoreboard> read() async => stored;

  @override
  Future<void> write(Scoreboard scoreboard) async => stored = scoreboard;
}

ProviderContainer _containerWith(_InMemoryRepository repository) {
  final container = ProviderContainer(
    overrides: bindProviders(repository: Provider<ScoreboardRepository>((_) => repository)),
  );
  addTearDown(container.dispose);

  return container;
}

void main() {
  test('the tally shown at startup is the persisted one', () async {
    final container = _containerWith(_InMemoryRepository(const Scoreboard(losses: 4)));

    expect(await container.read(scoreboardProvider.future), const Scoreboard(losses: 4));
  });

  test('recording a result updates what the screen reads, without a reload', () async {
    final container = _containerWith(_InMemoryRepository());
    // A subscription keeps the notifier alive across the awaits, which would otherwise
    // be free to dispose between the two reads.
    final subscription = container.listen(scoreboardProvider, (_, _) {});
    addTearDown(subscription.close);

    await container.read(scoreboardProvider.future);
    await container.read(recordMatchProvider)(MatchResult.win);

    expect(container.read(scoreboardProvider).value, const Scoreboard(wins: 1));
  });
}
