abstract class RepositoryBase {
  const RepositoryBase();

  Future<void> prepare();

  Future<void> release();
}
