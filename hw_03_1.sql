-- Спочатку видаляємо таблиці, які мають зовнішні ключі
DROP TABLE IF EXISTS tasks;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS status;

-- Створення таблиці 'status'
CREATE TABLE status (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) UNIQUE NOT NULL
);

-- Додавання передвстановлених значень до таблиці 'status'
INSERT INTO status (name) VALUES ('new'), ('in progress'), ('completed');

-- Створення таблиці 'users'
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  fullname VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL
);

-- Створення таблиці 'tasks'
CREATE TABLE tasks (
  id SERIAL PRIMARY KEY,
  title VARCHAR(100) NOT NULL,
  description TEXT,
  status_id INTEGER,
  user_id INTEGER,
  FOREIGN KEY (status_id) REFERENCES status (id),
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

