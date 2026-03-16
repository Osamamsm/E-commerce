abstract class NotificationsSettingsState {}

class NotificationsSettingsLoaded extends NotificationsSettingsState {
  final bool promotionsEnabled;
  // TODO
  // later: final bool ordersEnabled;
  // later: final bool wishlistEnabled;

  NotificationsSettingsLoaded({
    required this.promotionsEnabled,
  });

  NotificationsSettingsLoaded copyWith({bool? promotionsEnabled}) {
    return NotificationsSettingsLoaded(
      promotionsEnabled: promotionsEnabled ?? this.promotionsEnabled,
    );
  }
}