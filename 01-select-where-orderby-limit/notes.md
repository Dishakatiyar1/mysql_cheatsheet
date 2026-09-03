# SELECT, WHERE, ORDER BY, LIMIT

## Mindset

- Don't memorize syntax.
- Understand what each keyword is actually deciding.
- Syntax can be looked up. Logic can't.

---

# SELECT

```sql
SELECT name, salary
FROM Employee;
```

Think:

- SELECT → which columns do I want back?
- It does NOT filter rows. That's WHERE's job.

`SELECT *` → all columns.
`SELECT name` → only that column.

---

# WHERE

Filters rows.

```sql
SELECT *
FROM Employee
WHERE department = 'Sales';
```

Think:

```
if(condition) → keep the row
else          → drop the row
```

## Combining conditions

```sql
WHERE department = 'Sales' AND salary > 40000
```

❌ Mistake: mixing AND/OR without parentheses

```sql
WHERE department = 'Sales' OR department = 'Marketing' AND salary > 40000
```

This does NOT mean "(Sales OR Marketing) AND salary > 40000".
SQL reads AND before OR, so it actually means:

```
Sales
   OR
(Marketing AND salary > 40000)
```

Any Sales row gets in regardless of salary — probably not what you wanted.

✅ Fix: always add parentheses when mixing AND/OR

```sql
WHERE (department = 'Sales' OR department = 'Marketing')
  AND salary > 40000
```

---

# LIKE (pattern matching)

```sql
WHERE name LIKE 'A%'
```

Think:

- `%` → any number of characters (including zero)
- `_` → exactly one character

`'A%'` → starts with A
`'%a'` → ends with a
`'%an%'` → contains "an" anywhere

❌ Mistake: forgetting LIKE needs quotes around the pattern, and no `%` means exact match only.

```sql
WHERE name LIKE 'A'   -- only matches name = 'A', not names starting with A
```

---

# ORDER BY

Sorts the result. Doesn't remove or add rows.

```sql
ORDER BY salary ASC   -- smallest first (default)
ORDER BY salary DESC  -- largest first
```

---

# LIMIT

Returns first N rows — but only AFTER sorting happens.

```sql
ORDER BY salary DESC
LIMIT 3;
```

❌ Mistake: using LIMIT without ORDER BY

```sql
SELECT * FROM Employee LIMIT 3;
```

This gives "some 3 rows," not "the 3 highest/lowest anything." Without ORDER BY, there's no guaranteed order to begin with.

❌ Mistake: ties at the cutoff

```sql
ORDER BY salary DESC
LIMIT 1;
```

If two employees are tied for the highest salary, this only returns ONE of them — SQL picks arbitrarily.

✅ Fix: add a tiebreaker column

```sql
ORDER BY salary DESC, id ASC
LIMIT 1;
```

✅ If you actually need ALL employees tied for the max (not just one), don't use LIMIT at all — use WHERE with a subquery instead:

```sql
WHERE salary = (SELECT MAX(salary) FROM Employee)
```

---

# Order these actually run in (mentally)

```
FROM
WHERE
ORDER BY
LIMIT
SELECT   ← written first, but conceptually decides output columns only
```

Don't blindly memorize — just remember WHERE happens before you ever see sorted/limited results.

---

# Interview Patterns (for this topic)

- "Find rows matching a condition" → WHERE
- "Top N by some value" → ORDER BY + LIMIT
- "Top N but there might be ties" → ORDER BY with a tiebreaker column, OR drop LIMIT and use WHERE = subquery
- "Search by partial text" → LIKE with %

## My Rule

When stuck on a basic query, ask:

1. Which table?
2. Which rows do I keep? (WHERE)
3. Do I need a specific order? (ORDER BY)
4. Do I only want some of them? (LIMIT)
5. Which columns do I actually return? (SELECT)
