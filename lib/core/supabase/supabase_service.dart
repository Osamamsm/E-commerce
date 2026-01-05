import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@lazySingleton
class SupabaseService {
  final SupabaseClient _client;

  SupabaseService(this._client);

  GoTrueClient get auth => _client.auth;

  SupabaseQueryBuilder from(String table) => _client.from(table);

  SupabaseStorageClient get storage => _client.storage;
}
