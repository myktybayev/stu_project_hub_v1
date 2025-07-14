// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChallengeStore on _ChallengeStore, Store {
  Computed<List<String>>? _$statusesComputed;

  @override
  List<String> get statuses =>
      (_$statusesComputed ??= Computed<List<String>>(
            () => super.statuses,
            name: '_ChallengeStore.statuses',
          ))
          .value;
  Computed<List<ChallengeModel>>? _$filteredChallengesComputed;

  @override
  List<ChallengeModel> get filteredChallenges =>
      (_$filteredChallengesComputed ??= Computed<List<ChallengeModel>>(
            () => super.filteredChallenges,
            name: '_ChallengeStore.filteredChallenges',
          ))
          .value;

  late final _$allChallengesAtom = Atom(
    name: '_ChallengeStore.allChallenges',
    context: context,
  );

  @override
  ObservableList<ChallengeModel> get allChallenges {
    _$allChallengesAtom.reportRead();
    return super.allChallenges;
  }

  @override
  set allChallenges(ObservableList<ChallengeModel> value) {
    _$allChallengesAtom.reportWrite(value, super.allChallenges, () {
      super.allChallenges = value;
    });
  }

  late final _$searchAtom = Atom(
    name: '_ChallengeStore.search',
    context: context,
  );

  @override
  String get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(String value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
    });
  }

  late final _$selectedStatusAtom = Atom(
    name: '_ChallengeStore.selectedStatus',
    context: context,
  );

  @override
  String get selectedStatus {
    _$selectedStatusAtom.reportRead();
    return super.selectedStatus;
  }

  @override
  set selectedStatus(String value) {
    _$selectedStatusAtom.reportWrite(value, super.selectedStatus, () {
      super.selectedStatus = value;
    });
  }

  late final _$_ChallengeStoreActionController = ActionController(
    name: '_ChallengeStore',
    context: context,
  );

  @override
  void setSearch(String val) {
    final _$actionInfo = _$_ChallengeStoreActionController.startAction(
      name: '_ChallengeStore.setSearch',
    );
    try {
      return super.setSearch(val);
    } finally {
      _$_ChallengeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStatus(String status) {
    final _$actionInfo = _$_ChallengeStoreActionController.startAction(
      name: '_ChallengeStore.setStatus',
    );
    try {
      return super.setStatus(status);
    } finally {
      _$_ChallengeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
allChallenges: ${allChallenges},
search: ${search},
selectedStatus: ${selectedStatus},
statuses: ${statuses},
filteredChallenges: ${filteredChallenges}
    ''';
  }
}
