CREATE OR REPLACE TABLE `rakamin-500812.kimia_farma_db.kf_analysis` AS
SELECT
  t.transaction_id,
  t.date,
  c.branch_id,
  c.branch_name,
  c.kota,
  c.provinsi,
  c.rating AS rating_cabang,
  t.customer_name,
  p.product_id,
  p.product_name,
  t.price AS actual_price,
  t.discount_percentage,

  -- Nett Sales = harga - (harga x diskon). discount_percentage sudah desimal (0.05 = 5%)
  ROUND(t.price - (t.price * t.discount_percentage), 2) AS nett_sales,

  -- Persentase gross laba berdasarkan actual_price
  CASE
    WHEN t.price <= 50000 THEN 0.10
    WHEN t.price > 50000  AND t.price <= 100000 THEN 0.15
    WHEN t.price > 100000 AND t.price <= 300000 THEN 0.20
    WHEN t.price > 300000 AND t.price <= 500000 THEN 0.25
    WHEN t.price > 500000 THEN 0.30
  END AS persentase_gross_laba,

  -- Nett Profit = nett_sales x persentase_gross_laba
  ROUND(
    (t.price - (t.price * t.discount_percentage)) *
    CASE
      WHEN t.price <= 50000 THEN 0.10
      WHEN t.price > 50000  AND t.price <= 100000 THEN 0.15
      WHEN t.price > 100000 AND t.price <= 300000 THEN 0.20
      WHEN t.price > 300000 AND t.price <= 500000 THEN 0.25
      WHEN t.price > 500000 THEN 0.30
    END, 2
  ) AS nett_profit,

  t.rating AS rating_transaksi

FROM `rakamin-500812.kimia_farma_db.kf_final_transaction` AS t
LEFT JOIN `rakamin-500812.kimia_farma_db.kf_kantor_cabang` AS c
  ON t.branch_id = c.branch_id
LEFT JOIN `rakamin-500812.kimia_farma_db.kf_product` AS p
  ON t.product_id = p.product_id;
