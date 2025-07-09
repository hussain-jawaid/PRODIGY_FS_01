import mysql.connector
from contextlib import contextmanager


@contextmanager
def get_db_cursor(commit=False):
    connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="root",
        database="users_auth_sys"
    )

    try:
        cursor = connection.cursor(dictionary=True)
        yield cursor
        if commit:
            connection.commit()
    except Exception as e:
        print(f"An error occured during db connection {e}")
        raise
    finally:
        cursor.close()
        connection.close()