--Тест считается проваленным, если запрос возвращает хотя бы одну строку с ошибками.
SELECT 1
FROM {{source('seed__smartfones', 'smartphones')}}
WHERE internal_memory % 4 != 0