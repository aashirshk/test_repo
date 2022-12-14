from pydantic import BaseSettings, ValidationError as PydanticValidationError


class Env(BaseSettings):

    name: str
    user: str
    password: str
    port: int
    host: str

    class Config:
        env_file = ".env"


try:
    env = Env()
    print(env.dict())
except PydanticValidationError as e:
    print(e.json())
