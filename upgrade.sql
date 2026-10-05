-- Safe to run more than once. Paste into Supabase SQL Editor and tap Run.
alter table public.trades
  add column if not exists result_path text,
  add column if not exists session text,
  add column if not exists timeframe text,
  add column if not exists mistakes text,
  add column if not exists trade_time text,
  add column if not exists profit numeric,
  add column if not exists broker_id text,
  add column if not exists target numeric;

-- allows open trades (planned now, closed later)
alter table public.trades alter column "exit" drop not null;
