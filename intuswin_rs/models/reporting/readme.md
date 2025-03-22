# `fct_monthly_sales_marketing_report.sql`

This is a **mart-level model** that combines monthly sales and marketing data to create a comprehensive report. It provides insights into sales performance, marketing costs, and the relationship between revenue and costs.

---

## **Description**
This model aggregates and combines data from three intermediate models (`int_monthly_sales_metrics`, `int_monthly_product_sales`, and `int_monthly_marketing_metrics`) to generate a monthly report. It includes key metrics such as revenue, costs, marketing spend, and a revenue-to-cost ratio.

---

## **Upstream Models**
- **`int_monthly_sales_metrics`**: Provides aggregated sales data at a monthly level for each product.
- **`int_monthly_product_sales`**: Combines sales data with product catalog data for category-level insights.
- **`int_monthly_marketing_metrics`**: Provides aggregated marketing metrics, including costs and events.

---

## **Columns**
| Column Name               | Description                                                                 |
|---------------------------|-----------------------------------------------------------------------------|
| `transaction_year`        | The year of the sales transaction.                                          |
| `transaction_month`       | The month of the sales transaction.                                         |
| `category`                | The product category associated with the sales.                             |
| `unique_customers`        | The number of unique customers who made purchases in the category.          |
| `total_revenue`           | The total revenue generated from sales in the category.                     |
| `total_cost`              | The total cost associated with sales in the category.                       |
| `total_marketing_cost`    | The total marketing cost for the month (defaults to 0 if no data exists).   |
| `total_marketing_events`  | The total number of marketing events for the month (defaults to 0 if no data exists). |
| `revenue_to_cost_ratio`   | The ratio of total revenue to total cost, calculated using the `calculate_ratio` macro. |

---

## **Logic**
1. **Data Sources**:
   - Combines data from three intermediate models:
     - `int_monthly_sales_metrics`: Provides sales data at the product level.
     - `int_monthly_product_sales`: Combines sales data with product categories.
     - `int_monthly_marketing_metrics`: Provides marketing data at the monthly level.
2. **Joins**:
   - Joins `monthly_sales` with `monthly_product_sales` on `transaction_year` and `transaction_month`.
   - Joins the result with `monthly_marketing` on `transaction_year` and `transaction_month`.
3. **Calculations**:
   - Uses the `calculate_ratio` macro to calculate the `revenue_to_cost_ratio`.
4. **Ordering**:
   - Orders the results by `transaction_year`, `transaction_month`, and `category` for better readability.

---

### **Purpose**
- This model is designed to provide a comprehensive view of sales and marketing performance at a monthly level. It helps answer questions such as:

- How does revenue compare to costs for each product category?

- What is the relationship between marketing spend and sales performance?

- Which categories are driving the most revenue?

### **Usage**
- This model can be used for:

- Monthly performance reporting.

- Analyzing the effectiveness of marketing campaigns.

- Identifying trends in sales and marketing data.

