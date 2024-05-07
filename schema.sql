create table
  public.weapon_inventory (
    id bigint generated by default as identity,
    sku text null,
    name text null,
    type text null,
    damage text null,
    modifier text null,
    price integer null default 0,
    constraint weapons_inventory_pkey primary key (id)
  ) tablespace pg_default;

  create table
  public.credit_ledger (
    id bigint generated by default as identity,
    created_at timestamp with time zone not null default now(),
    change integer null default 0,
    constraint credit_ledger_pkey primary key (id)
  ) tablespace pg_default;

  create table
  public.weapon_ledger (
    id bigint generated by default as identity,
    created_at timestamp with time zone not null default now(),
    weapon_id bigint null,
    change integer null,
    constraint weapon_ledger_pkey primary key (id)
  ) tablespace pg_default;
