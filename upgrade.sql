-- Safe to run more than once. Paste into Supabase SQL Editor and tap Run.
alter table public.trades
  add column if not exists result_path text,
  add column if not exists session text,
  add column if not exists timeframe text,
  add column if not exists mistakes text;
