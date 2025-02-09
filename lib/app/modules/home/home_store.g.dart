// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$bottomNavPageTypeAtom =
      Atom(name: 'HomeStoreBase.bottomNavPageType', context: context);

  @override
  BottomNavPageType get bottomNavPageType {
    _$bottomNavPageTypeAtom.reportRead();
    return super.bottomNavPageType;
  }

  @override
  set bottomNavPageType(BottomNavPageType value) {
    _$bottomNavPageTypeAtom.reportWrite(value, super.bottomNavPageType, () {
      super.bottomNavPageType = value;
    });
  }

  late final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase', context: context);

  @override
  dynamic setBottomNavPageType(BottomNavPageType value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setBottomNavPageType');
    try {
      return super.setBottomNavPageType(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
bottomNavPageType: ${bottomNavPageType}
    ''';
  }
}
