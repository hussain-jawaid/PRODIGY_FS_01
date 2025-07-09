from fastapi import APIRouter, HTTPException, status, Depends
from pydantic import BaseModel
from auth_db import register_user, login_user
from jwt_utils import create_access_token, verify_token


router = APIRouter()


class SignupUser(BaseModel):
    username: str
    email: str
    password: str


class LoginUser(BaseModel):
    email: str
    password: str


@router.post("/signup", status_code=status.HTTP_201_CREATED)
def signup(data: SignupUser):
    response = register_user(data.username, data.email, data.password)
    if not response["success"]:
        raise HTTPException(status_code=400, detail=response["message"])
    return response


@router.post("/login")
def login(data: LoginUser):
    response = login_user(data.email, data.password)
    if not response["success"]:
        raise HTTPException(status_code=400, detail=response["message"])
    
    token = create_access_token(response["data"])
    return {
        "message": "Login successful",
        "access_token": token,
        "user": response["data"]    
    }


@router.get("/me")
def get_current_user(verification: dict = Depends(verify_token)):
    if not verification["success"]:
        raise HTTPException(status_code=401, detail=verification["message"])

    payload = verification["payload"]
    payload.pop("exp")
    return payload