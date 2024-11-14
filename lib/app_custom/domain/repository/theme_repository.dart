abstract class ThemeRepository {
  Future<void> updateTheme(bool isDarkTheme);

  Future<bool> getTheme();
}
