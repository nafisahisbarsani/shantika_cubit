import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationSetCubit extends Cubit<Map<String, bool>> {
  NotificationSetCubit()
      : super({
    'activity': false,
    'special': false,
    'reminder': false,
  });

  void toggle(String key, bool value) {
    emit({...state, key: value});
  }
}
