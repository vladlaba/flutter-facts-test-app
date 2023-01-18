abstract class Environment {
  static const String factsBoxName = String.fromEnvironment(
    'FACTS_BOX_NAME',
    defaultValue: 'facts',
  );

  static const String imagesBaseUrl = String.fromEnvironment(
    'IMAGES_BASE_URL',
    defaultValue: 'https://cataas.com/cat',
  );

  static const String factsApiBaseUrl = String.fromEnvironment(
    'FACTS_API_BASE_URL',
    defaultValue: 'https://catfact.ninja',
  );
}
