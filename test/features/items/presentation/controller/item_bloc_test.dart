import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_task/core/errors/failures.dart';
import 'package:flutter_task/core/utils/request_state_enums.dart';
import 'package:flutter_task/features/items/domain/entities/item_entity.dart';
import 'package:flutter_task/features/items/domain/usecases/get_items_usecase.dart';
import 'package:flutter_task/features/items/presentation/controller/items_bloc.dart';
import 'package:flutter_task/features/items/presentation/controller/items_event.dart';
import 'package:flutter_task/features/items/presentation/controller/items_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'item_bloc_test.mocks.dart';

@GenerateMocks([GetItemsUseCase])
void main() {
  late ItemsBloc itemsBloc;
  late MockGetItemsUseCase mockGetItemsUseCase;

  setUp(() {
    mockGetItemsUseCase = MockGetItemsUseCase();
    itemsBloc = ItemsBloc(mockGetItemsUseCase);
  });

  group('ItemsBloc', () {
    const testItems = [
      ItemEntity(id: '1', title: 'Item 1', description: 'Description 1'),
      ItemEntity(id: '2', title: 'Item 2', description: 'Description 2'),
    ];

    test('initial state is ItemsState', () {
      expect(itemsBloc.state, ItemsState());
    });

    blocTest<ItemsBloc, ItemsState>(
      'emits [loading, loaded] when LoadItems is added and items are fetched successfully',
      build: () {
        when(mockGetItemsUseCase.call(any))
            .thenAnswer((_) async => Right((testItems, 1)));
        return itemsBloc;
      },
      act: (bloc) => bloc.add(const LoadItems()),
      expect: () => [
        ItemsState(requestState: RequestStateEnums.loading),
        ItemsState(
          items: testItems,
          requestState: RequestStateEnums.loaded,
        ),
      ],
    );

    blocTest<ItemsBloc, ItemsState>(
      'emits [loading, error] when LoadItems is added and fetching items fails',
      build: () {
        when(mockGetItemsUseCase.call(any))
            .thenAnswer((_) async => Left(ServerFailure('Server error')));
        return itemsBloc;
      },
      act: (bloc) => bloc.add(const LoadItems()),
      expect: () => [
        ItemsState(requestState: RequestStateEnums.loading),
        ItemsState(
          requestState: RequestStateEnums.error,
          errorMessage: 'Server error',
        ),
      ],
    );

    blocTest<ItemsBloc, ItemsState>(
      'emits [loading, error] when LoadItems is added and an exception occurs',
      build: () {
        when(mockGetItemsUseCase.call(any))
            .thenThrow(Exception('Unexpected error'));
        return itemsBloc;
      },
      act: (bloc) => bloc.add(const LoadItems()),
      expect: () => [
        ItemsState(requestState: RequestStateEnums.loading),
        ItemsState(
          requestState: RequestStateEnums.error,
          errorMessage: 'Exception: Unexpected error',
        ),
      ],
    );
  });
}
