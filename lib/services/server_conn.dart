import 'package:supabase_flutter/supabase_flutter.dart';



/// Supabase client
const supabaseURL = "https://ldrfvyesjgzxwophzjgh.supabase.co";
const supabaseAnonKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxkcmZ2eWVzamd6eHdvcGh6amdoIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODAzNDYyNTMsImV4cCI6MTk5NTkyMjI1M30.D5iz5Q7xc9QOkwBywb3vfLJ6njj3BiiYfHfz8YsQonM";

//
Future supaBaseInitF() async {

  /*
  *Initializing
  *The Supabase client is your entrypoint to the rest of the Supabase functionality and is the easiest way to interact with everything we offer within the Supabase ecosystem.
  *
  * */

  await Supabase.initialize(
      url: supabaseURL,
      anonKey: supabaseAnonKey,
      //authCallbackUrlHostname: 'login-callback', // optional
      debug: true // optional
  );

}
