create table
  public.customers (
    id integer generated by default as identity,
    created_at timestamp with time zone not null default now(),
    name text null,
    role text null,
    recent_w_rec text null,
    recent_a_rec text null,
    recent_o_rec text null,
    constraint customers_pkey primary key (id),
    constraint customers_name_key unique (name)
  ) tablespace pg_default;

create table
  public.mods_plan (
    id integer generated by default as identity,
    sku text not null,
    markup integer null,
    type text null,
    constraint mods_plan_pkey primary key (id)
  ) tablespace pg_default;

create table
  public.items_plan (
    id integer generated by default as identity,
    type text not null,
    price integer null,
    mod_id integer null,
    sku text null,
    item_vec integer[] null,
    constraint items_plan_pkey primary key (id),
    constraint public_items_plan_mod_id_fkey foreign key (mod_id) references mods_plan (id)
  ) tablespace pg_default;

create table
  public.items_ledger (
    id integer generated by default as identity,
    created_at timestamp with time zone not null default now(),
    qty_change integer null,
    item_id integer null,
    item_sku text null,
    credit_change integer null,
    customer_id integer null,
    constraint items_ledger_pkey primary key (id),
    constraint items_ledger_customer_id_fkey foreign key (customer_id) references customers (id),
    constraint public_items_ledger_item_id_fkey foreign key (item_id) references items_plan (id)
  ) tablespace pg_default;


create table
  public.mods_ledger (
    id integer generated by default as identity,
    created_at timestamp with time zone not null default now(),
    qty_change integer null,
    mod_id integer null,
    mod_sku text null,
    credit_change integer null,
    constraint mods_ledger_pkey primary key (id),
    constraint public_mods_ledger_mod_id_fkey foreign key (mod_id) references mods_plan (id)
  ) tablespace pg_default;
