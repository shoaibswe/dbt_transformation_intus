# Staging Layer

This folder contains staging models that extract and transform raw data from source tables into a clean and consistent format for downstream use. Below is the documentation for each model:

---

## `stg_intus_marketing_events.sql`

### **Description**
This model extracts marketing event data from the `marketing_events` source table. It cleans and structures the data for use in downstream models.

### **Source Table**
- **`intus.marketing_events`**: The raw table containing marketing event data.

### **Columns**
- `event_id`: The unique identifier for the marketing event.
- `user_id`: The unique identifier for the user associated with the event.
- `event_type`: The type of marketing event (e.g., click, impression, conversion).
- `event_timestamp`: The timestamp when the event occurred.
- `channel`: The marketing channel associated with the event (e.g., email, social media).
- `campaign`: The marketing campaign associated with the event.
- `cost`: The cost associated with the marketing event.

### **Tests**
- `event_id`: Tested for uniqueness and non-null values.
- `user_id`: Tested for non-null values.
- `event_type`: Tested for non-null values.
- `event_timestamp`: Tested for non-null values.
- `channel`: Tested for non-null values.
- `campaign`: Tested for non-null values.
- `cost`: Tested for non-null values.

### **Purpose**
This model provides structured marketing event data for use in intermediate and mart models.

---

## `stg_intus_product_catalogs.sql`

### **Description**
This model extracts product catalog data from the `product_catalog` source table. It cleans and structures the data for use in downstream models.

### **Source Table**
- **`intus.product_catalog`**: The raw table containing product catalog data.

### **Columns**
- `product_id`: The unique identifier for the product.
- `product_name`: The name of the product.
- `category`: The category of the product.

### **Tests**
- `product_id`: Tested for uniqueness and non-null values.
- `product_name`: Tested for non-null values.
- `category`: Tested for non-null values.

### **Purpose**
This model provides structured product catalog data for use in intermediate and mart models.

---

## `stg_intus_sales_transactions.sql`

### **Description**
This model incrementally loads sales transaction data from the `sales_transactions` source table. It structures the data for use in downstream models.

### **Source Table**
- **`intus.sales_transactions`**: The raw table containing sales transaction data.

### **Configuration**
- **Materialization**: Incremental (for better performance).
- **Unique Key**: `transaction_id`.
- **Incremental Strategy**: `insert_overwrite`.

### **Columns**
- `transaction_id`: The unique identifier for the sales transaction.
- `product_id`: The unique identifier for the product associated with the transaction.
- `user_id`: The unique identifier for the user associated with the transaction.
- `transaction_timestamp`: The timestamp when the transaction occurred.
- `revenue`: The revenue generated from the transaction.
- `cost`: The cost associated with the transaction.

### **Tests**
- `transaction_id`: Tested for uniqueness and non-null values.
- `product_id`: Tested for non-null values.
- `user_id`: Tested for non-null values.
- `transaction_timestamp`: Tested for non-null values.
- `revenue`: Tested for non-null values.
- `cost`: Tested for non-null values.

### **Purpose**
This model provides clean and structured sales transaction data for use in intermediate and mart models. It is incrementally loaded to improve performance.

---

## Summary of Dependencies

| Model Name                     | Source Table                | Purpose                                                                 |
|--------------------------------|-----------------------------|-------------------------------------------------------------------------|
| `stg_intus_marketing_events`   | `intus.marketing_events`    | Extracts raw data of marketing event data.                              |
| `stg_intus_product_catalogs`   | `intus.product_catalog`     | Extracts  raw data of product catalog data.                              |
| `stg_intus_sales_transactions` | `intus.sales_transactions`  | Incrementally extracts  raw data of sales transaction data.              |

---

This documentation provides a clear understanding of the purpose, structure, and dependencies of each staging model. It ensures that anyone working with these models can easily understand their role in the data pipeline.

---
### | Note: 
    For more detailed explanation, you can visit the [schema.yml](intuswin_rs\models\staging\schema.yml) file which includes description of tables, columns and data validation logics.
    For the original source you can visit [source file](intuswin_rs\models\staging\source.yml) to get a broader view of sources.
