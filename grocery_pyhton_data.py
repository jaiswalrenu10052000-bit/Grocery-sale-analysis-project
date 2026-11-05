import pandas as pd
import mysql.connector
print("MySQL connector ready")
import mysql.connector

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="root",
    database="grocery_project"
)

print("Connection successful!")

query = "SELECT * FROM grocery_sales"

df = pd.read_sql(query, conn)

print(df.head())
print(df.shape)
# total sales
total_sales = df["Total Amount"].sum()

print("Total Sales:", total_sales)
# total quantity
total_quantity = df["Quantity"].sum()

print("Total Quantity Sold:", total_quantity)
# TOTAL DISCOUNT
total_discount = df["Discount Amount"].sum()

print("Total Discount:", total_discount)
# TOTAL FINAL AMOUNT

total_final_amount = df["Final Amount"].sum()

print("Total Final Amount:", total_final_amount)
#

df["Transaction Date"] = pd.to_datetime(df["Transaction Date"])

#MONTHELY WISE SALES
monthly_sales = df.groupby(
    df["Transaction Date"].dt.strftime("%B")
)["Final Amount"].sum()

print(monthly_sales)
# MONTHELY SALES
monthly_sales = (
    df.groupby(df["Transaction Date"].dt.to_period("M"))["Final Amount"]
      .sum()
      .reset_index()
)

print(monthly_sales)

# CHART MONTH WISE SALES

import matplotlib.pyplot as plt

monthly_sales = (
    df.groupby(df["Transaction Date"].dt.to_period("M"))["Final Amount"]
      .sum()
)

monthly_sales.plot(kind="bar")

plt.title("Monthly Sales")
plt.xlabel("Month")
plt.ylabel("Sales Amount")
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()
# STORE WISE SALES

store_sales = (
    df.groupby("Store Name")["Final Amount"]
      .sum()
      .sort_values(ascending=False)
)

print(store_sales)
# STORE WISE CHART

import matplotlib.pyplot as plt

store_sales.plot(kind="bar")

plt.title("Store-wise Sales")
plt.xlabel("Store Name")
plt.ylabel("Sales Amount")
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()
#AISLE WISE SALES
aisle_sales = (
    df.groupby("Aisle")["Final Amount"]
      .sum()
      .sort_values(ascending=False)
)

print(aisle_sales)
#AISELE WISE CHART
aisle_sales.plot(kind="bar")

plt.title("Aisle-wise Sales")
plt.xlabel("Aisle")
plt.ylabel("Sales Amount")
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()
#
#PRODUCT WISE SALES
product_sales = (
    df.groupby("Product Name")["Final Amount"]
      .sum()
      .sort_values(ascending=False)
)

print(product_sales)
# TOP 10 PRODUCT
top_10_products = product_sales.head(10)

print(top_10_products)
# TOP 10 PRODUCT CHART

top_10_products.plot(kind="bar")

plt.title("Top 10 Products by Sales")
plt.xlabel("Product Name")
plt.ylabel("Sales Amount")
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()
#PRODUCT WISE QUANTITY

product_quantity = (
    df.groupby("Product Name")["Quantity"]
      .sum()
      .sort_values(ascending=False)
)

print(product_quantity)

print(df.columns.tolist())

#TOP 10 PRODUCT WISE QUANTITY
product_quantity = (
    df.groupby("Product Name")["Quantity"]
      .sum()
      .sort_values(ascending=False)
)

top_10_quantity = product_quantity.head(10)

print(top_10_quantity)
#TOP 10 PRODUCT WISE CHART
top_10_quantity.plot(kind="bar")

plt.title("Top 10 Products by Quantity Sold")
plt.xlabel("Product Name")
plt.ylabel("Quantity Sold")
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()

#STORE WISE SALES

store_discount = (
    df.groupby("Store Name")["Discount Amount"]
      .sum()
      .sort_values(ascending=False)
)

print(store_discount)
# STORE WISE DISCOUNT CHART
store_discount.plot(kind="bar")

plt.title("Store-wise Discount")
plt.xlabel("Store Name")
plt.ylabel("Discount Amount")
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()
# CUSTOMER WISE SALES
customer_sales = (
    df.groupby("Customer ID")["Final Amount"]
      .sum()
      .sort_values(ascending=False)
)

print(customer_sales)

# TOP 10 CUSTOMERS SALES CHART
top_10_customers = customer_sales.head(10)

print(top_10_customers)

top_10_customers.plot(kind="bar")

plt.title("Top 10 Customers by Sales")
plt.xlabel("Customer ID")
plt.ylabel("Sales Amount")
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()

#AVERAGE ORDER VALUE
average_order_value = df["Final Amount"].mean()

print("Average Order Value:", average_order_value)

print(df["Final Amount"].mean())

# AVERAGE QUANTITY PER TRANSACTION
avg_quantity = df["Quantity"].mean()

print("Average Quantity per Transaction:", avg_quantity)
#AVERAGE QUANTITY
print(df["Quantity"].mean())
# OVERALL DISCOUNT RATE
discount_rate = (df["Discount Amount"].sum() / df["Total Amount"].sum()) * 100

print("Overall Discount Rate:", discount_rate, "%")

print(df["Discount Amount"].sum())

#STORE WISE AVERAGE ORDER VALUE
store_aov = (
    df.groupby("Store Name")["Final Amount"]
      .mean()
      .sort_values(ascending=False)
)

print(store_aov)

# AISELE WISE QUANTITY SOLD
aisle_quantity = (
    df.groupby("Aisle")["Quantity"]
      .sum()
      .sort_values(ascending=False)
)
# aisle wise total sales
print(aisle_quantity)

aisle_sales = df.groupby("Aisle")["Final Amount"].sum()

print(aisle_sales)

# aisle wise average order value
aisle_avg = df.groupby("Aisle")["Final Amount"].mean()

print(aisle_avg)

#store wise total sales
store_sales = df.groupby("Store Name")["Final Amount"].sum()

print(store_sales)
#store wise total sales
store_sales = df.groupby("Store Name")["Final Amount"].sum().sort_values(ascending=False)
print("Store-wise Total Sales:")
print(store_sales)


#store wise average order value
store_aov = df.groupby("Store Name")["Final Amount"].mean().sort_values(ascending=False)
print("\nStore-wise Average Order Value:")
print(store_aov)

# aisle wisw quantity sold
aisle_quantity = df.groupby("Aisle")["Quantity"].sum().sort_values(ascending=False)
print("\nAisle-wise Quantity Sold:")
print(aisle_quantity)
# product wise total sales
product_sales = df.groupby("Product Name")["Final Amount"].sum().sort_values(ascending=False).head(10)

print("\nTop 10 Products by Sales:")
print(product_sales)
# daily sales trend
daily_sales = (
    df.groupby("Transaction Date")["Final Amount"]
      .sum()
)

print(daily_sales)
# hieghest and lowest sales
print("Highest Sales Day:")
print(daily_sales.idxmax(), daily_sales.max())

print("\nLowest Sales Day:")
print(daily_sales.idxmin(), daily_sales.min())

# store wise quantity sold
store_quantity = (
    df.groupby("Store Name")["Quantity"]
      .sum()
      .sort_values(ascending=False)
)

print(store_quantity)

# customer purchase frenquency 
customer_frequency = (
    df.groupby("Customer ID")
      .size()
      .sort_values(ascending=False)
)

print(customer_frequency.head(10))

# store wise customer count

store_customers = (
    df.groupby("Store Name")["Customer ID"]
      .nunique()
      .sort_values(ascending=False)
)

print(store_customers)

# aisle wise average order value
aisle_aov = (
    df.groupby("Aisle")["Final Amount"]
      .mean()
      .sort_values(ascending=False)
)

print(aisle_aov)

#average discount per transaction

store_avg_discount = (
    df.groupby("Store Name")["Discount Amount"]
      .mean()
      .sort_values(ascending=False)
)

print(store_avg_discount)

# store wise average loyalty point

store_loyalty = (
    df.groupby("Store Name")["Loyalty Points"]
      .mean()
      .sort_values(ascending=False)
)

print(store_loyalty)
# total average unit price

product_avg_price = (
    df.groupby("Product Name")["Unit Price"]
      .mean()
      .sort_values(ascending=False)
)






# result save
with pd.ExcelWriter("grocery_analysis_results.xlsx") as writer:
    monthly_sales.to_excel(writer, sheet_name="Monthly Sales")
    store_sales.to_excel(writer, sheet_name="Store Sales")
    aisle_sales.to_excel(writer, sheet_name="Aisle Sales")
    top_10_products.to_excel(writer, sheet_name="Top Products")
    top_10_quantity.to_excel(writer, sheet_name="Top Quantity")
    store_discount.to_excel(writer, sheet_name="Store Discount")
    customer_sales.to_excel(writer, sheet_name="Customer Sales")
    top_10_customers.to_excel(writer, sheet_name="Top Customers")
    daily_sales.to_excel(writer, sheet_name="Daily Sales")
    store_quantity.to_excel(writer, sheet_name="Store Quantity")
    customer_frequency.to_excel(writer, sheet_name="Customer Frequency")
    store_customers.to_excel(writer, sheet_name="Store Customers")
    product_avg_price.head(10).to_excel(writer, sheet_name="Product Avg Price")
    aisle_aov.to_excel(writer, sheet_name="Aisle AOV")
    store_avg_discount.to_excel(writer, sheet_name="Store Avg Discount")

print("Analysis results saved successfully!")





























































































