# KinoPoisk

![Flutter](https://img.shields.io/badge/Flutter-3.38+-02569B?logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.10+-0175C2?logo=dart&logoColor=white)
![Supabase](https://img.shields.io/badge/Supabase-Auth%20%2B%20Postgres-3FCF8E?logo=supabase&logoColor=white)
![TMDB API](https://img.shields.io/badge/API-TMDB-01D277)

Мобильное приложение для поиска фильмов и ведения пользовательских списков.

## Быстрый старт
1. Установить зависимости:
```bash
flutter pub get
```
2. Создать `api-keys.json` в корне проекта:
```json
{
  "TMDB_API_KEY": "your_tmdb_key",
  "SUPABASE_URL": "https://your-project.supabase.co",
  "SUPABASE_KEY": "your_supabase_publishable_key"
}
```
3. Запустить приложение:
```bash
flutter run --dart-define-from-file=api-keys.json
```

## План работы
### П1
- Сделать модель данных не зависимую от конкретного API 
- Зафиксировать SQL-схему
- Довести до ума UI/UX

### П2
- Добавить кэширование для ускорения и офлайн-поведения
- Добавить кастомные списки пользователя
- Написать минимальный набор тестов
- Настроить CI: `flutter analyze`, `flutter test`, сборка debug/release

### П3
- Рекомендации и персонализация
- Фильтры/сортировки в поиске
- Полировка UI