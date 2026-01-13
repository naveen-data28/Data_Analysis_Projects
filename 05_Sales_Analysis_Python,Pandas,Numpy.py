import pandas as pd
import numpy as np

data = {
    "Order_ID": [101, 102, 103, 104, 105, 106, 107, 108],
    "Customer": ["A", "B", "C", "D", "A", "B", "C", "D"],
    "Region": ["South", "North", "East", "West", "South", "North", "East", "West"],
    "Department": ["Electronics", "Clothing", "Electronics", "Furniture",
                   "Furniture", "Clothing", "Electronics", "Furniture"],
    "Price": [20000, 1500, 22000, 30000, 28000, 1800, 25000, 32000],
    "Status": ["Completed", "Completed", "Active", "Completed",
               "Active", "Completed", "Completed", "Active"]
}

df = pd.DataFrame(data)
print(df)


# Fliter only Completed sales (Pandas)

completed_df = df[df["Status"] == "Completed"]
print("\n--- COMPLETED SALES ---")
print(completed_df)


# Total revenue (Numpy)

total_revenue = np.sum(completed_df["Price"].values)
print("\nTotal Revenue:", total_revenue)


# Average order value (Numpy)

avg_order_value = np.mean(completed_df["Price"].values)
print("Average order value:", avg_order_value)


# Highest & Lowest sale (Numpy)

max_sale = np.max(completed_df["Price"].values)

min_sale = np.min(completed_df["Price"].values)

print("Highest sale:", max_sale)

print("Lowest sale:", min_sale)


# Revenue by Region (Pandas)

region_sales = completed_df.groupby("Region")["Price"].sum()
print("\n --- REVENUE BY REGION ---")
print(region_sales)


# Average sales by Department (Pandas)

avg_sales = completed_df.groupby("Department")["Price"].mean()
print("\n --- AVERAGE SALES BY DEPARTMENT ---")
print(avg_sales)


# Convert Pandas - Numpy for extra analysis 

prices_np = completed_df["Price"].to_numpy()

print("\nNumPy Array:", prices_np)
print("Standard Deviation:", np.std(prices_np))





