#!/usr/bin/env python3
import redis
import uuid
from typing import Union


class Cache:
    """Represents an object for storing data in redis
    """

    def __init__(self) -> None:
        """initializes a cache instance
        """
        self._redis = redis.Redis()
        self._redis.flushdb(True)

    def store(self, data: Union[str, bytes, int, float]) -> str:
        """Stores data in redis and returns a key
        """
        key: str = str(uuid.uuid4())
        self._redis.set(key, data)
        return key

     def get(self , key:str, fn: callable(None)) -> Union[str, bytes, int, float]:
        """Retrieves a value from a redis data storage"""
        data = self._redis.get(key)
        return  fn(data) if fn is not None else data

