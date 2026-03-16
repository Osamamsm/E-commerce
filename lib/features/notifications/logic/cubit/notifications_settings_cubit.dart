import 'package:e_commerce/core/notifications_service/push_notifications_service.dart';
import 'package:e_commerce/features/notifications/logic/cubit/notifications_settings_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class NotificationsSettingsCubit extends Cubit<NotificationsSettingsState> {
  final PushNotificationsService _service;

  NotificationsSettingsCubit(this._service)
    : super(
        NotificationsSettingsLoaded(
          promotionsEnabled: _service.isSubscribedToTopic('promotions'),
        ),
      );

  void setTopicSubscription(bool value, String topic) {
    value
        ? _service.subscribeToTopic(topic)
        : _service.unsubscribeFromTopic(topic);

    final current = state as NotificationsSettingsLoaded;
    //TODO : use a switch case for multiple topics
    if (topic == 'promotions') {
      emit(current.copyWith(promotionsEnabled: value));
    }
  }
}
