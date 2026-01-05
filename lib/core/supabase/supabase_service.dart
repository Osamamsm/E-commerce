

import 'package:e_commerce/core/supabase/supabase_client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService{

 SupabaseClient get _client => SupabaseClientProvider.client;

 GoTrueClient get auth => _client.auth;

 SupabaseQueryBuilder from(String table) => _client.from(table);

 SupabaseStorageClient get storage => _client.storage;



}
