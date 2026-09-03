# SELECT, WHERE, ORDER BY, LIMIT

## SELECT

- Picks which columns to return.
- `SELECT *` = all columns.
- `SELECT name, age` = only those columns.

## WHERE

- Filters rows before they're returned.
- Think: `if(condition)` for each row.
- Common operators: `=`, `!=`, `>`, `<`, `AND`, `OR`, `IN`, `BETWEEN`, `LIKE`

## ORDER BY

- Sorts the result.
- `ASC` = smallest → largest (default)
- `DESC` = largest → smallest

## LIMIT

- Returns only the first N rows, after sorting.
- If sorting isn't unique (ties), which row comes first can vary — add a second ORDER BY column to make it stable.

## Gotcha

- WHERE runs before SELECT logically, even though SELECT is written first.
- LIKE wildcards: `%` = any number of characters, `_` = exactly one character.
