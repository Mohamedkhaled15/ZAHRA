import 'package:bloc/bloc.dart';

import 'state.dart';

class NotificationBlocCubit extends Cubit<NotificationBlocState> {
  NotificationBlocCubit() : super(NotificationBlocState().init());
}
