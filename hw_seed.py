from faker import Faker
import psycopg2
from psycopg2 import DatabaseError
import random
import logging


fake = Faker()

# Встановлення з'єднання з базою даних
conn = psycopg2.connect(host="localhost", database="postgres",
                        user="postgres", password="567234")
cur = conn.cursor()

# Генерація даних для 'users'
for _ in range(10):  # Генерація 10 користувачів
    cur.execute("INSERT INTO users (fullname, email) VALUES (%s, %s)",
                (fake.name(), fake.email()))

# Генерація даних для 'tasks'
status_ids = [1, 2, 3]  # Припустимо, що у нас є 3 статуси
cur.execute("SELECT id FROM users")
user_ids = [id[0] for id in cur.fetchall()]

for _ in range(20):  # Генерація 20 завдань
    title = fake.sentence()
    description = fake.text()
    status_id = random.choice(status_ids)
    user_id = random.choice(user_ids)
    cur.execute("INSERT INTO tasks (title, description, status_id, user_id) VALUES (%s, %s, %s, %s)",
                (title, description, status_id, user_id))

try:
    conn.commit()
except DatabaseError as e:
    logging.error(e)
    conn.rollback()
finally:
    cur.close()
    conn.close()
