# Nike Shoes Store — Flutter UI App

> A clean, modern, and fully responsive Nike shoes store frontend built with Flutter.
> Aplikasi toko sepatu Nike yang bersih, modern, dan responsif sepenuhnya, dibangun dengan Flutter.

---

<p align="center">
  <img src="assets/nike_icon_mark.png" alt="Nike Logo" width="60"/>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white" />
  <img src="https://img.shields.io/badge/Dart-3.8-0175C2?logo=dart&logoColor=white" />
  <img src="https://img.shields.io/badge/Platform-Android%20%7C%20iOS%20%7C%20Windows%20%7C%20macOS%20%7C%20Linux-informational" />
  <img src="https://img.shields.io/badge/Version-1.0.0-success" />
  <img src="https://img.shields.io/badge/License-MIT-yellow" />
</p>

---

## Table of Contents / Daftar Isi

- [English Documentation](#-english-documentation)
  - [About the Project](#about-the-project)
  - [Key Features](#key-features)
  - [Tech Stack](#tech-stack)
  - [Project Structure](#project-structure)
  - [Installation & Setup](#installation--setup)
  - [Running the App](#running-the-app)
  - [Navigation Flow](#navigation-flow)
  - [Design System](#design-system)
  - [Data Model](#data-model)
- [Dokumentasi Bahasa Indonesia](#-dokumentasi-bahasa-indonesia)
  - [Tentang Project](#tentang-project)
  - [Fitur Utama](#fitur-utama)
  - [Teknologi yang Digunakan](#teknologi-yang-digunakan)
  - [Struktur Project](#struktur-project)
  - [Instalasi & Pengaturan](#instalasi--pengaturan)
  - [Menjalankan Aplikasi](#menjalankan-aplikasi)
  - [Alur Navigasi](#alur-navigasi)
  - [Sistem Desain](#sistem-desain)
  - [Model Data](#model-data)
- [GitHub Repository Bio](#github-repository-bio)

---

## 🇺🇸 English Documentation

### About the Project

**Nike Shoes Store** is a Flutter-based mobile and desktop UI application that showcases a modern e-commerce product listing experience for Nike footwear. The app is purely frontend / UI-only — no backend or API integration — making it a great reference for Flutter UI patterns, animations, and design systems.

The app demonstrates:
- Edge-to-edge immersive UI with transparent system bars
- Hero animations between the product list and detail screens
- Frosted glass bottom navigation using `BackdropFilter`
- Pastel color-coded product cards with a shoe pop-out overflow effect
- Clean typography using Google Fonts Poppins

---

### Key Features

| Feature | Description |
|---|---|
| **Animated Splash Screen** | Fade + slide entrance animation, auto-redirects to dashboard after 2.6s |
| **Product Listing Dashboard** | Scrollable card grid with 5 Nike shoe models, real-time category filter chips |
| **Shoe Pop-out Cards** | Product images overflow the card bounds using `Stack(clipBehavior: Clip.none)` for a 3D-like visual effect |
| **Hero Transition** | Smooth shared-element animation of the shoe image between the card and the detail screen |
| **Product Detail Screen** | `SliverAppBar` with collapsible header, size selector (EU 38–44), price in IDR, and an order button |
| **Frosted Glass Bottom Nav** | `BackdropFilter` blur effect on the navigation bar — content renders beneath it via `extendBody: true` |
| **Category Filter** | Animated filter chips (All, Running, Training, Casual, Sport) with `AnimatedContainer` transitions |
| **Edge-to-Edge UI** | `SystemUiMode.edgeToEdge` with fully transparent status bar and navigation bar |
| **Responsive Layout** | All dimensions use `MediaQuery` percentages, adapting to any screen size |
| **IDR Currency Formatting** | Prices formatted using `intl` with Indonesian locale (e.g., `Rp 1.200.000`) |

---

### Tech Stack

| Technology | Version | Purpose |
|---|---|---|
| **Flutter** | ≥ 3.x | Cross-platform UI framework |
| **Dart** | ^3.8.0 | Programming language |
| **google_fonts** | ^6.3.3 | Poppins typeface across all screens |
| **intl** | ^0.20.2 | Indonesian currency formatting (IDR) |
| **cupertino_icons** | ^1.0.8 | iOS-style icon set |
| **flutter_lints** | ^5.0.0 | Code quality & linting |

---

### Project Structure

```
nike-shoes-list-product-app-ui/
│
├── assets/                            # Static image assets
│   ├── Illustration.png               # Splash screen hero illustration
│   ├── nike_icon_mark.png             # Nike swoosh logo
│   ├── Green 1.png                    # Air Max shoe image
│   ├── nike main.png                  # Air Force shoe image
│   ├── Shoe 1.png                     # React Element shoe image
│   ├── toppng.png                     # Free Run shoe image
│   └── Yellow Shoe.png                # Epic React shoe image
│
├── lib/
│   ├── main.dart                      # App entry point, SystemChrome setup
│   │
│   ├── models/
│   │   └── sandal.dart                # Sepatu data model + static product list
│   │
│   ├── pages/
│   │   ├── home.dart                  # Splash / home screen
│   │   └── dashboard.dart             # Dashboard page wrapper (TabController + Scaffold)
│   │
│   ├── screens/
│   │   ├── dashboard_screen.dart      # Product listing layout (search, filters, cards)
│   │   └── detail_sepatu_screen.dart  # Product detail (SliverAppBar, size selector)
│   │
│   └── components/
│       ├── appbar/
│       │   └── appbar_dashboard.dart  # Top search bar + cart badge
│       ├── card/
│       │   └── dashboard_card.dart    # Product cards with pop-out shoe effect
│       └── bottomnav/
│           └── bottomnav.dart         # Frosted glass TabBar navigation
│
├── android/                           # Android platform files
├── ios/                               # iOS platform files
├── linux/                             # Linux platform files
├── macos/                             # macOS platform files
├── windows/                           # Windows platform files
│
├── pubspec.yaml                       # Dependencies & asset declarations
└── README.md                          # This file
```

---

### Installation & Setup

#### Prerequisites

Make sure the following tools are installed on your machine:

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (stable channel, 3.x or later)
- [Dart SDK](https://dart.dev/get-dart) (^3.8.0, bundled with Flutter)
- [Git](https://git-scm.com/)
- An editor: [VS Code](https://code.visualstudio.com/) + Flutter extension, or [Android Studio](https://developer.android.com/studio)
- A simulator/emulator or physical device

#### Steps

1. **Clone the repository**

   ```bash
   git clone https://github.com/your-username/nike-shoes-list-product-app-ui.git
   cd nike-shoes-list-product-app-ui
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Verify your Flutter environment**

   ```bash
   flutter doctor
   ```

   Resolve any issues reported before proceeding.

---

### Running the App

#### On Android (emulator or physical device)

```bash
flutter run
```

#### On a specific device

```bash
# List available devices
flutter devices

# Run on a specific device
flutter run -d <device-id>
```

#### On Windows desktop

```bash
flutter run -d windows
```

#### On macOS desktop

```bash
flutter run -d macos
```

#### Build a release APK (Android)

```bash
flutter build apk --release
```

#### Build a release for iOS

```bash
flutter build ios --release
```

---

### Navigation Flow

```
main.dart
└── MyApp (MaterialApp)
      └── HomePage — Splash screen (fade + slide animation, 2.6s timer)
            └── [auto-push] DashboardPage (extendBody: true, DefaultTabController)
                  ├── DashboardScreen (body)
                  │     ├── appBarDashboard — Search bar + cart icon
                  │     ├── Category filter chips (All, Running, Training, Casual, Sport)
                  │     └── dashboardCard — 5 product cards
                  │           └── [on tap] DetailSepatu
                  │                 ├── SliverAppBar (Hero shoe image)
                  │                 ├── Size selector (EU 38–44)
                  │                 ├── Price + rating
                  │                 └── "Pesan Sekarang" order button
                  └── bottomNav — Frosted glass tab bar (Home, Saved, Notif, Profile)
```

---

### Design System

| Property | Value |
|---|---|
| **Theme mode** | Light only |
| **Background** | `Colors.white` throughout |
| **Primary font** | Google Fonts Poppins (weights: 300–900) |
| **Primary accent** | `Colors.black` |
| **System UI mode** | `SystemUiMode.edgeToEdge` |
| **Status bar** | Transparent, dark icons |
| **Navigation bar** | Transparent, dark icons |
| **Card colors** | 5 pastel tones — green, sky blue, peach, lavender, yellow |
| **Currency locale** | Indonesian (`id`), symbol `Rp`, no decimal digits |
| **EU sizes** | 38, 39, 40, 41, 42, 43, 44 |
| **Hero tag** | Shoe name string (e.g., `"Air Max"`) — consistent between card and detail |

#### Card Color Palette

| Shoe | Card Color | Hex |
|---|---|---|
| Air Max | Soft Green | `#D6F0D6` |
| Air Force | Sky Blue | `#D6E8F8` |
| React Element | Warm Peach | `#FFE8D6` |
| Free Run | Soft Lavender | `#EBD6F8` |
| Epic React | Warm Yellow | `#FDF2CC` |

---

### Data Model

**`Sepatu`** (defined in `lib/models/sandal.dart`)

| Field | Type | Description |
|---|---|---|
| `nama` | `String` | Shoe model name — also used as the Hero animation tag |
| `foto` | `String` | Image filename (e.g., `"Green 1.png"`) |
| `harga` | `int` | Price in Indonesian Rupiah (IDR) |
| `rating` | `double` | Star rating (0.0–5.0) |

#### Available Products

| # | Name | Price (IDR) | Rating |
|---|---|---|---|
| 1 | Air Max | Rp 1.200.000 | ⭐ 4.5 |
| 2 | Air Force | Rp 1.000.000 | ⭐ 4.2 |
| 3 | React Element | Rp 900.000 | ⭐ 4.7 |
| 4 | Free Run | Rp 800.000 | ⭐ 4.0 |
| 5 | Epic React | Rp 1.500.000 | ⭐ 4.8 |

---

---

## 🇮🇩 Dokumentasi Bahasa Indonesia

### Tentang Project

**Nike Shoes Store** adalah aplikasi UI mobile dan desktop berbasis Flutter yang menampilkan pengalaman listing produk e-commerce modern untuk sepatu Nike. Aplikasi ini sepenuhnya bersifat frontend / UI-only — tanpa backend atau integrasi API — sehingga menjadi referensi yang sangat baik untuk pola UI Flutter, animasi, dan sistem desain.

Aplikasi ini mendemonstrasikan:
- UI immersive edge-to-edge dengan status bar dan navigation bar transparan
- Animasi Hero antara layar daftar produk dan layar detail
- Navigasi bawah frosted glass menggunakan `BackdropFilter`
- Kartu produk berwarna pastel dengan efek overflow gambar sepatu
- Tipografi bersih menggunakan Google Fonts Poppins

---

### Fitur Utama

| Fitur | Deskripsi |
|---|---|
| **Splash Screen Teranim** | Animasi fade + slide saat masuk, otomatis beralih ke dashboard setelah 2,6 detik |
| **Dashboard Daftar Produk** | Grid kartu yang dapat di-scroll dengan 5 model sepatu Nike, chip filter kategori real-time |
| **Kartu Pop-out Sepatu** | Gambar produk meluap dari batas kartu menggunakan `Stack(clipBehavior: Clip.none)` untuk efek visual seperti 3D |
| **Transisi Hero** | Animasi elemen bersama yang mulus pada gambar sepatu antara kartu dan layar detail |
| **Layar Detail Produk** | `SliverAppBar` dengan header yang bisa dilipat, pemilih ukuran (EU 38–44), harga dalam IDR, dan tombol pesan |
| **Bottom Nav Frosted Glass** | Efek blur `BackdropFilter` pada navigation bar — konten merender di bawahnya melalui `extendBody: true` |
| **Filter Kategori** | Chip filter teranim (All, Running, Training, Casual, Sport) dengan transisi `AnimatedContainer` |
| **UI Edge-to-Edge** | `SystemUiMode.edgeToEdge` dengan status bar dan navigation bar sepenuhnya transparan |
| **Layout Responsif** | Semua dimensi menggunakan persentase `MediaQuery`, menyesuaikan dengan ukuran layar apa pun |
| **Format Mata Uang IDR** | Harga diformat menggunakan `intl` dengan locale Indonesia (contoh: `Rp 1.200.000`) |

---

### Teknologi yang Digunakan

| Teknologi | Versi | Kegunaan |
|---|---|---|
| **Flutter** | ≥ 3.x | Framework UI lintas platform |
| **Dart** | ^3.8.0 | Bahasa pemrograman |
| **google_fonts** | ^6.3.3 | Tipografi Poppins di seluruh layar |
| **intl** | ^0.20.2 | Format mata uang Rupiah Indonesia (IDR) |
| **cupertino_icons** | ^1.0.8 | Set ikon gaya iOS |
| **flutter_lints** | ^5.0.0 | Kualitas kode & linting |

---

### Struktur Project

```
nike-shoes-list-product-app-ui/
│
├── assets/                            # Aset gambar statis
│   ├── Illustration.png               # Ilustrasi hero splash screen
│   ├── nike_icon_mark.png             # Logo swoosh Nike
│   ├── Green 1.png                    # Sepatu Air Max
│   ├── nike main.png                  # Sepatu Air Force
│   ├── Shoe 1.png                     # Sepatu React Element
│   ├── toppng.png                     # Sepatu Free Run
│   └── Yellow Shoe.png                # Sepatu Epic React
│
├── lib/
│   ├── main.dart                      # Entry point aplikasi, konfigurasi SystemChrome
│   │
│   ├── models/
│   │   └── sandal.dart                # Model data Sepatu + daftar produk statis
│   │
│   ├── pages/
│   │   ├── home.dart                  # Layar splash / home
│   │   └── dashboard.dart             # Wrapper halaman dashboard (TabController + Scaffold)
│   │
│   ├── screens/
│   │   ├── dashboard_screen.dart      # Layout daftar produk (pencarian, filter, kartu)
│   │   └── detail_sepatu_screen.dart  # Detail produk (SliverAppBar, pemilih ukuran)
│   │
│   └── components/
│       ├── appbar/
│       │   └── appbar_dashboard.dart  # Search bar bagian atas + badge keranjang
│       ├── card/
│       │   └── dashboard_card.dart    # Kartu produk dengan efek pop-out sepatu
│       └── bottomnav/
│           └── bottomnav.dart         # Navigasi TabBar frosted glass
│
├── android/                           # File platform Android
├── ios/                               # File platform iOS
├── linux/                             # File platform Linux
├── macos/                             # File platform macOS
├── windows/                           # File platform Windows
│
├── pubspec.yaml                       # Dependensi & deklarasi aset
└── README.md                          # File ini
```

---

### Instalasi & Pengaturan

#### Prasyarat

Pastikan alat-alat berikut sudah terinstal di komputer Anda:

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (channel stable, versi 3.x ke atas)
- [Dart SDK](https://dart.dev/get-dart) (^3.8.0, sudah termasuk dalam Flutter)
- [Git](https://git-scm.com/)
- Editor: [VS Code](https://code.visualstudio.com/) + ekstensi Flutter, atau [Android Studio](https://developer.android.com/studio)
- Simulator/emulator atau perangkat fisik

#### Langkah-langkah

1. **Clone repository**

   ```bash
   git clone https://github.com/your-username/nike-shoes-list-product-app-ui.git
   cd nike-shoes-list-product-app-ui
   ```

2. **Instal dependensi**

   ```bash
   flutter pub get
   ```

3. **Verifikasi lingkungan Flutter**

   ```bash
   flutter doctor
   ```

   Selesaikan setiap masalah yang dilaporkan sebelum melanjutkan.

---

### Menjalankan Aplikasi

#### Di Android (emulator atau perangkat fisik)

```bash
flutter run
```

#### Di perangkat tertentu

```bash
# Tampilkan daftar perangkat yang tersedia
flutter devices

# Jalankan di perangkat tertentu
flutter run -d <device-id>
```

#### Di Windows desktop

```bash
flutter run -d windows
```

#### Di macOS desktop

```bash
flutter run -d macos
```

#### Build APK release (Android)

```bash
flutter build apk --release
```

#### Build release untuk iOS

```bash
flutter build ios --release
```

---

### Alur Navigasi

```
main.dart
└── MyApp (MaterialApp)
      └── HomePage — Splash screen (animasi fade + slide, timer 2,6 detik)
            └── [auto-push] DashboardPage (extendBody: true, DefaultTabController)
                  ├── DashboardScreen (body)
                  │     ├── appBarDashboard — Search bar + ikon keranjang
                  │     ├── Chip filter kategori (All, Running, Training, Casual, Sport)
                  │     └── dashboardCard — 5 kartu produk
                  │           └── [on tap] DetailSepatu
                  │                 ├── SliverAppBar (Hero gambar sepatu)
                  │                 ├── Pemilih ukuran (EU 38–44)
                  │                 ├── Harga + rating
                  │                 └── Tombol "Pesan Sekarang"
                  └── bottomNav — Tab bar frosted glass (Home, Saved, Notif, Profile)
```

---

### Sistem Desain

| Properti | Nilai |
|---|---|
| **Mode tema** | Light only |
| **Background** | `Colors.white` di seluruh layar |
| **Font utama** | Google Fonts Poppins (bobot: 300–900) |
| **Aksen utama** | `Colors.black` |
| **Mode sistem UI** | `SystemUiMode.edgeToEdge` |
| **Status bar** | Transparan, ikon gelap |
| **Navigation bar** | Transparan, ikon gelap |
| **Warna kartu** | 5 warna pastel — hijau, biru langit, peach, lavender, kuning |
| **Locale mata uang** | Indonesia (`id`), simbol `Rp`, tanpa desimal |
| **Ukuran EU** | 38, 39, 40, 41, 42, 43, 44 |
| **Hero tag** | Nama sepatu (contoh: `"Air Max"`) — konsisten antara kartu dan detail |

#### Palet Warna Kartu

| Sepatu | Warna Kartu | Hex |
|---|---|---|
| Air Max | Hijau Lembut | `#D6F0D6` |
| Air Force | Biru Langit | `#D6E8F8` |
| React Element | Peach Hangat | `#FFE8D6` |
| Free Run | Lavender Lembut | `#EBD6F8` |
| Epic React | Kuning Hangat | `#FDF2CC` |

---

### Model Data

**`Sepatu`** (didefinisikan di `lib/models/sandal.dart`)

| Field | Tipe | Deskripsi |
|---|---|---|
| `nama` | `String` | Nama model sepatu — juga digunakan sebagai tag animasi Hero |
| `foto` | `String` | Nama file gambar (contoh: `"Green 1.png"`) |
| `harga` | `int` | Harga dalam Rupiah Indonesia (IDR) |
| `rating` | `double` | Rating bintang (0.0–5.0) |

#### Produk yang Tersedia

| # | Nama | Harga (IDR) | Rating |
|---|---|---|---|
| 1 | Air Max | Rp 1.200.000 | ⭐ 4.5 |
| 2 | Air Force | Rp 1.000.000 | ⭐ 4.2 |
| 3 | React Element | Rp 900.000 | ⭐ 4.7 |
| 4 | Free Run | Rp 800.000 | ⭐ 4.0 |
| 5 | Epic React | Rp 1.500.000 | ⭐ 4.8 |

---

## GitHub Repository Bio

> **Teks di bawah ini direkomendasikan untuk bagian "About" pada repository GitHub Anda**
> **(Settings → Edit repository details → Description):**

```
A clean & modern Nike shoes store UI built with Flutter — features Hero animations, frosted glass nav, pastel product cards with shoe pop-out effect, and full edge-to-edge design. UI-only, no backend required.
```

---

## License

This project is open source and available under the [MIT License](LICENSE).

---

<p align="center">Made with Flutter &amp; ❤️</p>
