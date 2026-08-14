# API Testing Screenshots

В этом разделе представлены примеры выполнения REST API-запросов в Postman и результаты автоматических проверок.

## Скриншоты

### Login
Успешная авторизация пользователя.

- Method: POST
- Status: 200 OK
- Проверка наличия token
- Автоматическое сохранение token в Environment

### Create Article
Создание новой статьи.

- Method: POST
- Status: 201 Created
- Проверка объекта article
- Проверка slug
- Автоматическое сохранение slug

### Update Article
Обновление существующей статьи.

- Method: PUT
- Status: 200 OK
- Проверка обновления title
- Проверка обновления description
- Сохранение актуального slug

### Negative Test — Unauthorized Request
Попытка создать статью без авторизации.

- Method: POST
- Status: 401 Unauthorized
- Проверка ограничения доступа к защищённому endpoint

## Инструменты

- Postman
- REST API
- HTTP
- JSON
- Postman Tests
- Environment Variables
