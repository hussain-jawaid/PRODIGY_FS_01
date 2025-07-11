from fastapi import FastAPI
from routes import auth_routes
from fastapi.middleware.cors import CORSMiddleware


app = FastAPI()


origins = ["http://localhost:5173"]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


app.include_router(auth_routes.router, prefix="/auth", tags=["Auth"])


@app.get("/")
def root():
    return {"message": "Backend is running..."}