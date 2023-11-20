import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/service/db_service/db_service.dart';
import '../state/login_state.dart';

mixin _CubitLifecycle {
  void initState() {}
  void dispose() {}
}

class LoginController extends Cubit<LoginState> with _CubitLifecycle {
  LoginController() : super(LoginState());

  @override
  void initState() {
    //initState event
    state.email = DBService.get("email");
    super.initState();
  }

  @override
  void dispose() {
    //dispose event
    super.dispose();
  }

  @override
  Future<void> close() {
    dispose();
    return super.close();
  }

  increment() {
    state.counter++;
    emit(state.copyWith());
  }

  login() async {
    Get.offAll(MainNavigationView());
  }
}
