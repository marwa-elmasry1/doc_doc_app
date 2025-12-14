import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:new_project/core/networking/api_error_handler.dart';

part 'api_result.freezed.dart';

@freezed        
    // _$ -> This mixin is what defines the various properties/methods of our object.
abstract class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success(T data) = Success<T>;
  const factory ApiResult.failure(ErrorHandler error) = Failure<T>;
}
