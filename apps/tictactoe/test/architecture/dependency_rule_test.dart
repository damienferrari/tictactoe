import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:yaml/yaml.dart';

/// Turns the architecture rules into a check instead of a promise.
///
/// Reading pubspecs rather than imports is deliberate: a package cannot import what it
/// does not declare, so the manifest is the tighter net — and it catches a forbidden
/// dependency the moment someone adds it, before any code uses it.
void main() {
  final root = _repositoryRoot();
  final packages = _workspacePackages(root);

  test('the workspace declares the packages this suite expects', () {
    expect(
      packages.keys,
      containsAll([
        'game_domain',
        'game_presentation',
        'scoreboard_data',
        'scoreboard_domain',
        'scoreboard_presentation',
        'tictactoe',
      ]),
    );
  });

  group('feature isolation', () {
    test('no feature package depends on another feature', () {
      for (final package in packages.values.where((package) => package.feature != null)) {
        final foreign = package.dependencies
            .map((name) => packages[name])
            .nonNulls
            .where((dependency) => dependency.feature != null)
            .where((dependency) => dependency.feature != package.feature)
            .map((dependency) => dependency.name);

        expect(
          foreign,
          isEmpty,
          reason:
              '${package.name} depends on $foreign, from another feature. Features talk '
              'through the composition layer, never directly.',
        );
      }
    });

    test('only the composition layer sees more than one feature', () {
      final seeing = <String, Set<String>>{};

      for (final package in packages.values) {
        final features = package.dependencies
            .map((name) => packages[name])
            .nonNulls
            .map((dependency) => dependency.feature)
            .nonNulls
            .toSet();
        if (features.length > 1) seeing[package.name] = features;
      }

      expect(seeing.keys, ['tictactoe'], reason: 'only the app may know both features');
    });
  });

  group('the dependency rule', () {
    test('a domain layer never depends on Flutter', () {
      for (final package in packages.values.where((package) => package.layer == 'domain')) {
        expect(
          package.dependencies,
          isNot(contains('flutter')),
          reason: '${package.name} is meant to be pure Dart, testable without a binding',
        );
      }
    });

    test('a presentation layer never depends on a data layer', () {
      for (final package in packages.values.where((package) => package.layer == 'presentation')) {
        final data = package.dependencies
            .map((name) => packages[name])
            .nonNulls
            .where((dependency) => dependency.layer == 'data')
            .map((dependency) => dependency.name);

        expect(
          data,
          isEmpty,
          reason: '${package.name} depends on $data. Presentation knows the domain only.',
        );
      }
    });

    test('a data layer never depends on a presentation layer', () {
      for (final package in packages.values.where((package) => package.layer == 'data')) {
        final presentation = package.dependencies
            .map((name) => packages[name])
            .nonNulls
            .where((dependency) => dependency.layer == 'presentation')
            .map((dependency) => dependency.name);

        expect(presentation, isEmpty, reason: '${package.name} depends on $presentation');
      }
    });
  });
}

class _Package {
  const _Package({
    required this.dependencies,
    required this.feature,
    required this.layer,
    required this.name,
  });

  final Set<String> dependencies;

  /// `game`, `scoreboard`, or null for the app and the utilities.
  final String? feature;

  /// `domain`, `data`, `presentation`, or null outside a feature.
  final String? layer;
  final String name;
}

Directory _repositoryRoot() {
  var directory = Directory.current;

  while (true) {
    final pubspec = File('${directory.path}/pubspec.yaml');
    if (pubspec.existsSync() && pubspec.readAsStringSync().contains('\nworkspace:')) {
      return directory;
    }

    final parent = directory.parent;
    if (parent.path == directory.path) {
      fail('no workspace root above ${Directory.current.path}');
    }
    directory = parent;
  }
}

Map<String, _Package> _workspacePackages(Directory root) {
  final manifest = loadYaml(File('${root.path}/pubspec.yaml').readAsStringSync()) as YamlMap;
  final members = (manifest['workspace'] as YamlList).cast<String>();
  final packages = <String, _Package>{};

  for (final member in members) {
    final pubspec =
        loadYaml(File('${root.path}/$member/pubspec.yaml').readAsStringSync()) as YamlMap;
    final segments = member.split('/');
    final isFeature = segments.length >= 4 && segments[1] == 'features';

    final name = pubspec['name'] as String;
    packages[name] = _Package(
      dependencies: {...?(pubspec['dependencies'] as YamlMap?)?.keys.cast<String>()},
      feature: isFeature ? segments[2] : null,
      layer: isFeature ? segments[3] : null,
      name: name,
    );
  }

  return packages;
}
