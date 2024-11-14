import 'package:productivity_app/app_custom/domain/repository/language_repository.dart';

class UpdateLanguageUseCase {
  final LanguageRepository repository;

  UpdateLanguageUseCase(this.repository);

  Future<void> call(String lan) async {
    await repository.updateLanguage(lan);
  }
}
