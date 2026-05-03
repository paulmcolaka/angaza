# Angaza Present

> **"To Illuminate"** — Professional church presentation software built for the African market.

[![Platform](https://img.shields.io/badge/Platform-Windows%20%7C%20macOS-1B3A5C?style=flat-square)](https://angaza.app/download)
[![License](https://img.shields.io/badge/License-Commercial-C9920A?style=flat-square)](LICENSE.md)
[![Made for Africa](https://img.shields.io/badge/Made%20for-Africa-1B5E35?style=flat-square)](https://angaza.app)
[![Payment](https://img.shields.io/badge/Pay%20via-M--Pesa-00A651?style=flat-square)](https://angaza.app/pricing)

---

## What is Angaza Present?

Angaza Present is a church presentation platform engineered from the ground up for the African church — not exported from the West with a currency converter attached. It runs on the hardware African churches already own, accepts payment via M-Pesa, works 100% offline, and includes an AI Sermon Assist system that transcribes and detects Scripture references locally on the operator's machine — no cloud, no API fees, no internet dependency.

**The problem it solves:** Over 600,000 churches in Sub-Saharan Africa project Scripture, lyrics, and sermon content every Sunday. The tools they are forced to use — ProPresenter, EasyWorship — require expensive dedicated GPUs, USD credit card billing, and constant cloud connectivity. Angaza Present removes all three barriers.

---

## Key Features

### Offline-First Architecture
The entire application — Bible search, lyrics, AI Sermon Assist, slide rendering, and media playback — works without an internet connection once set up. A hardware-bound cryptographic lease allows the subscription to be enforced offline for up to 35 days before requiring an online renewal.

### M-Pesa Native Payments
Subscriptions and marketplace theme purchases are paid directly via Safaricom M-Pesa STK Push. No credit card required. No USD conversion. KES pricing throughout.

### Dual-Screen Presentation Engine
- **Control Screen** — operator dashboard: library, preview, stage display, AI queue
- **Projector Screen** — clean, frameless fullscreen output on the secondary display
- Switching between slides uses a CrossFade transition at 60fps on Intel HD Graphics

### Bible Engine
- KJV and Swahili Union Version bundled — no download required
- Additional versions downloadable via API.Bible (stored locally in SQLite, works offline after download)
- **Dual-Translation Mode** — display English and Swahili (or any two versions) side-by-side or stacked
- Full-text search via SQLite FTS5 — results in under 30ms

### AI Sermon Assist (Local — No Cloud)
- Captures microphone audio in 5-second chunks during the service
- Transcribes locally using **whisper.cpp** (Faster Whisper compiled binary)
  - Standard tier: `ggml-tiny.bin` (~75 MB, downloaded once from CDN)
  - Mega tier: `ggml-base.bin` (~142 MB, better accuracy and Swahili support)
- **Layer 1 Detection** — Regex parser for explicit references ("John 3:16", "Romans 8 verse 28")
- **Layer 2 Detection** — FTS5 semantic search for paraphrased or implied Scripture
- Detected verses appear in the AI queue — operator reviews and sends to projector with one tap
- Audio is processed entirely in memory — never written to disk, never sent to any server

### Creator Marketplace
- Browse and install `.agt` (Angaza Theme) files — ZIP packages containing `manifest.json` + assets
- African-designed themes including Adinkra, Kente, Maasai, Ndebele, and Bogolan pattern overlays
- **90% revenue share** for creators — the highest in the church software industry
- M-Pesa payment for premium themes
- Creator Studio — browser-based Fabric.js canvas editor at 1920×1080

### Hardware Binding & Cryptographic Lease
- Machine fingerprint: SHA-256 hash of hardware identifiers
- RS256-signed JWT lease — private key server-side, public key embedded in the binary
- Clock tamper detection via hidden timestamp file (prevents system clock rollback attacks)
- **Grace period (Days 31–35):** warning overlay on control screen only — projector output stays clean
- **Lockout (Day 36+):** Read Only mode until online renewal

---

## Subscription Tiers

| Feature | Starter | Standard | Mega |
|---|---|---|---|
| **Price (monthly)** | KES 1,500 | KES 3,000 | KES 5,500 |
| **Price (annual)** | KES 15,000 | KES 30,000 | KES 55,000 |
| Screen outputs | 1 | 2 | Unlimited |
| Offline Bibles | 2 | Unlimited | Unlimited |
| Dual Translation | — | ✓ | ✓ |
| Stage Display | — | ✓ | ✓ |
| NDI Output | — | — | ✓ |
| Free themes/month | 0 | 5 | Unlimited |
| AI Sermon Assist | — | ✓ Tiny model | ✓ Base model |
| Devices | 1 | 2 | Unlimited |
| 3-day free trial | ✓ | ✓ | ✓ |

All subscriptions paid via M-Pesa or card. Annual plans save the equivalent of 2 months.

---

## Technology Stack

### Desktop Application
| Component | Technology |
|---|---|
| Framework | Flutter (Windows + macOS native) |
| State management | Riverpod (StateNotifier + ConsumerWidget) |
| Local database | SQLite via `sqflite_common_ffi` (desktop FFI) |
| Full-text search | SQLite FTS5 with Porter stemmer |
| AI transcription | whisper.cpp via Dart FFI |
| Video playback | fvp (Flutter Video Player via MPV) |
| Secure storage | flutter_secure_storage |
| Networking | Dio with JWT interceptor |
| Window management | window_manager + screen_retriever |

### Backend & API
| Component | Technology |
|---|---|
| Framework | Next.js 14 (App Router, TypeScript) |
| ORM | Prisma |
| Database | PostgreSQL |
| Authentication | NextAuth.js v5 (credentials + magic link) |
| Payments | Safaricom Daraja API (M-Pesa) |
| File storage | Backblaze B2 + Cloudflare CDN |
| Deployment | Coolify (self-hosted, Traefik SSL) |

### No Dependencies On
- ~~Supabase~~ — replaced by PostgreSQL + Prisma + NextAuth
- ~~Vercel~~ — replaced by Coolify on a self-hosted VPS
- ~~Cloud AI APIs~~ — replaced by local whisper.cpp
- ~~AWS / GCP~~ — Backblaze B2 for storage (zero egress via Cloudflare)

---

## Architecture Overview

```
┌─────────────────────────────────────────────────────────────────┐
│                    OPERATOR'S MACHINE                           │
│                                                                 │
│  ┌─────────────────────────┐   ┌──────────────────────────┐    │
│  │   Control Screen         │   │   Projector Screen        │    │
│  │   (Flutter Window 1)     │   │   (Flutter Window 2)      │    │
│  │                         │   │   Frameless, fullscreen   │    │
│  │  Library | Preview | AI │   │   on secondary display    │    │
│  │  Bible | Lyrics | Stage │   │                           │    │
│  └────────────┬────────────┘   └──────────────────────────┘    │
│               │  LiveSlideNotifier (Riverpod)                   │
│               └──────────────────────────────►                  │
│                                                                 │
│  ┌──────────────────────────────────────────────────────────┐   │
│  │                  LOCAL SERVICES                          │   │
│  │  SQLite (Bibles, Lyrics, Media)  whisper.cpp (AI FFI)   │   │
│  │  Cryptographic Lease Manager     Clock Guard            │   │
│  └──────────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────────┘
                              │
                    (HTTPS — when online)
                              │
┌─────────────────────────────▼───────────────────────────────────┐
│                    COOLIFY VPS                                  │
│                                                                 │
│  ┌──────────────────────┐   ┌─────────────────────────────┐    │
│  │   Next.js App        │   │   PostgreSQL                 │    │
│  │   angaza.app         │   │   (Coolify managed)          │    │
│  │                      │   │                             │    │
│  │   /api/lease/**      │   │   Users, Subscriptions,     │    │
│  │   /api/mpesa/**      │   │   Devices, Leases,          │    │
│  │   /api/themes/**     │   │   Themes, Creators,         │    │
│  │   /api/bible/**      │   │   PayoutLedger              │    │
│  │   /api/auth/**       │   │                             │    │
│  │   /api/payouts/**    │   └─────────────────────────────┘    │
│  │   /api/admin/**      │                                      │
│  └──────────────────────┘   ┌─────────────────────────────┐    │
│                             │   Traefik (reverse proxy)    │    │
│  ┌──────────────────────┐   │   Auto SSL (Let's Encrypt)   │    │
│  │   Backblaze B2 CDN   │   └─────────────────────────────┘    │
│  │   Theme .agt files   │                                      │
│  │   Whisper models     │                                      │
│  └──────────────────────┘                                      │
└─────────────────────────────────────────────────────────────────┘
```

---

## Project Structure

### Desktop Application (`angaza_present/`)

```
angaza_present/
├── lib/
│   ├── main.dart                         # Entry point — Riverpod ProviderScope, WindowManager, SQLite FFI
│   ├── app/
│   │   ├── config/
│   │   │   └── api_config.dart           # dart-define constants (API_BASE_URL, APP_VERSION)
│   │   └── theme/
│   │       ├── angaza_colors.dart        # African design palette (Midnight Baobab, Acacia Gold, etc.)
│   │       └── angaza_theme.dart         # ThemeData — typography, tokens, component styles
│   ├── core/
│   │   ├── constants/                    # App-wide constants
│   │   ├── errors/                       # Custom error types
│   │   └── utils/                        # Shared utilities
│   ├── features/
│   │   ├── presentation/                 # Slide management, playlist, live state
│   │   ├── bible/                        # Bible download, search, dual-translation UI
│   │   ├── lyrics/                       # Song library, import, section navigator
│   │   ├── media/                        # Media library, thumbnail grid, import
│   │   ├── marketplace/                  # Theme browser, installer, purchase flow
│   │   └── ai_assist/                    # AI queue UI, model download dialog, controls
│   ├── services/
│   │   ├── api/
│   │   │   └── api_client.dart           # Dio client with JWT interceptor
│   │   ├── database/
│   │   │   ├── database_helper.dart      # SQLite FFI singleton + schema migrations
│   │   │   ├── bible_repository.dart     # importBible, getVerse, getDualPassage, semanticSearch
│   │   │   ├── lyrics_repository.dart    # Song CRUD + FTS5 search
│   │   │   └── media_repository.dart     # Media catalog + thumbnail cache
│   │   ├── security/
│   │   │   ├── hardware_id.dart          # SHA-256 machine fingerprint
│   │   │   ├── clock_guard.dart          # Tamper detection via hidden timestamp
│   │   │   ├── lease_manager.dart        # JWT validation, Active/Grace/Expired status
│   │   │   └── secure_vault.dart         # flutter_secure_storage wrapper
│   │   ├── window/
│   │   │   └── window_service.dart       # Multi-monitor detection + window positioning
│   │   └── ai_assist/
│   │       ├── audio_capture_service.dart # Continuous mic capture (5s PCM chunks)
│   │       ├── whisper_ffi.dart          # Dart FFI bindings to whisper.cpp
│   │       ├── whisper_downloader.dart   # Model download + SHA-256 verification
│   │       └── verse_detector.dart       # Layer 1 (Regex) + Layer 2 (FTS5) detection
│   ├── providers/
│   │   ├── live_slide_provider.dart      # LiveSlideNotifier — current projector state
│   │   ├── license_provider.dart         # LicenseNotifier — subscription tier and status
│   │   ├── ai_assist_provider.dart       # AiQueueNotifier — verse suggestion queue
│   │   └── window_provider.dart          # Monitor count and window state
│   ├── screens/
│   │   ├── control/
│   │   │   ├── control_screen.dart       # 5-panel operator dashboard
│   │   │   └── widgets/                  # Toolbar, panels, grace bar, AI queue, offline dot
│   │   └── projector/
│   │       └── projector_screen.dart     # Clean, frameless projector output
│   ├── components/
│   │   └── projector/
│   │       ├── slide_renderer.dart       # AnimatedSwitcher + SlideContent
│   │       ├── auto_size_text_widget.dart # LayoutBuilder-based text scaling
│   │       ├── dual_view_layout.dart     # Horizontal/vertical split for two translations
│   │       └── background_layer.dart     # Color / Image / Video (fvp) backgrounds
│   └── shared/
│       ├── models/
│       │   ├── slide_data.dart           # SlideData — text, background, layout, alignment
│       │   ├── bible_model.dart          # BibleVersion, Book, Verse, DualVerse
│       │   ├── song_model.dart           # Song, SongSection
│       │   ├── media_model.dart          # MediaItem
│       │   └── detected_verse.dart       # DetectedVerse — reference, confidence, source
│       └── widgets/                      # Shared UI components
├── pubspec.yaml
└── build scripts/
    └── build_windows.sh                  # flutter build windows with dart-define flags
```

### Web Application (`angaza-web/`)

```
angaza-web/
├── app/
│   ├── api/
│   │   ├── health/route.ts               # DB health check
│   │   ├── auth/[...nextauth]/route.ts   # NextAuth handler
│   │   ├── auth/flutter-token/route.ts   # Issues app JWT to Flutter after auth
│   │   ├── lease/
│   │   │   ├── validate/route.ts         # Device registration + lease issuance
│   │   │   └── renew/route.ts            # Lease renewal
│   │   ├── mpesa/
│   │   │   ├── stk-push/route.ts         # Initiates M-Pesa STK push
│   │   │   ├── webhook/route.ts          # Safaricom C2B callback
│   │   │   ├── status/[id]/route.ts      # Payment status polling
│   │   │   └── b2c/route.ts              # Creator payout via Daraja B2C
│   │   ├── themes/
│   │   │   ├── route.ts                  # Browse (GET) + submit (POST)
│   │   │   ├── [id]/download/route.ts    # Signed B2 URL (purchase-gated)
│   │   │   └── [id]/purchase/route.ts    # Theme M-Pesa payment
│   │   ├── bible/
│   │   │   ├── versions/route.ts         # API.Bible catalog proxy
│   │   │   └── download/[id]/route.ts    # Bible JSON proxy
│   │   ├── creators/route.ts             # Creator registration
│   │   ├── payouts/
│   │   │   ├── route.ts                  # Payout request (KES 500 minimum)
│   │   │   └── webhook/route.ts          # M-Pesa B2C callback
│   │   ├── cron/
│   │   │   └── monthly-payouts/route.ts  # Monthly earnings calc (called by Coolify cron)
│   │   └── admin/
│   │       ├── themes/[id]/approve/route.ts
│   │       ├── creators/route.ts
│   │       └── analytics/route.ts
│   ├── (marketing)/
│   │   ├── page.tsx                      # Landing page
│   │   ├── features/page.tsx
│   │   ├── pricing/page.tsx
│   │   └── download/page.tsx
│   ├── (auth)/
│   │   ├── login/page.tsx
│   │   └── register/page.tsx
│   ├── (dashboard)/
│   │   ├── layout.tsx                    # Auth guard
│   │   └── dashboard/page.tsx
│   ├── (marketplace)/
│   │   ├── marketplace/page.tsx
│   │   └── marketplace/[id]/page.tsx
│   └── (creator)/
│       ├── creator/studio/page.tsx       # Fabric.js theme builder
│       └── creator/dashboard/page.tsx
├── lib/
│   ├── prisma.ts                         # PrismaClient singleton
│   ├── auth.ts                           # NextAuth config
│   ├── backblaze.ts                      # Signed B2 URL generation
│   └── services/
│       └── mpesa.ts                      # MpesaService — token caching, STK push, B2C
├── prisma/
│   ├── schema.prisma                     # All 11 models — User, Subscription, Device, Lease, etc.
│   └── seed.ts                           # Seeds 3 SubscriptionTier rows
├── Dockerfile                            # Multi-stage build, standalone output, Prisma migrate on start
├── docker-entrypoint.sh                  # npx prisma migrate deploy && node server.js
└── next.config.ts                        # output: "standalone"
```

---

## Getting Started

### Prerequisites

**Desktop development:**
- Flutter SDK 3.22+
- Windows: Visual Studio 2022 with C++ workload, or macOS: Xcode 15+
- Git

**Web development:**
- Node.js 20+
- npm or pnpm
- Docker (for local PostgreSQL)
- A Coolify instance (for deployment)

---

### Desktop — Local Development

```bash
# 1. Clone the repository
git clone https://github.com/your-org/angaza-present.git
cd angaza-present/angaza_present

# 2. Install Flutter dependencies
flutter pub get

# 3. Run on Windows (development)
flutter run -d windows \
  --dart-define=API_BASE_URL=http://localhost:3000/api \
  --dart-define=APP_VERSION=1.0.0-dev

# 4. Run on macOS (development)
flutter run -d macos \
  --dart-define=API_BASE_URL=http://localhost:3000/api \
  --dart-define=APP_VERSION=1.0.0-dev
```

**Build for production:**
```bash
# Windows installer
flutter build windows \
  --dart-define=API_BASE_URL=https://angaza.app/api \
  --dart-define=APP_VERSION=1.0.0

# macOS DMG
flutter build macos \
  --dart-define=API_BASE_URL=https://angaza.app/api \
  --dart-define=APP_VERSION=1.0.0
```

> **Important:** Never hardcode `API_BASE_URL` or any secrets in source files. Always pass via `--dart-define` at build time. Store production values as CI/CD secrets.

---

### Web Application — Local Development

```bash
cd angaza-web

# 1. Install dependencies
npm install

# 2. Start a local PostgreSQL instance
docker run -d \
  --name angaza-postgres \
  -e POSTGRES_USER=angaza \
  -e POSTGRES_PASSWORD=localpassword \
  -e POSTGRES_DB=angaza \
  -p 5432:5432 \
  postgres:15-alpine

# 3. Create .env.local (never commit this file)
cat > .env.local << EOF
DATABASE_URL=postgresql://angaza:localpassword@localhost:5432/angaza
NEXTAUTH_URL=http://localhost:3000
NEXTAUTH_SECRET=dev-secret-change-in-production-32chars
APP_JWT_SECRET=dev-app-jwt-secret-change-in-production
LEASE_PRIVATE_KEY=   # RSA private key, base64 encoded
MPESA_CONSUMER_KEY=  # Daraja sandbox key
MPESA_CONSUMER_SECRET=
MPESA_PASSKEY=
MPESA_SHORTCODE=
MPESA_CALLBACK_URL=https://your-tunnel-url.ngrok.io/api/mpesa/webhook
B2_KEY_ID=
B2_APPLICATION_KEY=
B2_BUCKET_NAME=angaza-themes-dev
BIBLE_API_KEY=
ADMIN_SECRET=dev-admin-secret
CRON_SECRET=dev-cron-secret
EMAIL_SERVER=smtp://localhost:1025
EMAIL_FROM=Angaza Present <dev@angaza.app>
EOF

# 4. Run database migrations and seed
npx prisma migrate dev --name init
npx prisma db seed

# 5. Start the development server
npm run dev
```

The app is now running at `http://localhost:3000`.
Prisma Studio (database GUI): `npx prisma studio`

---

### Deployment — Coolify (Production)

Angaza Present deploys entirely on Coolify with no dependency on Supabase Cloud or Vercel.

**Services deployed on Coolify:**
1. **PostgreSQL** — Coolify managed database resource (internal connection only, no public port)
2. **Next.js app** — Application resource, Dockerfile build, `angaza.app` domain
3. **Monthly payout cron** — Coolify Cron resource: `0 1 1 * *` → `POST https://angaza.app/api/cron/monthly-payouts`

**Required environment variables** (set in Coolify, never in `.env` files committed to git):

| Variable | Required By | Notes |
|---|---|---|
| `DATABASE_URL` | Next.js (server only) | Internal Coolify PostgreSQL URL |
| `NEXTAUTH_URL` | Next.js | `https://angaza.app` |
| `NEXTAUTH_SECRET` | Next.js | 32+ random bytes |
| `APP_JWT_SECRET` | Next.js | Signs Flutter app JWTs |
| `LEASE_PRIVATE_KEY` | Next.js | RSA PEM, base64 encoded |
| `NEXT_PUBLIC_APP_URL` | Next.js (client) | `https://angaza.app` |
| `MPESA_CONSUMER_KEY` | Next.js (server only) | Daraja production key |
| `MPESA_CONSUMER_SECRET` | Next.js (server only) | |
| `MPESA_PASSKEY` | Next.js (server only) | |
| `MPESA_SHORTCODE` | Next.js (server only) | Paybill number |
| `MPESA_CALLBACK_URL` | Next.js (server only) | `https://angaza.app/api/mpesa/webhook` |
| `B2_KEY_ID` | Next.js (server only) | Backblaze B2 |
| `B2_APPLICATION_KEY` | Next.js (server only) | |
| `B2_BUCKET_NAME` | Next.js (server only) | Private theme bucket |
| `BIBLE_API_KEY` | Next.js (server only) | API.Bible key |
| `ADMIN_SECRET` | Next.js (server only) | Guards `/api/admin/**` |
| `CRON_SECRET` | Next.js (server only) | Guards `/api/cron/**` |
| `EMAIL_SERVER` | Next.js (server only) | SMTP for magic links |
| `EMAIL_FROM` | Next.js (server only) | |

> **Security rule:** Any variable containing a secret must NOT have a `NEXT_PUBLIC_` prefix. Only `NEXT_PUBLIC_APP_URL` is safe to expose to the browser.

**Admin panel access restriction** (Traefik labels, set in Coolify → Next.js resource → Labels):
```
traefik.http.middlewares.admin-ip.ipwhitelist.sourcerange=YOUR.IP.ADDRESS/32
traefik.http.routers.angaza-admin.rule=Host(`angaza.app`) && PathPrefix(`/admin`)
traefik.http.routers.angaza-admin.middlewares=admin-ip@docker
```

---

## Whisper Model Setup

The AI Sermon Assist models are not bundled with the installer. They are downloaded on first activation.

**Upload to Backblaze B2** (place in the `whisper/` folder of your CDN bucket):

| File | Size | Tier | Source |
|---|---|---|---|
| `ggml-tiny.bin` | ~75 MB | Standard | [ggerganov/whisper.cpp on HuggingFace](https://huggingface.co/ggerganov/whisper.cpp) |
| `ggml-tiny.bin.sha256` | <1 KB | Standard | Generate with `sha256sum ggml-tiny.bin` |
| `ggml-base.bin` | ~142 MB | Mega | HuggingFace (see above) |
| `ggml-base.bin.sha256` | <1 KB | Mega | |
| `whisper.dll` | ~10 MB | Windows | Build from [whisper.cpp](https://github.com/ggerganov/whisper.cpp) |
| `libwhisper.dylib` | ~10 MB | macOS | Build from whisper.cpp (must be notarised) |

The Flutter app verifies the SHA-256 checksum after every download before loading the model. A corrupted or tampered model file is rejected and deleted.

---

## Creator Marketplace

### Publishing a Theme

1. Register as a creator at `https://angaza.app/creator/register`
2. Design your theme in the Angaza Creator Studio (browser-based Fabric.js canvas, 1920×1080)
3. Export as a `.agt` file — the studio packages it automatically
4. Submit for review — admin reviews within 48 hours
5. Once approved, your theme is live in the marketplace

### `.agt` File Format

An `.agt` file is a ZIP archive with the following structure:

```
my-theme.agt
├── manifest.json       # Required — layout, colors, font pairings, version
├── preview.jpg         # Required — 1920×1080 JPEG preview image
├── assets/
│   ├── background.jpg  # or background.mp4 for motion themes
│   ├── pattern.svg     # optional overlay
│   └── fonts/          # optional bundled fonts
```

`manifest.json` schema:
```json
{
  "name": "Maono wa Mungu",
  "version": "1.0",
  "agtVersion": "1.0",
  "author": "Creator Display Name",
  "category": "worship",
  "background": "assets/background.jpg",
  "backgroundType": "image",
  "primaryFont": "Montserrat",
  "primaryFontSize": 72,
  "primaryColor": "#FFFFFF",
  "secondaryFont": "Montserrat",
  "secondaryFontSize": 48,
  "secondaryColor": "#EEEEEE",
  "textAlign": "center",
  "layout": "single",
  "pattern": "assets/pattern.svg",
  "patternOpacity": 0.15
}
```

### Revenue Share

Creators keep **90%** of every sale. Angaza retains 10%. Payouts are processed monthly via M-Pesa B2C to the creator's registered Safaricom number. Minimum payout threshold: KES 500.

---

## Security

### Reporting Vulnerabilities

Please **do not** open a public GitHub issue for security vulnerabilities. Email `security@angaza.app` with:
- A description of the vulnerability
- Steps to reproduce
- Potential impact
- Your suggested fix (if any)

We will respond within 48 hours and aim to patch critical issues within 7 days.

### Security Architecture Summary

| Layer | Mechanism |
|---|---|
| Hardware binding | SHA-256(device identifiers) — prevents installation sharing |
| Lease signing | RS256 asymmetric JWT — private key server-side, public key in binary |
| Clock tamper detection | Hidden timestamp in flutter_secure_storage — detects rollback |
| Database access | Prisma parameterised queries only — no raw string interpolation |
| API authentication | NextAuth.js JWT sessions + separate App JWT for Flutter |
| Admin panel | Traefik IP allowlist + ADMIN_SECRET header (two independent layers) |
| Payment processing | Idempotency keys on all M-Pesa webhooks — prevents double-crediting |
| Audio privacy | Processed in memory only — zero disk writes, zero server transmission |
| Secrets management | Coolify environment variables — never in source code or `.env` files in git |

---

## Roadmap

### Phase 1 — Beachhead (Year 1)
- [x] Core presentation engine (Flutter)
- [x] Bible Engine — SQLite + FTS5 + dual translation
- [x] AI Sermon Assist — local whisper.cpp
- [x] M-Pesa subscription payments
- [x] Hardware-bound cryptographic lease
- [x] Creator Marketplace (basic)
- [ ] Windows installer with auto-updater (WinSparkle)
- [ ] macOS DMG with notarisation + Sparkle updater

### Phase 2 — East Africa Expansion (Year 2)
- [ ] MTN Mobile Money integration (Uganda)
- [ ] M-Pesa Tanzania support (Vodacom)
- [ ] Denomination bulk licensing portal
- [ ] NDI output (live streaming, Mega tier)
- [ ] Stage Display app for pastor's tablet/phone

### Phase 3 — Continental (Year 3)
- [ ] Nigeria launch — Paystack integration
- [ ] French language support (DRC, Cameroon, Senegal)
- [ ] Amharic Bible (Ethiopia)
- [ ] Diaspora church package (USD pricing)
- [ ] Offline creator tools (desktop-based .agt builder)

---

## Contributing

Angaza Present is a commercial product. Contributions from the African developer community are welcome under specific conditions:

1. **Bug reports** — Open a GitHub issue with steps to reproduce and system information
2. **Feature requests** — Open a GitHub discussion, not an issue
3. **Code contributions** — Must be preceded by signing a Contributor License Agreement (CLA)
4. **Theme contributions** — Submit via the Creator Studio at `https://angaza.app/creator/register`

We particularly welcome contributions from Kenyan, East African, and broader African developers who understand the local context.

---

## Support

| Channel | Use for |
|---|---|
| `support@angaza.app` | Subscription, billing, account issues |
| `security@angaza.app` | Security vulnerability reports |
| GitHub Issues | Software bugs (not billing or account issues) |
| GitHub Discussions | Feature requests, architecture questions |
| WhatsApp Community | Community support, announcements (link at angaza.app) |

**Response times:** Starter — 48 hours. Standard — 24 hours. Mega — same business day.

---

## License

Angaza Present is proprietary software. See [LICENSE.md](LICENSE.md) for full terms.

The desktop application is licensed per-device, per-subscription-tier. The creator marketplace theme files you purchase are licensed for use within Angaza Present only. The creator's intellectual property remains their own.

---

## Legal

Angaza Technologies Ltd. is registered in the Republic of Kenya.
Registered address: Nairobi, Kenya.

M-Pesa is a registered trademark of Safaricom PLC.
whisper.cpp is developed by Georgi Gerganov and licensed under the MIT License.
Flutter is developed by Google and licensed under the BSD 3-Clause License.

---

*Angaza — "To Illuminate." Built for the African church. Built to win.*
