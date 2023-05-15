import 'package:flutter_template/presentation/common/base_status/base_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const ProfileState._();

  factory ProfileState({
    required BaseStatus status,
    required String name,
  }) = _ProfileState;

  factory ProfileState.initial() {
    return ProfileState(
      status: const BaseStatus.initial(),
      name: '',
    );
  }
}
