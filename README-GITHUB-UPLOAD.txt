NEXT LEVEL LEARNING ACADEMY — GITHUB PACKAGE

Files included:
- index.html: main typing and learning application
- account.html: existing student login and signup
- student.html: existing authenticated student dashboard
- admin.html: existing admin content management
- supabase-config.js: public Supabase client configuration
- study-material.html: new public published-materials page
- quizzes.html: new public published-quizzes page

Deploy all files in the ZIP to the root of the same static-site repository. Keep the existing Supabase project and tables.

Public pages only query academy_content rows with is_published=true and the required content_type. Public quizzes run in the browser and do not write private student progress. Student login/dashboard/admin features are retained.

IMPORTANT — Storage access:
The public materials page can open external content_url links directly. For uploaded files in the academy-materials Storage bucket, a Storage SELECT policy limited to published resources is still required. If that policy is not configured, the page will show a clear access error; it does not make the entire bucket public.

The certificate signature now uses the academy name and no longer displays a personal Director/Founder name.

SUPABASE TABLE ACCESS FIX
After uploading the files, open Supabase > SQL Editor and run the contents of
SUPABASE-PUBLISHED-CONTENT-FIX.sql. This grants SELECT only to anon/authenticated
and adds an RLS policy limited to is_published=true. It does not grant public write access.
Do not put any service_role/secret key into the website files.

ROUTING NOTE
Lessons, Speed Test, Govt Exams, Exam Tools, Progress and Certificate are internal
views/features of index.html, not separate .html files. Open them from the homepage
navigation. Student Dashboard is student.html and requires student sign-in.
