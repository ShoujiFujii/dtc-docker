-- 以下、マスタテーブル ---------------------------------------------
-- 株主優待券マスタ
TRUNCATE table shareholder_coupon_master;

INSERT INTO shareholder_coupon_master(shareholder_coupon_id, amount, coupon_name) VALUES
    (11000000001,1,'映画館利用券（シネマＡ社）')
  , (11000000002,10,'ホテル利用券（ホテルＢ社）')
  , (11000000003,100,'優待利用割引券（企業Ｃ社）')
  , (11000000004,1000,'優待食事割引券（企業Ｄ社）')
  , (11000000005,10000,'株主様特典付き１デーパスポート券（テーマパークＥ社）')
;

-- 以下、情報テーブル ---------------------------------------------
-- 株主優待券
DELETE FROM shareholder_coupon WHERE shareholder_coupon_no > 10000000000;
INSERT INTO shareholder_coupon
    (shareholder_coupon_no, coupon_name, amount, expiration_date, issue_datetime, payout_status, use_status, returned_status, invalid_flag, token_id, token)
VALUES
    (10000000001,'映画館利用券（シネマＡ社）',1,DATE '2023-12-01',TIMESTAMP '2023-10-01 00:00:00.000','1','1','2',False,'IRESnK3lMr3l','{"TokenWithSignature":{"TokenBase":{"value":1,"year":"2024","tokenId":"IRESnK3lMr3l","certIssuer":"MDgxCzAJBgNVBAYTAkpQMRAwDgYDVQQKDAdFWEFNUExFMRcwFQYDVQQDDA5JbnRlcm1lZGlhdGVDQQ==","certId":"AgEC","pk":"BGOdSDI067DEFZBkYn6RIWwxO8zI19JrIh3I4+bXLBDI6EiMe32Jnei/ZyNZ2FoVB+yUFpbtf9Ahv6W14Abn5Yo=","nonce":"BLtRI1k=","time":"20240216184641"},"signature":"MEUCIAery6WUTMiC33yi6YdQWd7TtMpVxCXrNcjF59f+8MfmAiEAp+//6bTvkrjPBdt2AlEwJ82tQDymkJb/h9Rb+zNvQpM="}}')
  , (10000000002,'ホテル利用券（ホテルＢ社）',10,DATE '2024-01-01',TIMESTAMP '2023-11-01 00:00:00.000','1','2','1',False,'wYvMyh1pz4B9','{"TokenWithSignature":{"TokenBase":{"value":10,"year":"2024","tokenId":"wYvMyh1pz4B9","certIssuer":"MDgxCzAJBgNVBAYTAkpQMRAwDgYDVQQKDAdFWEFNUExFMRcwFQYDVQQDDA5JbnRlcm1lZGlhdGVDQQ==","certId":"AgEC","pk":"BGOdSDI067DEFZBkYn6RIWwxO8zI19JrIh3I4+bXLBDI6EiMe32Jnei/ZyNZ2FoVB+yUFpbtf9Ahv6W14Abn5Yo=","nonce":"BLtRI1k=","time":"20240216184641"},"signature":"MEUCIAery6WUTMiC33yi6YdQWd7TtMpVxCXrNcjF59f+8MfmAiEAp+//6bTvkrjPBdt2AlEwJ82tQDymkJb/h9Rb+zNvQpM="}}')
  , (10000000003,'優待利用割引券（企業Ｃ社）',100,DATE '2024-02-01',TIMESTAMP '2023-12-01 00:00:00.000','1','1','1',False,'nt/RATZuXCDR','{"TokenWithSignature":{"TokenBase":{"value":100,"year":"2024","tokenId":"nt/RATZuXCDR","certIssuer":"MDgxCzAJBgNVBAYTAkpQMRAwDgYDVQQKDAdFWEFNUExFMRcwFQYDVQQDDA5JbnRlcm1lZGlhdGVDQQ==","certId":"AgEC","pk":"BGOdSDI067DEFZBkYn6RIWwxO8zI19JrIh3I4+bXLBDI6EiMe32Jnei/ZyNZ2FoVB+yUFpbtf9Ahv6W14Abn5Yo=","nonce":"BLtRI1k=","time":"20240216184641"},"signature":"MEUCIAery6WUTMiC33yi6YdQWd7TtMpVxCXrNcjF59f+8MfmAiEAp+//6bTvkrjPBdt2AlEwJ82tQDymkJb/h9Rb+zNvQpM="}}')
  , (10000000004,'優待食事割引券（企業Ｄ社）',1000,DATE '2024-03-01',TIMESTAMP '2024-01-01 02:01:01.000','2','2','1',False,'9a6duEqiREKN','{"TokenWithSignature":{"TokenBase":{"value":1000,"year":"2024","tokenId":"9a6duEqiREKN","certIssuer":"MDgxCzAJBgNVBAYTAkpQMRAwDgYDVQQKDAdFWEFNUExFMRcwFQYDVQQDDA5JbnRlcm1lZGlhdGVDQQ==","certId":"AgEC","pk":"BGOdSDI067DEFZBkYn6RIWwxO8zI19JrIh3I4+bXLBDI6EiMe32Jnei/ZyNZ2FoVB+yUFpbtf9Ahv6W14Abn5Yo=","nonce":"BLtRI1k=","time":"20240216184641"},"signature":"MEUCIAery6WUTMiC33yi6YdQWd7TtMpVxCXrNcjF59f+8MfmAiEAp+//6bTvkrjPBdt2AlEwJ82tQDymkJb/h9Rb+zNvQpM="}}')
  , (10000000005,'株主様特典付き１デーパスポート券（テーマパークＥ社）',10000,DATE '2099-04-01',TIMESTAMP '2024-01-01 01:01:01.000','2','1','1',False,'GHDaVidUjuoR','{"TokenWithSignature":{"TokenBase":{"value":10000,"year":"2024","tokenId":"GHDaVidUjuoR","certIssuer":"MDgxCzAJBgNVBAYTAkpQMRAwDgYDVQQKDAdFWEFNUExFMRcwFQYDVQQDDA5JbnRlcm1lZGlhdGVDQQ==","certId":"AgEC","pk":"BGOdSDI067DEFZBkYn6RIWwxO8zI19JrIh3I4+bXLBDI6EiMe32Jnei/ZyNZ2FoVB+yUFpbtf9Ahv6W14Abn5Yo=","nonce":"BLtRI1k=","time":"20240216184641"},"signature":"MEUCIAery6WUTMiC33yi6YdQWd7TtMpVxCXrNcjF59f+8MfmAiEAp+//6bTvkrjPBdt2AlEwJ82tQDymkJb/h9Rb+zNvQpM="}}')
;

-- CBDC
DELETE FROM cbdc WHERE cbdc_no > 10000000000;
INSERT INTO cbdc
    (cbdc_no, amount, issue_datetime, payout_status, use_status, returned_status, token_id, token)
VALUES
    (10000000001,1,TIMESTAMP '2023-10-31 00:00:00.000','1','1','2','IRESnK3lMr3z','{"TokenWithSignature":{"TokenBase":{"value":1,"year":"2024","tokenId":"IRESnK3lMr3z","certIssuer":"MDgxCzAJBgNVBAYTAkpQMRAwDgYDVQQKDAdFWEFNUExFMRcwFQYDVQQDDA5JbnRlcm1lZGlhdGVDQQ==","certId":"AgEC","pk":"BGOdSDI067DEFZBkYn6RIWwxO8zI19JrIh3I4+bXLBDI6EiMe32Jnei/ZyNZ2FoVB+yUFpbtf9Ahv6W14Abn5Yo=","nonce":"BLtRI1k=","time":"20240216184641"},"signature":"MEUCIAery6WUTMiC33yi6YdQWd7TtMpVxCXrNcjF59f+8MfmAiEAp+//6bTvkrjPBdt2AlEwJ82tQDymkJb/h9Rb+zNvQpM="}}')
  , (10000000002,10,TIMESTAMP '2023-11-01 00:00:00.000','1','2','1','wYvMyh1pz4B1','{"TokenWithSignature":{"TokenBase":{"value":10,"year":"2024","tokenId":"wYvMyh1pz4B1","certIssuer":"MDgxCzAJBgNVBAYTAkpQMRAwDgYDVQQKDAdFWEFNUExFMRcwFQYDVQQDDA5JbnRlcm1lZGlhdGVDQQ==","certId":"AgEC","pk":"BGOdSDI067DEFZBkYn6RIWwxO8zI19JrIh3I4+bXLBDI6EiMe32Jnei/ZyNZ2FoVB+yUFpbtf9Ahv6W14Abn5Yo=","nonce":"BLtRI1k=","time":"20240216184641"},"signature":"MEUCIAery6WUTMiC33yi6YdQWd7TtMpVxCXrNcjF59f+8MfmAiEAp+//6bTvkrjPBdt2AlEwJ82tQDymkJb/h9Rb+zNvQpM="}}')
  , (10000000003,100,TIMESTAMP '2023-12-01 00:00:00.000','1','1','1','ntXRATZuXCDT','{"TokenWithSignature":{"TokenBase":{"value":100,"year":"2024","tokenId":"ntXRATZuXCDT","certIssuer":"MDgxCzAJBgNVBAYTAkpQMRAwDgYDVQQKDAdFWEFNUExFMRcwFQYDVQQDDA5JbnRlcm1lZGlhdGVDQQ==","certId":"AgEC","pk":"BGOdSDI067DEFZBkYn6RIWwxO8zI19JrIh3I4+bXLBDI6EiMe32Jnei/ZyNZ2FoVB+yUFpbtf9Ahv6W14Abn5Yo=","nonce":"BLtRI1k=","time":"20240216184641"},"signature":"MEUCIAery6WUTMiC33yi6YdQWd7TtMpVxCXrNcjF59f+8MfmAiEAp+//6bTvkrjPBdt2AlEwJ82tQDymkJb/h9Rb+zNvQpM="}}')
  , (10000000004,1000,TIMESTAMP '2024-01-01 02:01:01.000','2','2','1','9a6duEqiREKZ','{"TokenWithSignature":{"TokenBase":{"value":1000,"year":"2024","tokenId":"9a6duEqiREKZ","certIssuer":"MDgxCzAJBgNVBAYTAkpQMRAwDgYDVQQKDAdFWEFNUExFMRcwFQYDVQQDDA5JbnRlcm1lZGlhdGVDQQ==","certId":"AgEC","pk":"BGOdSDI067DEFZBkYn6RIWwxO8zI19JrIh3I4+bXLBDI6EiMe32Jnei/ZyNZ2FoVB+yUFpbtf9Ahv6W14Abn5Yo=","nonce":"BLtRI1k=","time":"20240216184641"},"signature":"MEUCIAery6WUTMiC33yi6YdQWd7TtMpVxCXrNcjF59f+8MfmAiEAp+//6bTvkrjPBdt2AlEwJ82tQDymkJb/h9Rb+zNvQpM="}}')
  , (10000000005,10000,TIMESTAMP '2024-01-01 01:01:01.000','2','1','1','GHDaVidUjuoZ','{"TokenWithSignature":{"TokenBase":{"value":10000,"year":"2024","tokenId":"GHDaVidUjuoZ","certIssuer":"MDgxCzAJBgNVBAYTAkpQMRAwDgYDVQQKDAdFWEFNUExFMRcwFQYDVQQDDA5JbnRlcm1lZGlhdGVDQQ==","certId":"AgEC","pk":"BGOdSDI067DEFZBkYn6RIWwxO8zI19JrIh3I4+bXLBDI6EiMe32Jnei/ZyNZ2FoVB+yUFpbtf9Ahv6W14Abn5Yo=","nonce":"BLtRI1k=","time":"20240216184641"},"signature":"MEUCIAery6WUTMiC33yi6YdQWd7TtMpVxCXrNcjF59f+8MfmAiEAp+//6bTvkrjPBdt2AlEwJ82tQDymkJb/h9Rb+zNvQpM="}}')
;

-- 取引
DELETE FROM shop_deal WHERE shop_deal_no > 10000000000;
INSERT INTO shop_deal
    (shop_deal_no, deal_datetime, amount, receive_add_info, return_add_info, deal_status, transfer_id, error_code)
VALUES
    (10000000001,TIMESTAMP '2023-10-31 00:00:00.000',1,null,'{"receiptId" : "10000000001","storeName" : "ABC Store","date" : "2024-10-01","totalAmount" : "1","items" : ["Apple","Banana","Cherry"]}','1','transfer1',null)
  , (10000000002,TIMESTAMP '2023-11-01 00:00:00.000',10,null,'{"receiptId" : "10000000002","storeName" : "ABC Store","date" : "2024-11-01","totalAmount" : "10","items" : ["Apple","Banana","Cherry"]}','1','transfer2',null)
  , (10000000003,TIMESTAMP '2023-12-01 00:00:00.000',100,null,'{"receiptId" : "10000000003","storeName" : "ABC Store","date" : "2023-12-01","totalAmount" : "100","items" : ["Apple","Banana","Cherry"]}','1','transfer3',null)
  , (10000000004,TIMESTAMP '2024-01-10 02:01:01.000',1000,null,'{"receiptId" : "10000000004","storeName" : "ABC Store","date" : "2024-01-10","totalAmount" : "1000","items" : ["Apple","Banana","Cherry"]}','9','transfer4','error1')
  , (10000000005,TIMESTAMP '2024-01-01 01:01:01.000',123456,'{"age": 15}','{"receiptId" : "10000000005","storeName" : "ABC Store","date" : "2024-01-01","totalAmount" : "123456","items" : ["Apple","Banana","Cherry"]}','2','transfer5',null)
;

-- 取引明細
DELETE FROM shop_deal_detail WHERE shop_deal_detail_no > 10000000000;
INSERT INTO shop_deal_detail
    (shop_deal_detail_no, shop_deal_no, token_type, amount, coupon_name, token_id)
VALUES
    (10000000001,10000000001,'1',1,'映画館利用券（シネマＡ社）','IRESnK3lMr3z')
  , (10000000002,10000000002,'2',10,NULL,'wYvMyh1pz4B1')
  , (10000000003,10000000003,'1',100,'優待利用割引券（企業Ｃ社）','nt/RATZuXCDR')
  , (10000000004,10000000004,'2',1000,NULL,'9a6duEqiREKZ')
  , (10000000005,10000000005,'1',10,'ホテル利用券（ホテルＢ社）','wYvMyh1pz4B9')
  , (10000000006,10000000005,'1',10000,'株主様特典付き１デーパスポート券（テーマパークＥ社）','GHDaVidUjuoR')
  , (10000000007,10000000005,'2',1,NULL,'IRESnK3lMr1a')
  , (10000000008,10000000005,'2',1,NULL,'IRESnK3lMr1b')
  , (10000000009,10000000005,'2',1,NULL,'IRESnK3lMr1c')
  , (10000000010,10000000005,'2',1,NULL,'IRESnK3lMr1d')
  , (10000000011,10000000005,'2',1,NULL,'IRESnK3lMr1e')
  , (10000000012,10000000005,'2',1,NULL,'IRESnK3lMr1f')
  , (10000000013,10000000005,'2',10,NULL,'IRESnK3lM10a')
  , (10000000014,10000000005,'2',10,NULL,'IRESnK3lM10b')
  , (10000000015,10000000005,'2',10,NULL,'IRESnK3lM10c')
  , (10000000016,10000000005,'2',10,NULL,'IRESnK3lM10d')
  , (10000000017,10000000005,'2',100,NULL,'ntXRATZu100a')
  , (10000000018,10000000005,'2',100,NULL,'ntXRATZu100b')
  , (10000000019,10000000005,'2',100,NULL,'ntXRATZu100c')
  , (10000000020,10000000005,'2',100,NULL,'ntXRATZu100d')
  , (10000000021,10000000005,'2',1000,NULL,'ntXRATZ1000a')
  , (10000000022,10000000005,'2',1000,NULL,'ntXRATZ1000b')
  , (10000000023,10000000005,'2',1000,NULL,'ntXRATZ1000c')
  , (10000000024,10000000005,'2',10000,NULL,'GHDaVi10000a')
  , (10000000025,10000000005,'2',10000,NULL,'GHDaVi10000b')
  , (10000000026,10000000005,'2',10000,NULL,'GHDaVi10000c')
  , (10000000027,10000000005,'2',10000,NULL,'GHDaVi10000d')
  , (10000000028,10000000005,'2',10000,NULL,'GHDaVi10000e')
  , (10000000029,10000000005,'2',10000,NULL,'GHDaVi10000f')
  , (10000000030,10000000005,'2',10000,NULL,'GHDaVi10000g')
  , (10000000031,10000000005,'2',10000,NULL,'GHDaVi10000h')
  , (10000000032,10000000005,'2',10000,NULL,'GHDaVi10000i')
  , (10000000033,10000000005,'2',10000,NULL,'GHDaVi10000j')
  , (10000000034,10000000005,'2',10000,NULL,'GHDaVi10000k')
;
