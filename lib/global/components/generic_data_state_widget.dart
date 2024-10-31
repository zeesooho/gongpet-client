import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gongpet/global/generic_data_state.dart';

class GenericDataStateWidget<T> extends ConsumerStatefulWidget {
  final Future<T> Function() fetchData;
  final StateNotifierProvider<GenericDataStateNotifier<T>, GenericDataState<T>>? provider;
  final Widget Function() initialWidget;
  final Widget Function() loadingWidget;
  final Widget Function(T data) successWidget;
  final Widget Function(Object error) errorWidget;
  final bool fetchOnInit;

  const GenericDataStateWidget({
    Key? key,
    required this.fetchData,
    required this.initialWidget,
    required this.loadingWidget,
    required this.successWidget,
    required this.errorWidget,
    this.provider,
    this.fetchOnInit = true,
  }) : super(key: key);

  @override
  ConsumerState<GenericDataStateWidget<T>> createState() => _GenericDataStateWidgetState<T>();
}

class _GenericDataStateWidgetState<T> extends ConsumerState<GenericDataStateWidget<T>> {
  late final StateNotifierProvider<GenericDataStateNotifier<T>, GenericDataState<T>> provider;

  @override
  void initState() {
    super.initState();
    provider = widget.provider ?? StateNotifierProvider((ref) => GenericDataStateNotifier<T>());
    if (widget.fetchOnInit) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _fetchData());
    }
  }

  Future<void> _fetchData() async {
    final notifier = ref.read(provider.notifier);
    notifier.setLoading();
    try {
      final data = await widget.fetchData();
      notifier.setSuccess(data);
    } catch (e) {
      notifier.setError(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(provider);
    return state.when(
      initial: widget.initialWidget,
      loading: widget.loadingWidget,
      success: widget.successWidget,
      error: widget.errorWidget,
    );
  }
}
