abstract class LanguageRepository {
  Future<void> updateLanguage(String languageCode);

  Future<String> getLanguage();
}
