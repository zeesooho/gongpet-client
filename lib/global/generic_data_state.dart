import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'generic_data_state.freezed.dart';

@freezed
class GenericDataState<T> with _$GenericDataState<T> {
  const factory GenericDataState.initial() = _Initial<T>;
  const factory GenericDataState.loading() = _Loading<T>;
  const factory GenericDataState.success(T data) = _Success<T>;
  const factory GenericDataState.error(Object error) = _Error<T>;
}

class GenericDataStateNotifier<T> extends StateNotifier<GenericDataState<T>> {
  GenericDataStateNotifier() : super(const GenericDataState.initial());

  void setLoading() {
    state = const GenericDataState.loading();
  }

  void setSuccess(T data) {
    state = GenericDataState.success(data);
  }

  void setError(Object error) {
    state = GenericDataState.error(error);
  }
}
