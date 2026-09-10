/// Local persistence for the scoreboard.
///
/// Only the repository implementation provider and the storage port leave the package —
/// the DTO, its mapper and the data source stay private.
library;

export 'src/data_sources/key_value_store.dart';
export 'src/providers.br.dart';
