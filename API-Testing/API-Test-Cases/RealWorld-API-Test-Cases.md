# 🔌 RealWorld API Test Cases

В разделе представлены тест-кейсы для ручного тестирования REST API приложения **RealWorld** в Postman.

Проверки охватывают авторизацию, CRUD статей, негативные сценарии, HTTP-статусы, JSON и переменные окружения.

---

## 🌐 Окружение

- **API:** RealWorld
- **Инструмент:** Postman
- **Формат данных:** JSON
- **Авторизация:** Bearer Token
- Переменные: `{{baseUrl}}`, `{{email}}`, `{{password}}`, `{{token}}`, `{{slug}}`

---

# 📋 Test Cases

## TC-001 — Успешная авторизация пользователя

**Метод:** `POST`  
**Endpoint:** `/api/users/login`

**Предусловие:** пользователь зарегистрирован.

**Body:**
```json
{"user":{"email":"{{email}}","password":"{{password}}"}}
```

**Шаги:**
1. Отправить POST-запрос.
2. Передать корректные Email и Password.
3. Проверить ответ.

**Ожидаемый результат:** `200 OK`, объект `user` и токен авторизации присутствуют; токен можно сохранить в `{{token}}`.

---

## TC-002 — Авторизация с неверным паролем

**Метод:** `POST`  
**Endpoint:** `/api/users/login`

**Шаги:** отправить существующий Email и неверный пароль.

**Ожидаемый результат:** авторизация не выполняется, возвращается ошибка валидации, токен отсутствует.

---

## TC-003 — Создание статьи с валидными данными

**Метод:** `POST`  
**Endpoint:** `/api/articles`

**Предусловие:** пользователь авторизован; `Authorization: Token {{token}}`.

**Body:**
```json
{
  "article": {
    "title": "QA Article {{$timestamp}}",
    "description": "Учусь тестировать API",
    "body": "Это статья, созданная через Postman.",
    "tagList": ["QA", "Postman"]
  }
}
```

**Ожидаемый результат:** `201 Created`, объект `article` присутствует, возвращённый `slug` можно сохранить в `{{slug}}`.

---

## TC-004 — Получение созданной статьи

**Метод:** `GET`  
**Endpoint:** `/api/articles/{{slug}}`

**Предусловие:** статья создана, `{{slug}}` заполнен.

**Ожидаемый результат:** `200 OK`; возвращается нужная статья; `slug`, title, description и body соответствуют созданным данным.

---

## TC-005 — Обновление статьи

**Метод:** `PUT`  
**Endpoint:** `/api/articles/{{slug}}`

**Предусловие:** пользователь авторизован, статья существует.

**Body:**
```json
{
  "article": {
    "title": "QA Article Updated",
    "description": "Обновленное описание",
    "body": "Это обновленная статья через Postman."
  }
}
```

**Ожидаемый результат:** `200 OK`; данные статьи обновлены и соответствуют отправленным значениям.

---

## TC-006 — Удаление статьи

**Метод:** `DELETE`  
**Endpoint:** `/api/articles/{{slug}}`

**Предусловие:** пользователь авторизован, статья существует.

**Ожидаемый результат:** запрос выполняется успешно, статья удалена; повторный GET должен вернуть `404 Not Found`.

---

## TC-007 — Получение удалённой статьи

**Метод:** `GET`  
**Endpoint:** `/api/articles/{{slug}}`

**Предусловие:** статья удалена.

**Ожидаемый результат:** `404 Not Found`; статья не возвращается.

---

## TC-008 — Создание статьи без токена

**Метод:** `POST`  
**Endpoint:** `/api/articles`

**Предусловие:** Authorization отсутствует.

**Ожидаемый результат:** `401 Unauthorized`; статья не создаётся.

---

## TC-009 — Получение несуществующей статьи

**Метод:** `GET`  
**Endpoint:** `/api/articles/non-existing-article`

**Ожидаемый результат:** `404 Not Found`; статья не возвращается.

---

## TC-010 — Создание статьи с некорректными данными

**Метод:** `POST`  
**Endpoint:** `/api/articles`

**Предусловие:** пользователь авторизован.

**Body:**
```json
{"article":{"title":"","description":"","body":""}}
```

**Ожидаемый результат:** статья не создаётся; API возвращает ошибку валидации (например, `422 Unprocessable Entity`) и описание ошибки.

---

# ✅ Примеры Postman Tests

```javascript
pm.test("Status code is 200", function () {
    pm.response.to.have.status(200);
});
```

```javascript
pm.test("Article exists in response", function () {
    const jsonData = pm.response.json();
    pm.expect(jsonData.article).to.exist;
});
```

```javascript
const jsonData = pm.response.json();
pm.environment.set("slug", jsonData.article.slug);
```

```javascript
pm.test("Article updated", function () {
    const jsonData = pm.response.json();
    pm.expect(jsonData.article.title).to.eql("QA Article Updated");
});
```

---

# 📊 Покрытые HTTP-статусы

| Status | Проверка |
|---|---|
| `200 OK` | Login, GET, UPDATE |
| `201 Created` | Создание статьи |
| `401 Unauthorized` | Запрос без авторизации |
| `404 Not Found` | Несуществующая или удалённая статья |
| `422 Unprocessable Entity` | Ошибка валидации данных |

---

# 🎯 Что демонстрирует раздел

- тестирование REST API и CRUD;
- проверку HTTP Status Codes и JSON;
- тестирование авторизации и Bearer Token;
- использование Environment Variables;
- позитивные и негативные сценарии;
- Postman Tests;
- автоматическое сохранение данных из Response.
