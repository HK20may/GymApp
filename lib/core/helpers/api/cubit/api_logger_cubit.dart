import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wtf_gym_assignment/core/helpers/api/api_logging_interceptor.dart';

part 'api_logger_state.dart';

class ApiLoggerCubit extends Cubit<ApiLoggerState> {
  ApiLoggerCubit() : super(ApiLoggerInitial());

  List<ApiLoggerModel> apiLoggerList = [];

  List<ApiLoggerModel> getApiLoggerList() {
    return apiLoggerList;
  }

  void addApiLogger(ApiLoggerModel apiLogger) {
    emit(ApiLoggerInitial());
    apiLoggerList.add(apiLogger);
    emit(ApiLoggerData());
  }

  void clearLogs() {
    emit(ApiLoggerInitial());
    apiLoggerList.clear();
    emit(ApiLoggerData());
  }

  @override
  Future<void> close() {
    apiLoggerList.clear();
    return super.close();
  }
}
