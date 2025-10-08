-- 以下、マスタテーブル ---------------------------------------------
-- 株主優待券マスタ
DROP TABLE IF EXISTS shareholder_coupon_master CASCADE;
CREATE TABLE shareholder_coupon_master (
    shareholder_coupon_id bigserial NOT NULL,
    amount integer NOT NULL,
    coupon_name character varying(50) NOT NULL,
    PRIMARY KEY (shareholder_coupon_id)
);

ALTER SEQUENCE IF EXISTS shareholder_coupon_master_shareholder_coupon_id_seq MAXVALUE 99999999999999;
COMMENT ON TABLE shareholder_coupon_master IS '株主優待券マスタ';
COMMENT ON COLUMN shareholder_coupon_master.shareholder_coupon_id IS '株主優待券ID';
COMMENT ON COLUMN shareholder_coupon_master.amount IS '金額';
COMMENT ON COLUMN shareholder_coupon_master.coupon_name IS '券名';

-- 以下、情報テーブル ---------------------------------------------
-- 株主優待券
DROP TABLE IF EXISTS shareholder_coupon CASCADE;
CREATE TABLE shareholder_coupon
(
    shareholder_coupon_no bigserial NOT NULL,
    coupon_name character varying(50) NOT NULL,
    amount integer NOT NULL,
    expiration_date date NOT NULL,
    issue_datetime timestamp without time zone NOT NULL,
    payout_status character varying(1) NOT NULL DEFAULT 1,
    use_status character varying(1) NOT NULL DEFAULT 1,
    returned_status character varying(1) NOT NULL DEFAULT 1,
    invalid_flag boolean NOT NULL DEFAULT false,
    token_id text NOT NULL UNIQUE, 
    token text,
    PRIMARY KEY (shareholder_coupon_no)
);

ALTER SEQUENCE IF EXISTS shareholder_coupon_shareholder_coupon_no_seq MAXVALUE 99999999999999;
COMMENT ON TABLE shareholder_coupon IS '株主優待券';
COMMENT ON COLUMN shareholder_coupon.shareholder_coupon_no IS '株主優待券通番';
COMMENT ON COLUMN shareholder_coupon.coupon_name IS '券名';
COMMENT ON COLUMN shareholder_coupon.amount IS '金額:1/10/100/1000/10000';
COMMENT ON COLUMN shareholder_coupon.expiration_date IS '有効期限';
COMMENT ON COLUMN shareholder_coupon.issue_datetime IS '発行日時';
COMMENT ON COLUMN shareholder_coupon.payout_status IS '払出状況:1：未払出、2：払出済';
COMMENT ON COLUMN shareholder_coupon.use_status IS '利用状況:1：未利用、2：利用済';
COMMENT ON COLUMN shareholder_coupon.returned_status IS '還収状況:1：未還収、2：還収済';
COMMENT ON COLUMN shareholder_coupon.invalid_flag IS '無効フラグ:true：無効';
COMMENT ON COLUMN shareholder_coupon.token_id IS '記番号';
COMMENT ON COLUMN shareholder_coupon.token IS 'トークン';

-- CBDC
DROP TABLE IF EXISTS cbdc CASCADE;
CREATE TABLE cbdc
(
    cbdc_no bigserial NOT NULL,
    amount integer NOT NULL,
    issue_datetime timestamp without time zone NOT NULL,
    payout_status character varying(1) NOT NULL DEFAULT 1,
    use_status character varying(1) NOT NULL DEFAULT 1,
    returned_status character varying(1) NOT NULL DEFAULT 1,
    token_id text NOT NULL UNIQUE, 
    token text,
    PRIMARY KEY (cbdc_no)
);

ALTER SEQUENCE IF EXISTS cbdc_cbdc_no_seq MAXVALUE 99999999999999;
COMMENT ON TABLE cbdc IS 'CBDC';
COMMENT ON COLUMN cbdc.cbdc_no IS 'CBDC通番';
COMMENT ON COLUMN cbdc.amount IS '金額:1/10/100/1000/10000';
COMMENT ON COLUMN cbdc.issue_datetime IS '発行日時';
COMMENT ON COLUMN cbdc.payout_status IS '払出状況:1：未払出、2：払出済';
COMMENT ON COLUMN cbdc.use_status IS '利用状況:1：未利用、2：利用済';
COMMENT ON COLUMN cbdc.returned_status IS '還収状況:1：未還収、2：還収済';
COMMENT ON COLUMN cbdc.token_id IS '記番号';
COMMENT ON COLUMN cbdc.token IS 'トークン';

-- 取引
DROP TABLE IF EXISTS shop_deal CASCADE;
CREATE TABLE shop_deal
(
    shop_deal_no bigserial NOT NULL,
    deal_datetime timestamp without time zone NOT NULL,
    amount integer NOT NULL,
    receive_add_info text,
    return_add_info text,
    deal_status character varying(1) NOT NULL DEFAULT 1,
    transfer_id text,
    error_code text,
    PRIMARY KEY (shop_deal_no)
);

ALTER SEQUENCE IF EXISTS shop_deal_shop_deal_no_seq MAXVALUE 99999999999999;
COMMENT ON TABLE shop_deal IS '取引';
COMMENT ON COLUMN shop_deal.shop_deal_no IS '取引通番';
COMMENT ON COLUMN shop_deal.deal_datetime IS '取引日時';
COMMENT ON COLUMN shop_deal.amount IS '金額';
COMMENT ON COLUMN shop_deal.receive_add_info IS '付加情報(受信)';
COMMENT ON COLUMN shop_deal.return_add_info IS '付加情報(返送)';
COMMENT ON COLUMN shop_deal.deal_status IS '取引状況:1：処理中、2：完了、8：受付失敗、9：支払失敗';
COMMENT ON COLUMN shop_deal.transfer_id IS '移転ID';
COMMENT ON COLUMN shop_deal.error_code IS 'エラーコード';

-- 取引明細
DROP TABLE IF EXISTS shop_deal_detail CASCADE;
CREATE TABLE shop_deal_detail
(
    shop_deal_detail_no bigserial NOT NULL,
    shop_deal_no bigint NOT NULL,
    token_type character varying(1) NOT NULL,
    amount integer NOT NULL,
    coupon_name character varying(50),
    token_id text NOT NULL UNIQUE, 
    PRIMARY KEY (shop_deal_detail_no, shop_deal_no)
);

ALTER SEQUENCE IF EXISTS shop_deal_detail_shop_deal_detail_no_seq MAXVALUE 99999999999999;
COMMENT ON TABLE shop_deal_detail IS '取引明細';
COMMENT ON COLUMN shop_deal_detail.shop_deal_detail_no IS '取引明細通番';
COMMENT ON COLUMN shop_deal_detail.shop_deal_no IS '取引通番';
COMMENT ON COLUMN shop_deal_detail.token_type IS 'トークン種別:1：株主優待券、2：CBDC';
COMMENT ON COLUMN shop_deal_detail.amount IS '金額';
COMMENT ON COLUMN shop_deal_detail.coupon_name IS '券名';
COMMENT ON COLUMN shop_deal_detail.token_id IS '記番号';
