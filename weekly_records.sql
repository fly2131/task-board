-- 周工作记录表
CREATE TABLE IF NOT EXISTS weekly_records (
  id SERIAL PRIMARY KEY,
  assignee TEXT NOT NULL,
  week_start TEXT NOT NULL,
  items TEXT DEFAULT '',
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- RLS 全开放（与 tasks 表一致）
ALTER TABLE weekly_records ENABLE ROW LEVEL SECURITY;
CREATE POLICY "allow_all_weekly" ON weekly_records FOR ALL USING (true) WITH CHECK (true);

-- 人员列表初始化
INSERT INTO settings (key, value) VALUES ('team_members', '')
ON CONFLICT (key) DO NOTHING;
