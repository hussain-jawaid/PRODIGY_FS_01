from db_connection import get_db_cursor
from security import hash_password, verify_password
from logs.logging_setup import get_logger


logger = get_logger("auth_db", "logs/auth.log")

def register_user(username, email, password):
    try:
        with get_db_cursor(commit=True) as cursor:
            # Check if email or username already exists
            cursor.execute("SELECT * FROM Users WHERE email = %s OR username = %s", (email, username))
            existing_user = cursor.fetchone()
            if existing_user:
                if existing_user['email'] == email:
                    logger.info(f"Email '{email}' already registered")
                    return {"success": False, "message": "Email already registered", "data": None}
                if existing_user['username'] == username:
                    logger.info(f"Username '{username}' already taken")
                    return {"success": False, "message": "Username already taken", "data": None}

            # Password hashing
            hashed_password = hash_password(password)

            # Insert new user
            cursor.execute(
                "INSERT INTO Users (username, email, password_hash) VALUES (%s, %s, %s)",
                (username, email, hashed_password)
            )
            logger.info(f"User registered successfully with this email {email}")
            return {"success": True, "message": "User registered successfully", "data": None}
    except Exception as e:
        logger.info(f"Database error: {e}")
        return {"success": False, "message": "An error occurred. Please try again later.", "data": None}     


def login_user(email, password):
    try:
        with get_db_cursor() as cursor:
            # Check if user exists
            cursor.execute("SELECT user_id, username, email, password_hash FROM Users WHERE email = %s", (email,))
            user = cursor.fetchone()
            if not user:
                logger.info(f"Email {email} not found")
                return {"success": False, "message": "Email not found", "data": None}
            
            # Verify password
            if not verify_password(password, user['password_hash']):
                logger.info(f"Incorrect password enter by this email {email}")
                return {"success": False, "message": "Incorrect password", "data": None}



            # Password matches, return user data without password
            user.pop("password_hash")
            logger.info(f"User login successfuly with this email {email}")
            return {"success": True, "message": "Login successful", "data": user}
    except Exception as e:
        logger.info(f"Database error: {e}")
        return {"success": False, "message": "An error occurred. Please try again later.", "data": None}
    

if __name__ == "__main__":
   register_user("testuser", "testuser@gmail.com", "testuser123")
   login_user("testuser@gmail.com", "testuser123")