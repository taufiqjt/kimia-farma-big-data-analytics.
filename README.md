# Kimia Farma - Big Data Analytics (Final Task)

Proyek ini merupakan **Final Task** dari program *Project-Based Internship* Rakamin Academy x Kimia Farma sebagai Big Data Analytics Intern. Tujuan proyek adalah mengevaluasi kinerja bisnis Kimia Farma dari tahun 2020 hingga 2023 menggunakan Google BigQuery dan Google Looker Studio.

## 📋 Deskripsi Proyek

Sebagai Big Data Analytics Intern, tugas yang dikerjakan meliputi:
1. Mengimpor 4 dataset mentah ke Google BigQuery
2. Membuat tabel analisa hasil agregasi dari ke-4 dataset tersebut
3. Membangun dashboard *Performance Analytics* di Google Looker Studio

## 🗂️ Dataset yang Digunakan

| Dataset | Deskripsi |
|---|---|
| `kf_final_transaction` | Data transaksi pelanggan (tanggal, harga, diskon, rating) |
| `kf_product` | Informasi produk obat (id, nama, kategori, harga) |
| `kf_kantor_cabang` | Data cabang Kimia Farma (id, nama, kota, provinsi, rating) |
| `kf_inventory` | Data stok produk obat di tiap cabang |

## 🛠️ Tools yang Digunakan

- **Google BigQuery** — data warehousing & SQL querying
- **Google Looker Studio** — visualisasi dashboard
- **SQL** — transformasi dan agregasi data

## 📁 Struktur Repository

```
├── README.md
└── 01_create_kf_analysis.sql   # Syntax pembuatan tabel analisa kf_analysis
```

## 📊 Tabel Analisa (`kf_analysis`)

Tabel `kf_analysis` dibuat dengan melakukan *join* ketiga tabel (`kf_final_transaction`, `kf_kantor_cabang`, `kf_product`) dan menghasilkan kolom-kolom berikut:

- `transaction_id`, `date`, `branch_id`, `branch_name`, `kota`, `provinsi`, `rating_cabang`
- `customer_name`, `product_id`, `product_name`, `actual_price`, `discount_percentage`
- `persentase_gross_laba` (dihitung berdasarkan tingkatan harga)
- `nett_sales` (harga setelah diskon)
- `nett_profit` (keuntungan yang diperoleh Kimia Farma)
- `rating_transaksi`

Detail logika perhitungan dapat dilihat pada file [`01_create_kf_analysis.sql`](./01_create_kf_analysis.sql).

## 📈 Dashboard

Dashboard Performance Analytics dibuat di Google Looker Studio berdasarkan tabel `kf_analysis`, mencakup:
- Summary Dashboard & Filter Control
- Perbandingan Pendapatan Kimia Farma dari tahun ke tahun
- Top 10 Total Transaksi & Nett Sales per Cabang/Provinsi
- Top 5 Cabang dengan Rating Tertinggi namun Rating Transaksi Terendah
- Peta Geografis Total Profit per Provinsi

🔗 Link Dashboard: [*(https://datastudio.google.com/reporting/70cd43d2-9c75-4df9-8d23-20a90f67f138)*]

🔗 Link Video Presentasi: *(tambahkan link YouTube/Google Drive Anda di sini)*

## 👤 Author

*Taufiq Jonel Tandra*
