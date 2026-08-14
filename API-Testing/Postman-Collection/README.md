# REST API Testing — Postman

Учебный проект по тестированию REST API веб-приложения RealWorld
с использованием Postman.

Цель проекта — продемонстрировать практические навыки тестирования API:
работу с HTTP-запросами, авторизацией, переменными окружения,
позитивными и негативными сценариями и автоматическими проверками.

## 🛠 Инструменты и технологии

- Postman
- REST API
- HTTP
- JSON
- Environment Variables
- Postman Tests
- Token Authorization

## 🔐 Authentication

В проекте реализована работа с авторизацией.

### Login

`POST /api/users/login`

Проверяется:

- успешная авторизация;
- HTTP Status Code `200`;
- наличие token в ответе;
- автоматическое сохранение token в Environment.

Полученный token используется в следующих авторизованных запросах.

## 📝 Articles — CRUD

Реализован полный сценарий работы со статьёй.

### Create Article

`POST /api/articles`

Проверяется:

- HTTP Status Code `201`;
- наличие объекта article;
- наличие slug;
- корректность title;
- автоматическое сохранение slug в Environment.

### Get Article

`GET /api/articles/{{slug}}`

Проверяется:

- HTTP Status Code `200`;
- наличие объекта article;
- соответствие slug сохранённому значению;
- наличие title.

### Update Article

`PUT /api/articles/{{slug}}`

Проверяется:

- HTTP Status Code `200`;
- изменение title;
- изменение description;
- наличие article в ответе;
- сохранение актуального slug.

### Delete Article

`DELETE /api/articles/{{slug}}`

Фактический результат API:

- HTTP Status Code `200`.

После удаления выполняется дополнительный GET-запрос.

### Get Deleted Article

`GET /api/articles/{{slug}}`

Ожидаемый и фактический результат:

- HTTP Status Code `404`.

Таким образом проверяется, что удалённый ресурс больше недоступен.

## ❌ Negative Testing

В проекте также реализованы негативные сценарии.

### Создание статьи без авторизации

`POST /api/articles`

Ожидаемый и фактический результат:

`401 Unauthorized`

### Получение несуществующей статьи

`GET /api/articles/nonexistent-article-qa-test`

Ожидаемый и фактический результат:

`404 Not Found`

### Авторизация с неправильным паролем

`POST /api/users/login`

Ожидаемый и фактический результат:

`422 Unprocessable Entity`

## ⚙️ Environment Variables

В коллекции используются:

- `{{baseUrl}}`
- `{{email}}`
- `{{password}}`
- `{{token}}`
- `{{slug}}`

Token после успешной авторизации сохраняется автоматически.

Slug созданной статьи также автоматически сохраняется
и используется в последующих GET, PUT и DELETE-запросах.

## 🤖 Postman Tests

Для автоматических проверок используются Postman Tests.

Пример проверки HTTP Status Code:

```javascript
pm.test("Status code is 200", function () {
    pm.response.to.have.status(200);
});

Пример проверки данных ответа:

const jsonData = pm.response.json();

pm.test("Response contains article", function () {
    pm.expect(jsonData.article).to.exist;
});

Пример сохранения переменной:

const jsonData = pm.response.json();

if (jsonData.article && jsonData.article.slug) {
    pm.environment.set("slug", jsonData.article.slug);
}
