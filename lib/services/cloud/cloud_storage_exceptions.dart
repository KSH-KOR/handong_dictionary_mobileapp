class CloudStorageException implements Exception {
  const CloudStorageException();
}

// C in CRUD
class CouldNotCreateDictionaryException extends CloudStorageException {}

// R in CRUD
class CouldNotGetAllDictionariesException extends CloudStorageException {}

// U in CRUD
class CouldNotUpdateDictionaryException extends CloudStorageException {}

// D in CRUD
class CouldNotDeleteDictionaryException extends CloudStorageException {}