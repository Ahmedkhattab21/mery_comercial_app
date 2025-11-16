
import 'package:mery_comercial_app/core/exceptions/failure.dart';

class ServerException implements Exception {
  final ServerFailure serverFailure;

  const ServerException({required this.serverFailure});
}
