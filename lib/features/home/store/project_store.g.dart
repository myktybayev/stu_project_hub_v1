// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProjectStore on _ProjectStore, Store {
  Computed<List<ProjectModel>>? _$filteredProjectsComputed;

  @override
  List<ProjectModel> get filteredProjects =>
      (_$filteredProjectsComputed ??= Computed<List<ProjectModel>>(
            () => super.filteredProjects,
            name: '_ProjectStore.filteredProjects',
          ))
          .value;
  Computed<List<String>>? _$categoriesComputed;

  @override
  List<String> get categories =>
      (_$categoriesComputed ??= Computed<List<String>>(
            () => super.categories,
            name: '_ProjectStore.categories',
          ))
          .value;

  late final _$allProjectsAtom = Atom(
    name: '_ProjectStore.allProjects',
    context: context,
  );

  @override
  ObservableList<ProjectModel> get allProjects {
    _$allProjectsAtom.reportRead();
    return super.allProjects;
  }

  @override
  set allProjects(ObservableList<ProjectModel> value) {
    _$allProjectsAtom.reportWrite(value, super.allProjects, () {
      super.allProjects = value;
    });
  }

  late final _$selectedCategoryAtom = Atom(
    name: '_ProjectStore.selectedCategory',
    context: context,
  );

  @override
  String get selectedCategory {
    _$selectedCategoryAtom.reportRead();
    return super.selectedCategory;
  }

  @override
  set selectedCategory(String value) {
    _$selectedCategoryAtom.reportWrite(value, super.selectedCategory, () {
      super.selectedCategory = value;
    });
  }

  late final _$searchQueryAtom = Atom(
    name: '_ProjectStore.searchQuery',
    context: context,
  );

  @override
  String get searchQuery {
    _$searchQueryAtom.reportRead();
    return super.searchQuery;
  }

  @override
  set searchQuery(String value) {
    _$searchQueryAtom.reportWrite(value, super.searchQuery, () {
      super.searchQuery = value;
    });
  }

  late final _$_ProjectStoreActionController = ActionController(
    name: '_ProjectStore',
    context: context,
  );

  @override
  void setCategory(String cat) {
    final _$actionInfo = _$_ProjectStoreActionController.startAction(
      name: '_ProjectStore.setCategory',
    );
    try {
      return super.setCategory(cat);
    } finally {
      _$_ProjectStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearch(String val) {
    final _$actionInfo = _$_ProjectStoreActionController.startAction(
      name: '_ProjectStore.setSearch',
    );
    try {
      return super.setSearch(val);
    } finally {
      _$_ProjectStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
allProjects: ${allProjects},
selectedCategory: ${selectedCategory},
searchQuery: ${searchQuery},
filteredProjects: ${filteredProjects},
categories: ${categories}
    ''';
  }
}
