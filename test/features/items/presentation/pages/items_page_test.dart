import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/request_state_enums.dart';
import 'package:flutter_task/features/items/domain/entities/item_entity.dart';
import 'package:flutter_task/features/items/presentation/controller/items_bloc.dart';
import 'package:flutter_task/features/items/presentation/controller/items_state.dart';
import 'package:flutter_task/features/items/presentation/pages/items_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

class MockItemsBloc extends Mock implements ItemsBloc {}
  @override
  ItemsState get state => ItemsState(); // Return a default ItemsState

void main() {
  late MockItemsBloc mockItemsBloc;

  setUp(() {
    mockItemsBloc = MockItemsBloc();
  });

  testWidgets('ItemsPage displays welcome card and load button',
      (WidgetTester tester) async {
    // Arrange
    when(mockItemsBloc.state).thenReturn(ItemsState());

    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<ItemsBloc>(
          create: (context) => mockItemsBloc,
          child: const ItemsPage(),
        ),
      ),
    );

    // Assert
    expect(find.text('welcome_lbl'.tr()), findsOneWidget);
    expect(find.text('click_button_lbl'.tr()), findsOneWidget);
    expect(find.text('load_data_btn_lbl'.tr()), findsOneWidget);
  });

  testWidgets('ItemsPage displays items when loaded',
      (WidgetTester tester) async {
    // Arrange
    final mockItems = [
      ItemEntity(id: '1', title: 'Item 1', description: 'Description 1'),
      ItemEntity(id: '2', title: 'Item 2', description: 'Description 2'),
    ];
    when(mockItemsBloc.state).thenReturn(ItemsState(
      items: mockItems,
      requestState: RequestStateEnums.loaded,
    ));

    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<ItemsBloc>(
          create: (context) => mockItemsBloc,
          child: const ItemsPage(),
        ),
      ),
    );

    // Assert
    expect(find.text('Item 1'), findsOneWidget);
    expect(find.text('Item 2'), findsOneWidget);
  });

  testWidgets('ItemsPage displays error message when error occurs',
      (WidgetTester tester) async {
    // Arrange
    when(mockItemsBloc.state).thenReturn(ItemsState(
      requestState: RequestStateEnums.error,
      errorMessage: 'Server error',
    ));

    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<ItemsBloc>(
          create: (context) => mockItemsBloc,
          child: const ItemsPage(),
        ),
      ),
    );

    // Assert
    expect(find.text('error_title'.tr()), findsOneWidget);
    expect(find.text('Server error'), findsOneWidget);
  });
}
