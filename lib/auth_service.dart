import 'package:flutter/cupertino.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Atutenticacao {
  static Future<void> initializeSupabase() async {
    await Supabase.initialize(
      url: 'https://qzbccugcsuvszfltdyqo.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InF6YmNjdWdjc3V2c3pmbHRkeXFvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDczNTQ5MjYsImV4cCI6MjA2MjkzMDkyNn0.IQ4kHR1thyJo--ybEzrN_5YTduWgbURr2WCj7Iwl6wY',
    );
  }

  Future<String?> singUp(String email, String password) async {
    final response =
        await Supabase.instance.client.auth.signUp(email, password);

    if (response.error == null) {
      return 'Usuário Cadastrado com sucesso!';
    } else {
      return 'Erro ao cadastrar: ${response.error!.message}';
    }
  }

  Future<String> singIn(String email, String password) async {
    final response = await Supabase.instance.client.auth.singInWithPassword(
      email: email,
      password: password,
    );
  }
}
