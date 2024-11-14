import 'package:productivity_app/app_custom/domain/repository/theme_repository.dart';

class GetThemeUseCase {
  final ThemeRepository repository;

  GetThemeUseCase(this.repository);

  Future<bool> call() async {
    return await repository.getTheme();
  }
}
