import 'package:e_commerce/core/supabase/supabase_config.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseClientProvider {
  static late final SupabaseClient client;

  static Future<void> init() async {
    await Supabase.initialize(
      url: SupabaseConfig.supabaseUrl,
      anonKey: SupabaseConfig.anonKey,
    );

    client = Supabase.instance.client;
  }
}
