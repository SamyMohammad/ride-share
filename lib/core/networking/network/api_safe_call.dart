
import 'package:fpdart/fpdart.dart';
import 'package:ride_share/core/networking/error_handler/data_source.dart';
import 'package:ride_share/core/networking/error_handler/data_source_extension.dart';
import 'package:ride_share/core/networking/error_handler/dio_error_hanlder.dart';
import 'package:ride_share/core/networking/network_info/network_info.dart';
import 'package:ride_share/core/networking/error_handler/failure.dart';

Future<Either<Failure, T>> safeAPiCall<T>(
    NetworkInfo networkInfo, Future<T> Function() apiCall) async {
  if (await networkInfo.isConnected) {
    try {
      final response = await apiCall();
      return Right(response);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  } else {
    // no internet connection
    return Left(DataSource.noInternetConnection.getFailure());
  }
}
