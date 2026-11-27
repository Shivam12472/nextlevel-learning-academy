-- Next Level Learning Academy: fix public read access for published study material and quizzes.
-- Run this in Supabase Dashboard > SQL Editor using the project owner account.
-- This grants READ only. It does not expose drafts or grant INSERT/UPDATE/DELETE.

ALTER TABLE public.academy_content ENABLE ROW LEVEL SECURITY;

GRANT SELECT ON TABLE public.academy_content TO anon, authenticated;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1
    FROM pg_policies
    WHERE schemaname = 'public'
      AND tablename = 'academy_content'
      AND policyname = 'nlla_read_published_academy_content'
  ) THEN
    CREATE POLICY nlla_read_published_academy_content
      ON public.academy_content
      FOR SELECT
      TO anon, authenticated
      USING (is_published = true);
  END IF;
END
$$;

-- Notes:
-- 1) Public Study Material page reads published rows with content_type material/video.
-- 2) Public Quizzes page reads published rows with content_type quiz.
-- 3) Student dashboard also reads published content after sign-in.
-- 4) Existing owner/admin policies should remain in place for content management.
-- 5) Uploaded files in Storage are separate: the academy-materials bucket still needs
--    a narrowly scoped SELECT policy if file_path resources are used. External content_url
--    links do not need a Storage policy.
