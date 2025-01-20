// Mocks generated by Mockito 5.4.5 from annotations
// in flutter_task/test/features/items/data/datasources/item_remote_datasource_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:appwrite/appwrite.dart' as _i4;
import 'package:appwrite/models.dart' as _i3;
import 'package:appwrite/src/client.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeClient_0 extends _i1.SmartFake implements _i2.Client {
  _FakeClient_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeDocumentList_1 extends _i1.SmartFake implements _i3.DocumentList {
  _FakeDocumentList_1(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeDocument_2 extends _i1.SmartFake implements _i3.Document {
  _FakeDocument_2(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [Databases].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabases extends _i1.Mock implements _i4.Databases {
  MockDatabases() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Client get client =>
      (super.noSuchMethod(
            Invocation.getter(#client),
            returnValue: _FakeClient_0(this, Invocation.getter(#client)),
          )
          as _i2.Client);

  @override
  _i5.Future<_i3.DocumentList> listDocuments({
    required String? databaseId,
    required String? collectionId,
    List<String>? queries,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#listDocuments, [], {
              #databaseId: databaseId,
              #collectionId: collectionId,
              #queries: queries,
            }),
            returnValue: _i5.Future<_i3.DocumentList>.value(
              _FakeDocumentList_1(
                this,
                Invocation.method(#listDocuments, [], {
                  #databaseId: databaseId,
                  #collectionId: collectionId,
                  #queries: queries,
                }),
              ),
            ),
          )
          as _i5.Future<_i3.DocumentList>);

  @override
  _i5.Future<_i3.Document> createDocument({
    required String? databaseId,
    required String? collectionId,
    required String? documentId,
    required Map<dynamic, dynamic>? data,
    List<String>? permissions,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#createDocument, [], {
              #databaseId: databaseId,
              #collectionId: collectionId,
              #documentId: documentId,
              #data: data,
              #permissions: permissions,
            }),
            returnValue: _i5.Future<_i3.Document>.value(
              _FakeDocument_2(
                this,
                Invocation.method(#createDocument, [], {
                  #databaseId: databaseId,
                  #collectionId: collectionId,
                  #documentId: documentId,
                  #data: data,
                  #permissions: permissions,
                }),
              ),
            ),
          )
          as _i5.Future<_i3.Document>);

  @override
  _i5.Future<_i3.Document> getDocument({
    required String? databaseId,
    required String? collectionId,
    required String? documentId,
    List<String>? queries,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#getDocument, [], {
              #databaseId: databaseId,
              #collectionId: collectionId,
              #documentId: documentId,
              #queries: queries,
            }),
            returnValue: _i5.Future<_i3.Document>.value(
              _FakeDocument_2(
                this,
                Invocation.method(#getDocument, [], {
                  #databaseId: databaseId,
                  #collectionId: collectionId,
                  #documentId: documentId,
                  #queries: queries,
                }),
              ),
            ),
          )
          as _i5.Future<_i3.Document>);

  @override
  _i5.Future<_i3.Document> updateDocument({
    required String? databaseId,
    required String? collectionId,
    required String? documentId,
    Map<dynamic, dynamic>? data,
    List<String>? permissions,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#updateDocument, [], {
              #databaseId: databaseId,
              #collectionId: collectionId,
              #documentId: documentId,
              #data: data,
              #permissions: permissions,
            }),
            returnValue: _i5.Future<_i3.Document>.value(
              _FakeDocument_2(
                this,
                Invocation.method(#updateDocument, [], {
                  #databaseId: databaseId,
                  #collectionId: collectionId,
                  #documentId: documentId,
                  #data: data,
                  #permissions: permissions,
                }),
              ),
            ),
          )
          as _i5.Future<_i3.Document>);

  @override
  _i5.Future<dynamic> deleteDocument({
    required String? databaseId,
    required String? collectionId,
    required String? documentId,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#deleteDocument, [], {
              #databaseId: databaseId,
              #collectionId: collectionId,
              #documentId: documentId,
            }),
            returnValue: _i5.Future<dynamic>.value(),
          )
          as _i5.Future<dynamic>);
}
