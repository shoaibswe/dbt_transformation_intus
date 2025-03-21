# Macros Documentation

This folder contains reusable macros that simplify SQL logic, enforce consistency, and improve maintainability across your dbt project. Below is the documentation for each macro:

---

## `calculate_ratio.sql`

### Description
This macro calculates the ratio of two numeric values while handling division by zero errors.

### Parameters
- `numerator`: The numerator in the ratio calculation.
- `denominator`: The denominator in the ratio calculation.

### Logic
- If the denominator is greater than 0, it returns the ratio of the numerator to the denominator.
- If the denominator is 0 or less, it returns 0 to avoid division by zero errors.

### Usage
```sql
SELECT
    {{ calculate_ratio('total_revenue', 'total_cost') }} AS revenue_cost_ratio
FROM sales_data
```


## `extract_year_month.sql`

### Description
- This macro extracts the year and month from a timestamp column.

### Parameters
- `timestamp_column`: The timestamp column from which to extract the year and month.

### Logic
- Uses the EXTRACT function to retrieve the year and month from the timestamp.

### Usage
```sql 
SELECT
    {{ extract_year_month('transaction_timestamp') }}
FROM sales_data
```

## `test_date_consistency.sql`
### Description
This macro tests whether a date column falls within a specified range.

### Parameters
- column_name: The date column to validate.

- start_date: The start of the valid date range.

- end_date: The end of the valid date range.

### Logic
Returns rows where the date column is outside the specified range.

### Usage
```sql
{{ test_date_consistency('stg_sales', 'transaction_timestamp', '2023-01-01', '2023-12-31') }}
```


## `test_positive_values.sql` 
### Description
This macro tests whether a numeric column contains only positive values.

### Parameters
- model: The model to test.

- column_name: The numeric column to validate.

### Logic
- Returns rows where the column value is negative.

Usage
```sql
{{ test_positive_values('stg_sales', 'revenue') }}
```


## `validate_data.sql`
### Description
This macro validates that revenue is greater than cost in the int_monthly_sales_metrics model.

### Logic
- Runs a query to check if any rows in int_monthly_sales_metrics have total_revenue less than total_cost.

- Raises a compilation error if such rows are found.

### Usage
```sql 
{{ validate_data() }}
``` 

## `generate_database_name.sql`

### Description
This macro generates a database name based on the target environment and a custom database name.

### Parameters
- custom_database_name: The custom database name provided by the user.

- node: The dbt node being processed.

### Logic
- In deploy or prod environments, uses the custom_database_name if provided.

- In other environments, appends _DEV to the custom_database_name or uses the target database if no custom name is provided.

### Usage
```sql 
{{ generate_database_name('my_database', this) }}
```
However, the database is automatically generated in out project with DBT_usernames. and for production it is reporting which defined in project yml file.


## `generate_schema_name.sql` 
### Description
This macro generates a schema name based on the target environment and a custom schema name.

### Parameters
- custom_schema_name: The custom schema name provided by the user.

- node: The dbt node being processed.

### Logic
- In deploy or prod environments, uses the custom_schema_name if provided.

- In other environments, appends the target schema name to the custom_schema_name or uses the target schema if no custom name is provided.

### Usage
```sql
{{ generate_schema_name('my_schema', this) }}
``` 
However, schema names are generated with underscore after the DBT with the username as usual.



## `macro_handle_nulls.sql`
### Description
This macro replaces null values in a column with 0.

### Parameters
- column: The column to handle nulls for.

### Logic
- Uses the COALESCE function to replace null values with 0.

Usage
```sql
SELECT
    {{ coalesce_zero('revenue') }} AS revenue
FROM sales_data
```


## In a bird's eye

| Macro Name              | Purpose                                                                 |
|-------------------------|-------------------------------------------------------------------------|
| `calculate_ratio`       | Calculates the ratio of two values, handling division by zero.          |
| `extract_year_month`    | Extracts the year and month from a timestamp column.                   |
| `test_date_consistency` | Tests if a date column falls within a specified range.                 |
| `test_positive_values`  | Tests if a numeric column contains only positive values.               |
| `validate_data`         | Validates that revenue is greater than cost in a specific model.       |
| `generate_database_name`| Generates a database name based on the target environment.             |
| `generate_schema_name`  | Generates a schema name based on the target environment.               |
| `macro_handle_nulls`    | Replaces null values in a column with 0.                               |

### | Note:
#### Table Structure:

<i> The table is created using | for columns and - for the header separator.

Each row represents a macro and its purpose.

#### `Code Formatting`:

Macro names are wrapped in backticks (`) to indicate they are code or function names.

#### Alignment:

The table is aligned for readability, with columns properly spaced.
</i>

| More documentations on  macro should be added here for ease of visibility for this project.
