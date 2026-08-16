# 🐞 Bug Reports — Hitch Web

В разделе представлены примеры дефектов, обнаруженных в ходе ручного тестирования веб-приложения **Hitch**.

Баг-репорты содержат описание проблемы, окружение, предусловия, шаги воспроизведения, фактический и ожидаемый результаты. Для части дефектов представлены скриншоты и видеозаписи воспроизведения.

## 📋 Баг-репорты

| ID | YouGile ID | Дефект | Приоритет | Статус |
|---|---|---|---|---|
| [BUG-001](BUG-001-Phone-Validation.md) | ETA-11 | Некорректная валидация поля «Телефон» | High / Высокий | Closed / Закрыт |
| [BUG-002](BUG-002-Registration-Button-Zoom.md) | ETA-16 | Изменение кнопки «Зарегистрироваться» при масштабировании страницы | Medium / Средний | Reopened / Переоткрыт |
| [BUG-003](BUG-003-New-Request-Navigation.md) | ETA-61 | Неверная навигация при нажатии кнопки «Новая заявка» | High / Высокий | Cannot Reproduce / Не воспроизводится |
| [BUG-004](BUG-004-Company-Profile-Changes-Not-Saved.md) | ETA-66 | Не сохраняются изменения в анкете компании после обновления страницы | High / Высокий | Reopened / Переоткрыт |
| [BUG-005](BUG-005-Telegram-Validation.md) | ETA-43 | Ошибка валидации корректного значения в поле «Telegram» | Medium / Средний | Closed / Закрыт |
| [BUG-006](BUG-006-Send-Request-Button-Not-Clickable.md) | ETA-70 | Некликабельна кнопка «Отправить заявку» | High / Высокий | Closed / Закрыт |
| [BUG-007](BUG-007-New-Request-Dropdown.md) | ETA-71 | Не раскрывается выпадающий список в форме «Новая заявка» | Medium / Средний | Reopened / Переоткрыт |
| [BUG-008](BUG-008-Decline-Button-Not-Clickable.md) | ETA-72 | Некликабельна кнопка «Отказаться» в форме «Предложение» | High / Высокий | Closed / Закрыт |
| [BUG-009](BUG-009-Salary-Field-Validation.md) | ETA-73 | Не появляется сообщение об ошибке при вводе нецифровых символов в поле «Предлагаемая зарплата» | High / Высокий | Closed / Закрыт |
| [BUG-010](BUG-010-Contacts-Link-Navigation.md) | ETA-95 | Открывается главная страница при переходе по ссылке в блоке «Контакты» | High / Высокий | Open / Открыт |

## 🔍 Представленные типы дефектов

В подборке представлены:

- функциональные дефекты;
- ошибки валидации;
- ошибки навигации;
- UI-проблемы;
- проблемы сохранения данных;
- некорректная работа интерактивных элементов;
- проблемы адаптивного отображения.

## 🧪 Виды проверок

При обнаружении дефектов применялись:

- функциональное тестирование;
- UI-тестирование;
- позитивное тестирование;
- негативное тестирование;
- тестирование форм;
- проверка валидации;
- проверка навигации;
- тестирование адаптивности.

## 🌐 Окружение

Тестирование выполнялось в различных окружениях:

- Web;
- Google Chrome;
- Yandex Browser;
- мобильные устройства;
- Chrome DevTools Device Toolbar.

## 📎 Доказательства дефектов

Для подтверждения обнаруженных дефектов используются:

- [📸 Screenshots](Screenshots/) — скриншоты фактических и ожидаемых результатов;
- [🎥 Videos](Videos/) — видеозаписи воспроизведения дефектов.

## 🛠 Инструменты

- YouGile
- Google Chrome
- Chrome DevTools
- Yandex Browser
- GitHub

## 📁 Структура раздела

```text
Bug-Reports/
│
├── README.md
│
├── BUG-001-Phone-Validation.md
├── BUG-002-Registration-Button-Zoom.md
├── BUG-003-New-Request-Navigation.md
├── BUG-004-Company-Profile-Changes-Not-Saved.md
├── BUG-005-Telegram-Validation.md
├── BUG-006-Send-Request-Button-Not-Clickable.md
├── BUG-007-New-Request-Dropdown.md
├── BUG-008-Decline-Button-Not-Clickable.md
├── BUG-009-Salary-Field-Validation.md
├── BUG-010-Contacts-Link-Navigation.md
│
├── Screenshots/
│   └── README.md
│
└── Videos/
    └── README.md
