# Project Summary (one line)

Build a Flutter mobile MVP that lets farmers register fields and sowing dates, then receives automated, region-customized alerts for crop growth stages, irrigation, fertiliser, weed removal and pest/disease risk — plus a simple admin portal to add/edit crops and their life-cycle stages.

# MVP Scope (must-have)

Farmer mobile app (Flutter): register/login, add field, add crop + sowing date, view timeline, receive alerts (push + in-app). Offline support (cache timeline & alerts).

Admin web portal (simpler: responsive web UI or Flutter web): admin login, manage crops, define life-cycle stages (name + days range + stage notes), define pest/disease windows and remedies, schedule alerts templates.

Backend (minimal): store farmers, fields, crop definitions, compute timelines & generate alerts. Use Firebase or a small hosted backend if preferred.

Push notifications (FCM) and local notifications for offline reminders.

Target users & platforms

Users: Small-holding farmers, agricultural extension officers, admin staff

Platforms: Android + iOS (Flutter). Admin portal: web (responsive) or Flutter web.



# User flows (step-by-step)
Farmer — First time

Open app → language selection (Hindi/English/local).

Register with phone number + OTP (or guest mode).

Onboarding quick questions: region (auto GPS or select), typical crops grown.

Add field: field name, area (hectare/acre), soil type (optional).

Add crop cycle: crop (select), seed variety, sowing date, irrigation type.

System computes timeline and shows calendar/timeline on dashboard.

App schedules alerts and shows upcoming reminders; farmer receives push notifications and can mark actions done.

Farmer — Ongoing

Dashboard shows current stage, days to next stage, and recent alerts.

Alerts page lists upcoming and past alerts with action buttons (Mark Done / Snooze / Note).

Crop Journal: farmer adds yield, notes, photos.

Settings: language, notification preferences, offline sync.

Admin — Basic

Login → admin dashboard.

Crop management: Add new crop (name, description), add seed varieties (name, typical duration).

Phenology editor: For each crop/variety define ordered stages: {stage_name, min_days, max_days, stage_notes, recommended_actions}.

Pest/disease management: Add pests/diseases -> affected_crop, typical_stage_window (relative days), early_warning_offset (days before), remedy/pesticide suggestions.

Alerts templates: define message templates per action/stage (supports variables like {{crop}}, {{date}}, {{stage}}).

Publish changes → synced to mobile app.




# App pages / screens (mobile)
Splash / Language

Auth / OTP (or Guest)

Onboarding (region, crops)

Home / Dashboard — current crop cards, next alert countdown
On clicking a crop card, it should open a screen with the timeline and alerts for that crop.

Add Field / Add Crop — form (crop, variety, sowing date, area)

Timeline / Calendar View — visual phenology timeline mapped to calendar dates

Alerts & Notifications — list with filters (upcoming, past)

Crop Journal — per-crop notes, photos, yield entry

Knowledge Base — pest/disease info, fertilizer tips (read-only content synced from admin)

Settings — language, notification prefs, offline sync, account

Help / Contact KVK — links or phone numbers

# Admin pages (web / mobile admin)
Login / 2FA (simple)

Dashboard — number of active farmers, crops, upcoming system-wide alerts

Crop Library — list, add/edit/delete crop entries

Phenology Editor — drag-add ordered stages with day ranges (UI: stage name + min/max days + notes)

Pests & Diseases — add entries, attach stage windows, remedies, severity, preventive alert offsets

Alert Templates — create/edit notification messages and scheduling rules

Users / Farmers — view farmer accounts, send broadcast messages