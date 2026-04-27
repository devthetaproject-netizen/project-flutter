# Gotu — Home Service App 🏠

Aplikasi marketplace jasa layanan rumah berbasis Flutter, menghubungkan customer dengan mitra/teknisi profesional.

---

## 📱 Tentang Aplikasi

Gotu adalah platform yang memudahkan customer menemukan dan memesan jasa layanan rumah seperti cleaning, repairing, gardening, laundry, dan lainnya.

---

## 🛠️ Tech Stack

| Technology            | Keterangan         |
| --------------------- | ------------------ |
| Flutter               | Framework utama    |
| Dart                  | Bahasa pemrograman |
| Riverpod              | State management   |
| smooth_page_indicator | Carousel indicator |

---

## 📦 Dependencies

```yaml
dependencies:
  flutter_riverpod: ^2.6.1
  smooth_page_indicator: ^1.1.0
```

---

## 🏗️ Arsitektur

Project ini menggunakan **Clean Architecture** + **Atomic Design** + **Riverpod**.

### Prinsip yang diterapkan:

- **Separation of Concerns** — UI, logic, dan navigasi terpisah
- **Repository Pattern** — siap ganti local data ke API
- **Atomic Design** — atom → molecule → organism → page

---

## 📁 Struktur Folder

```
lib/
├── data/
│   ├── datasources/               # Data dummy/lokal
│   │   ├── layanan_data.dart
│   │   ├── mitra_data.dart
│   │   ├── notif_data.dart
│   │   └── user_data.dart
│   └── models/                    # Model data
│       ├── layanan_model.dart
│       ├── mitra_model.dart
│       ├── notif_model.dart
│       └── user_model.dart
├── domain/
│   ├── core/                      # Utility & constants
│   ├── entities/                  # Entity murni
│   ├── filtering/                 # Logic filtering
│   └── repositories/              # Abstract & implementasi
│       ├── local_mitra_repository.dart
│       └── mitra_repository.dart
├── presentation/
│   ├── navigation/                # Navigasi terpisah dari UI
│   │   ├── all_services_navigation.dart
│   │   ├── home_navigation.dart
│   │   ├── main_navigation.dart
│   │   ├── search_navigation.dart
│   │   └── service_grid_navigation.dart
│   ├── screens/                   # Halaman utama
│   │   ├── all_services_page.dart
│   │   ├── booking_page.dart
│   │   ├── bookmark_page.dart
│   │   ├── calender_page.dart
│   │   ├── home_page.dart
│   │   ├── inbox_page.dart
│   │   ├── main_page.dart
│   │   ├── notification_page.dart
│   │   ├── profile_page.dart
│   │   ├── promo_page.dart
│   │   ├── search_page.dart
│   │   └── service_list_page.dart
│   ├── state_mgmt/                # Provider Riverpod
│   │   ├── home_provider.dart
│   │   ├── layanan_provider.dart
│   │   ├── main_provider.dart
│   │   ├── notif_provider.dart
│   │   ├── search_provider.dart
│   │   ├── see_all_provider.dart
│   │   └── user_provider.dart
│   └── widgets/                   # Widget reusable
│       ├── banner_promo.dart
│       ├── home_app_bar.dart
│       ├── notif_item.dart
│       ├── recent_item.dart
│       ├── search_field.dart
│       ├── section_header.dart
│       ├── service_card.dart
│       ├── service_grid_widget.dart
│       ├── service_item.dart
│       └── service_pill.dart
└── main.dart
```

---

## 📱 Halaman yang Tersedia

| Halaman          | Status              | Keterangan                             |
| ---------------- | ------------------- | -------------------------------------- |
| MainPage         | ✅ Selesai          | Navbar bawah + back handler            |
| HomePage         | ✅ Selesai          | Appbar, search, banner, layanan, mitra |
| SearchPage       | ✅ Selesai          | Recent search + search result          |
| ServiceListPage  | ✅ Selesai          | Filter by kategori + pills             |
| AllServicesPage  | ✅ Selesai          | Grid semua layanan                     |
| NotificationPage | ✅ Selesai          | Grouping by date + mark all as read    |
| PromoPage        | 🚧 Dalam pengerjaan | Halaman promo                          |
| BookmarkPage     | 🚧 Dalam pengerjaan | Perlu bookmark provider                |
| ProfilePage      | 🚧 Dalam pengerjaan | Belum dibuat UI                        |
| BookingPage      | 🚧 Dalam pengerjaan | Belum dibuat UI                        |
| CalendarPage     | 🚧 Dalam pengerjaan | Belum dibuat UI                        |
| InboxPage        | 🚧 Dalam pengerjaan | Belum dibuat UI                        |

---

## 🎨 Atomic Design

```
Atoms      → SearchField, Icon, Text
Molecules  → SectionHeader, NotifItem, RecentItem, ServicePill
Organisms  → HomeAppBar, BannerPromo, ServiceGridWidget
Pages      → HomePage, SearchPage, ServiceListPage, dll
```

---

## 🚀 Cara Menjalankan

# Install dependencies

flutter pub get

# Jalankan aplikasi

flutter run / pakai emulator android dan press f5

```

---

## 📝 TODO

```

cek trello

```

---

## 👨‍💻 Developer
```
