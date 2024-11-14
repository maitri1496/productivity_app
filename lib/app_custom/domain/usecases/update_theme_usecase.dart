import 'package:productivity_app/app_custom/domain/repository/theme_repository.dart';

class UpdateThemeUseCase {
  final ThemeRepository repository;

  UpdateThemeUseCase(this.repository);

  Future<void> call(bool isDarkTheme) async {
    await repository.updateTheme(isDarkTheme);
  }
}
