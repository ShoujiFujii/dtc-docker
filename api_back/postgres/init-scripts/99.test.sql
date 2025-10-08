-- 導通テスト用のsqlスクリプトコード。修正しないでください。
drop table if exists test cascade;

create table test (
  id serial not null
  , string_value character varying
  , datetime_value timestamp
  , constraint test_PKC primary key (id)
) ;

comment on table test is 'テスト';
comment on column test.id is 'id';
comment on column test.string_value is 'string_value';
comment on column test.datetime_value is 'datetime_value';
