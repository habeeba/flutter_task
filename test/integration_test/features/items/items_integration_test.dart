import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/request_state_enums.dart';
import 'package:flutter_task/features/items/domain/entities/item_entity.dart';
import 'package:flutter_task/features/items/presentation/controller/items_bloc.dart';
import 'package:flutter_task/features/items/presentation/controller/items_state.dart';
import 'package:flutter_task/features/items/presentation/pages/items_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Full flow: Load items and handle error', (WidgetTester tester) async {
    // Arrange
    final mockItems = [
      ItemEntity(id: '1', title: 'Item 1', description: 'Description 1'),
      ItemEntity(id: '2', title: 'Item 2', description: 'Description 2'),
    ];

    // Mock ItemsBloc
    final mockItemsBloc = MockItemsBloc();

    // Mock the state property to return a valid ItemsState
    when(mockItemsBloc.state).thenReturn(ItemsState(
      items: mockItems,
      requestState: RequestStateEnums.loaded,
    ));

    // Act: Pump the app with the mock ItemsBloc
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<ItemsBloc>(
          create: (context) => mockItemsBloc,
          child: const ItemsPage(),
        ),
      ),
    );

    // Assert: Verify items are displayed
    expect(find.text('Item 1'), findsOneWidget);
    expect(find.text('Item 2'), findsOneWidget);

    // Act: Simulate an error state
    when(mockItemsBloc.state).thenReturn(ItemsState(
      requestState: RequestStateEnums.error,
      errorMessage: 'Server error',
    ));
    await tester.pump();

    // Assert: Verify error message is displayed
    expect(find.text('Server error'), findsOneWidget);
  });
}

// Mock ItemsBloc for testing
class MockItemsBloc extends Mock implements ItemsBloc {
  // Override the state property to return a valid ItemsState by default
  @override
  ItemsState get state => ItemsState();
}
