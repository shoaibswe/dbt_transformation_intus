# dbt Project Documentation

This is the root `README.md` for the dbt project. It provides an overview of the project structure, key components, and how to use the project effectively.

---

## Project Overview

This dbt project is designed to perform
***Aggregate marketing and sales data to generate key performance metrics** for <i>`IntusWindows`</i> and
transform raw data into clean, structured, and analytics-ready datasets. It includes staging, intermediate, and reporting/mart layers, along with reusable macros and tests to ensure data quality and consistency.

---

### Key Features of This readme:
1. **Project Overview**: Provides a high-level description of this project.
2. **Project Structure**: Explains the organization of folders and files.
3. **Key Components**: Links to detailed documentation for each layer (staging, intermediate, macros, tests).
4. **How to Use**: Provides instructions for setting up, running, and testing the project.
5. **References**: Links to specific `README.md` files for detailed documentation.
6. **Contributing and License**: Includes guidelines for contributing and licensing information.

---- 
<i>This file will serve as the central documentation for the dbt ttransformation project and will help users navigate and understand the project effectively for the Redshift migration. Let [us](https://www.linkedin.com/in/shoaibswe/) know if you need further adjustments! <i>
---

## Project Structure

The project is organized into the following folders:

1. **`models/`**: Contains the dbt models organized into layers:
   - **`staging/`**: Raw data is extracted and lightly transformed.
   - **`intermediate/`**: Data is aggregated and joined for further analysis.
   - **`reporting/`**: Final datasets for reporting and analytics.

2. **`macros/`**: Contains reusable SQL macros to simplify complex logic and enforce consistency across the project.

3. **`tests/`**: Contains data quality tests to ensure the integrity of the data.

4. **`sources/`**: Defines the source tables and their configurations.

5. **`schema.yml`**: Contains documentation and tests for models.

---

## Key Components

### 1. **Staging Layer**
The staging layer extracts raw data from source tables and performs light transformations. Key models include:
- `stg_intus_marketing_events.sql`
- `stg_intus_product_catalogs.sql`
- `stg_intus_sales_transactions.sql`

Refer to the [`staging/README.md`](models/staging/README.md) for detailed documentation.

### 2. **Intermediate Layer**
The intermediate layer aggregates and joins data from the staging layer for further analysis. Key models include:
- `int_monthly_marketing_metrics.sql`
- `int_monthly_product_sales.sql`
- `int_monthly_sales_metrics.sql`

Refer to the [`intermediate/README.md`](models/intermediate/README.md) for detailed documentation.

### 3. **Macros**
Reusable SQL macros are stored in the `macros/` folder. These simplify complex logic and ensure consistency across the project. Key macros include:
- `calculate_ratio.sql`
- `extract_year_month.sql`
- `test_date_consistency.sql`
- `test_positive_values.sql`
- `validate_data.sql`
- `generate_database_name.sql`
- `generate_schema_name.sql`
- `macro_handle_nulls.sql`

Refer to the [`macros/README.md`](macros/README.md) for detailed documentation.

### 4. **Tests**
Data quality tests are stored in the `tests/` folder. These ensure the integrity and accuracy of the data.
Key tests include:
- `marketing_cost_within_budget.sql`
- `revenue_greater_than_cost.sql`

Refer to the [`tests/README.md`](tests/README.md) for detailed documentation.


### 5. **Reporting**
The reporting layer (mart layer) is where the final datasets are prepared for analytics and reporting.
Refer to the [`reporting/README.md`](models\reporting\readme.md) for detailed documentation.

---

## How to Use This Project

### 1. **Set Up the Project**
- Clone the repository.
- Create a python virtual env.  `python3 -m venv dbt-venv`
Remember- install python3.10 or higher.
- Install dbt and required dependencies. You can use requirements file. `pip install -r requirements.txt`
- for initial setup, run `source setup.sh` which is located in root directory of this project.
- Configure your `profiles.yml` to connect to your data warehouse.

### 2. **Run the Project**
- Use the following commands to run the project:
  ```bash
  dbt run

####  To run specific models:
```
dbt run --models staging
dbt run --models intermediate
dbt run --models reporting
```

### 3. **Test the Data**
- Run data quality tests using:
```
dbt test
```

### **4. Generate Documentation**
- Generate and view project documentation using:
```
dbt docs generate
dbt docs serve
```

### **References**
##### Macros: 
- Refer to the `macros/README.md` for details on reusable SQL macros.

##### Staging Layer:
- Refer to the `staging/README.md` for details on staging models.

##### Intermediate Layer: 
- Refer to the `intermediate/README.md` for details on intermediate models.

##### Tests:
- Refer to the `tests/README.md` for details on data quality tests.


### **Contributing tot he Repo**
- Contributions to this project are welcome! Please follow these steps:

    - Fork the repository.

    - Create a new branch for your feature or bugfix.

    -  Submit a pull request with a detailed description of your changes.


#### License
- This project is licensed under the MIT [License](https://opensource.org/license/mit). See the LICENSE file for details.

| Note:
-   Please always create a branch and work there and create a PR to merge.
- Cheers! 🥂

---

### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
