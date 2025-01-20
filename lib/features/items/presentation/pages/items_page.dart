import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/service_locator/injector.dart';
import '../../../../core/utils/request_state_enums.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_card_widget.dart';
import '../../../../core/widgets/custom_message_state_widget.dart';
import '../../../../core/widgets/custom_scaffold.dart';
import '../controller/items_bloc.dart';
import '../controller/items_event.dart';
import '../controller/items_state.dart';
import '../widgets/items_list.dart';

/// A page that displays a list of items and allows the user to load or reload the data.
///
/// This page uses the BLoC pattern to manage state and handle events related to fetching items.
/// It displays a welcome card with a button to load or reload data and shows the list of items
/// or an appropriate message state (e.g., loading, error, or no items).
class ItemsPage extends StatefulWidget {
  const ItemsPage({super.key});

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  final TextEditingController _searchController = TextEditingController();
  late final ItemsBloc _itemsBloc;

  @override
  void initState() {
    super.initState();
    _itemsBloc = sl<ItemsBloc>();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold<ItemsBloc, ItemsState>(
      bloc: _itemsBloc,
      appBar: CustomAppBar(
        title: 'items_dashboard_title'.tr(),
      ),
      body: BlocBuilder<ItemsBloc, ItemsState>(
        bloc: _itemsBloc,
        buildWhen: (previous, current) =>
        current.requestState != RequestStateEnums.loading ||
            previous.items.length != current.items.length,
        builder: (context, state) {
          return Column(
            children: [
              CardWidget(
                title: 'welcome_lbl'.tr(),
                body: 'click_button_lbl'.tr(),
                buttonText: state.items.isEmpty
                    ? 'load_data_btn_lbl'.tr()
                    : 'reload_data_btn_lbl'.tr(),
                icon: Icons.cloud_download,
                hasButton: true,
                onPressed: () {
                  _itemsBloc.add(const LoadItems());
                },
              ),
              Expanded(
                child: itemsBodyWidget(state: state),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget itemsBodyWidget({required ItemsState state}) {
    switch (state.requestState) {
      case RequestStateEnums.loaded:
        return ItemsList(
          items: state.items,
          hasReachedMax: state.hasReachedMax,
          onLoadMore: () {
            _itemsBloc.add(const LoadItems(isLoadMore: true));
          },
        );
      case RequestStateEnums.error:
        return ItemsList(
          items: state.items,
          hasReachedMax: state.hasReachedMax,
          onLoadMore: () {
            _itemsBloc.add(const LoadItems(isLoadMore: true));
          },
          messageStateWidget: MessageStateWidget(
            icon: Icons.error_outline,
            title: 'error_title'.tr(),
            description: state.errorMessage ?? 'An error occurred',
          ),
        );
      default:
        return Center(
          child: MessageStateWidget(
            icon: Icons.inbox_outlined,
            title: 'no_items_loaded_title'.tr(),
            description: 'no_items_loaded_description'.tr(),
          ),
        );
    }
  }
}