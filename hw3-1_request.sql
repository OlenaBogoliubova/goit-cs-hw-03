; Отримати всі завдання певного користувача
SELECT * FROM tasks WHERE user_id = 1;  -- Замініть 1 на конкретний user_id

; Вибрати завдання за певним статусом
UPDATE tasks SET status_id = (SELECT id FROM status WHERE name = 'in progress') WHERE id = 1;  -- Замініть 1 на конкретний id завдання

; Оновити статус конкретного завдання
UPDATE tasks SET status_id = (SELECT id FROM status WHERE name = 'in progress') WHERE id = 1;  -- Замініть 1 на конкретний id завдання

; Отримати список користувачів, які не мають жодного завдання
SELECT * FROM users WHERE id NOT IN (SELECT user_id FROM tasks);

; Додати нове завдання для конкретного користувача
INSERT INTO tasks (title, description, status_id, user_id) VALUES ('New Task Title', 'Task Description', 1, 1);  -- Замініть 1 на статус та user_id

; Отримати всі завдання, які ще не завершено
SELECT * FROM tasks WHERE status_id != (SELECT id FROM status WHERE name = 'completed');

; Видалити конкретне завдання
DELETE FROM tasks WHERE id = 1;  -- Замініть 1 на конкретний id завдання

; Знайти користувачів з певною електронною поштою
SELECT * FROM users WHERE email LIKE '%example.com%';  -- Замініть example.com на бажаний фрагмент електронної пошти

; Оновити імя користувача
UPDATE users SET fullname = 'New Full Name' WHERE id = 1;  -- Замініть 1 на конкретний user_id

; Отримати кількість завдань для кожного статусу
SELECT status_id, COUNT(*) FROM tasks GROUP BY status_id;

; Отримати завдання, які призначені користувачам з певною доменною частиною електронної пошти
SELECT t.* FROM tasks t INNER JOIN users u ON t.user_id = u.id WHERE u.email LIKE '%@example.com';

; Отримати список завдань, що не мають опису
SELECT * FROM tasks WHERE description IS NULL OR description = '';

; Вибрати користувачів та їхні завдання, які є у статусі 'in progress'
SELECT u.*, t.* FROM users u INNER JOIN tasks t ON u.id = t.user_id INNER JOIN status s ON t.status_id = s.id WHERE s.name = 'in progress';

; Отримати користувачів та кількість їхніх завдань
SELECT u.id, u.fullname, COUNT(t.id) FROM users u LEFT JOIN tasks t ON u.id = t.user_id GROUP BY u.id;







