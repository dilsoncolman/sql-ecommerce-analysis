"""
E-commerce data analysis script

This script replicates key business insights:
- Monthly revenue
- Revenue calculation
"""

# Monthly revenue calculation example

import pandas as pd

df = pd.read_csv("online_rental.csv")

df["InvoiceDate"] = pd.to_datetime(df["InvoiceDate"])
df["Revenue"] = df["Quantity"] * df["UnitPrice"]

monthly = df.groupby(df["InvoiceDate"].dt.to_period("M"))["Revenue"].sum()

print(monthly.head())