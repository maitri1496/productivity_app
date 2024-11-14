import 'package:productivity_app/app_custom/domain/repository/language_repository.dart';

class GetLanguageUseCase {
  final LanguageRepository repository;

  GetLanguageUseCase(this.repository);

  Future<String> call() async {
    return await repository.getLanguage();
  }
}
