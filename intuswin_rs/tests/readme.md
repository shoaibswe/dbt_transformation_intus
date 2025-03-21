# Tests

This folder contains data quality tests to ensure the integrity and accuracy of the data in the models. Below is the documentation for each test:

---

## `marketing_cost_within_budget.sql`

### **Description**
This test checks whether the total marketing cost in the `int_monthly_marketing_metrics` model exceeds a specified threshold (e.g., $100,000). It helps identify months where marketing spending may be unusually high.

### **Test Logic**
1. Queries the `int_monthly_marketing_metrics` model to retrieve monthly marketing metrics.
2. Filters records where `total_marketing_cost` exceeds the threshold (currently set to $100,000).
3. If any records are returned, the test fails, indicating that marketing costs are higher than expected.

### **Threshold**
- The threshold is set to `100000` but can be adjusted based on business requirements.

### **Purpose**
This test ensures that marketing costs are within an acceptable range and helps identify potential anomalies or overspending.

---

## `revenue_greater_than_cost.sql`

### **Description**
This test checks whether the total revenue in the `int_monthly_sales_metrics` model is less than the total cost. It helps identify months where revenue is not covering costs, which could indicate profitability issues.

### **Test Logic**
1. Queries the `int_monthly_sales_metrics` model to retrieve monthly sales metrics.
2. Filters records where `total_revenue` is less than `total_cost`.
3. If any records are returned, the test fails, indicating that revenue is not covering costs.

### **Purpose**
This test ensures that revenue is consistently greater than costs, which is critical for maintaining profitability. It helps identify potential issues in pricing, cost management, or sales performance.

---

## Summary of Tests

| Test Name                     | Model Tested                     | Purpose                                                                 |
|-------------------------------|----------------------------------|-------------------------------------------------------------------------|
| `marketing_cost_within_budget` | `int_monthly_marketing_metrics`  | Ensures marketing costs are within an acceptable budget.                |
| `revenue_greater_than_cost`   | `int_monthly_sales_metrics`      | Ensures revenue is greater than costs to maintain profitability.        |

---
