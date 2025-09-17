import 'package:advicer_3/data/data_sources/advice_rest_api.dart';
import 'package:advicer_3/data/exceptions/exceptions.dart';
import 'package:advicer_3/domain/entities/advice_entitiy.dart';
import 'package:advicer_3/domain/failures/failure.dart';
import 'package:advicer_3/domain/repositories/advice_repository.dart';
import 'package:multiple_result/multiple_result.dart';

class AdviceRepositoryRestApi implements AdviceRepository {
  AdviceRepositoryRestApi({required this.restApi});

  final AdviceRestApi restApi;

  @override
  Future<Result<AdviceEntity, Failure>> read() async {
    try {
      final result = await restApi.read();

      return Result.success(AdviceEntity(advice: result.advice, id: result.id.toString()));
    } on ServerException catch (_) {
      return Result.error(ServerInternalFailure());
    } catch (exception) {
      return Result.error(UnknownFailure());
    }
  }

  @override
  Future<Result<AdviceEntity, Failure>> readById({required String id}) async {
    try {
      final parsedInt = int.parse(id);

      final result = await restApi.readById(id: parsedInt.toString());
      return Result.success(AdviceEntity(advice: result.advice, id: result.id.toString()));
    } on FormatException catch (_) {
      return Result.error(InvalidInputFailure());
    } on ServerException catch (_) {
      return Result.error(ServerInternalFailure());
    } catch (exception) {
      return Result.error(UnknownFailure());
    }
  }
}
