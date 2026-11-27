// Public browser configuration. The publishable/anon key is designed for client use.
// Never place a Supabase service_role or secret key in this file.
window.NLLA_SUPABASE_URL = 'https://iauofytlulpjwgyfgpwz.supabase.co';
window.NLLA_SUPABASE_ANON_KEY = 'sb_publishable_oKpGX63S61u6OX_QvH8b5A_xzfdi2Cs';


// Use the same persistent browser session on every academy page.
// Supabase stores the session in localStorage and refreshes it automatically.
window.NLLA_CREATE_SUPABASE_CLIENT = function () {
  if (!window.supabase?.createClient || !window.NLLA_SUPABASE_URL || !window.NLLA_SUPABASE_ANON_KEY) {
    return null;
  }
  return window.supabase.createClient(
    window.NLLA_SUPABASE_URL,
    window.NLLA_SUPABASE_ANON_KEY,
    {
      auth: {
        persistSession: true,
        autoRefreshToken: true,
        detectSessionInUrl: true,
        storage: window.localStorage
      }
    }
  );
};
