import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/player_count.dart';
import '../../domain/entities/regional_distribution.dart';

part 'player_count_event.freezed.dart';

@freezed
sealed class PlayerCountEvent with _$PlayerCountEvent {
  const factory PlayerCountEvent.started() = PlayerCountStarted;
  const factory PlayerCountEvent.refreshRequested() = PlayerCountRefreshRequested;
  const factory PlayerCountEvent.retryRequested() = PlayerCountRetryRequested;
  const factory PlayerCountEvent.regionSelected(Region region) = PlayerCountRegionSelected;
  const factory PlayerCountEvent.autoRefreshToggled({required bool enabled}) =
      PlayerCountAutoRefreshToggled;
  const factory PlayerCountEvent.playerCountUpdated(Either<Failure, PlayerCount> result) =
      PlayerCountUpdated;
}
