# Description of the purpose of the Intermediate Layer

This folder contains intermediate models that transform and aggregate data from staging models to prepare it for further analysis or reporting. Below is the documentation for each model:

---

## `int_monthly_marketing_metrics.sql`

### **Description**
This model aggregates marketing event data at a monthly level for each user. It calculates the total marketing cost and the total number of marketing events per user per month.

### **Upstream Models**
- **`stg_intus_marketing_events`**: This is the source table for marketing event data. It contains details such as `event_id`, `user_id`, `event_timestamp`, and `cost`.

### **Logic**
1. Extracts the year and month from the `event_timestamp` using the `extract_year_month` macro.
2. Groups the data by `year-month` and `user_id`.
3. Calculates:
   - `total_marketing_cost`: The sum of all marketing costs for the user in the month.
   - `total_marketing_events`: The count of marketing events for the user in the month.

### **Purpose**
This model is used to analyze marketing performance at a user level on a monthly basis. It helps in understanding how much is being spent on marketing and how many events are being triggered for each user.

---

## `int_monthly_product_sales.sql`

### **Description**
This model combines sales data with product catalog data to provide monthly sales metrics at the product category level. It includes metrics such as unique customers, total revenue, and total cost.

### **Upstream Models**
- **`int_monthly_sales_metrics`**: This intermediate model provides aggregated sales data at the monthly level.
- **`stg_intus_product_catalogs`**: This staging table contains product details such as `product_id` and `category`.

### **Logic**
1. Joins `int_monthly_sales_metrics` with `stg_intus_product_catalogs` on `product_id` to enrich sales data with product category information.
2. Groups the data by `year`, `month`, and `category`.
3. Includes the following metrics:
   - `unique_customers`: The number of distinct customers who purchased products in the category.
   - `total_revenue`: The total revenue generated from the category.
   - `total_cost`: The total cost associated with the category.

### **Purpose**
This model is used to analyze sales performance at the product category level. It helps in understanding which categories are driving revenue and how many unique customers are purchasing from each category.

---

## `int_monthly_sales_metrics.sql`

### **Description**
This model aggregates sales transaction data at a monthly level for each product. It calculates metrics such as unique customers, total revenue, and total cost.

### **Upstream Models**
- **`stg_intus_sales_transactions`**: This is the source table for sales transaction data. It contains details such as `transaction_timestamp`, `product_id`, `user_id`, `revenue`, and `cost`.

### **Logic**
1. Extracts the year and month from the `transaction_timestamp` using the `extract_year_month` macro.
2. Groups the data by `year-month` and `product_id`.
3. Calculates:
   - `unique_customers`: The number of distinct customers who purchased the product.
   - `total_revenue`: The total revenue generated from the product.
   - `total_cost`: The total cost associated with the product.

### **Purpose**
This model is used to analyze sales performance at the product level. It helps in understanding which products are driving revenue and how many unique customers are purchasing each product.

---

## Summary of Dependencies

| Model Name                     | Upstream Models                              | Purpose                                                                 |
|--------------------------------|----------------------------------------------|-------------------------------------------------------------------------|
| `int_monthly_marketing_metrics`| `stg_intus_marketing_events`                 | Aggregates marketing event data at a user-month level.                  |
| `int_monthly_product_sales`    | `int_monthly_sales_metrics`, `stg_intus_product_catalogs` | Combines sales and product data to analyze sales by category.          |
| `int_monthly_sales_metrics`    | `stg_intus_sales_transactions`               | Aggregates sales transaction data at a product-month level.             |

---

This documentat provides a clear understanding of the purpose, logic, and dependencies of each intermediate model. It ensures that anyone working with these models can easily understand their role in the data pipeline. 

### | Note: 
    For more detailed explanation, you can visit the [schema.yml](intuswin_rs\models\intermediate\schema.yml) file which includes description of tables, columns and data validation logics.
