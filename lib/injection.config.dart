// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'module/dashboard/controller/dashboard_controller.dart' as _i3;
import 'module/main_navigation/controller/main_navigation_controller.dart'
    as _i4;
import 'module/order/controller/order_controller.dart' as _i5;
import 'module/profile/controller/profile_controller.dart' as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.DashboardController>(_i3.DashboardController());
    gh.singleton<_i4.MainNavigationController>(_i4.MainNavigationController());
    gh.singleton<_i5.OrderController>(_i5.OrderController());
    gh.singleton<_i6.ProfileController>(_i6.ProfileController());
    return this;
  }
}
