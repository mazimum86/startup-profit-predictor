# multiple_linear_regression.py

"""
🏢 Multiple Linear Regression on 50 Startups Dataset

Predict company profit based on R&D Spend, Administration, Marketing Spend, and State.
Author: Chukwuka Chijioke Jerry
"""

# ===============================
# 📦 Import Libraries
# ===============================
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import os

from sklearn.compose import ColumnTransformer
from sklearn.preprocessing import OneHotEncoder
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression

# ===============================
# 📥 Load Dataset
# ===============================
dataset = pd.read_csv('../data/50_startups.csv')
X = dataset.iloc[:, :-1].values
y = dataset.iloc[:, -1].values

# ===============================
# 🔄 Encode Categorical Data
# ===============================
ct = ColumnTransformer(
    transformers=[('encoder', OneHotEncoder(drop='first'), [3])],
    remainder='passthrough'
)
X = ct.fit_transform(X)

# ===============================
# 🔀 Split Dataset
# ===============================
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=0
)

# ===============================
# 🧠 Train the Model
# ===============================
regressor = LinearRegression()
regressor.fit(X_train, y_train)

# ===============================
# 📊 Make Predictions
# ===============================
y_pred = regressor.predict(X_test)
results = pd.DataFrame({
    'Actual Profit': y_test,
    'Predicted Profit': y_pred
})

# ===============================
# 💾 Save Outputs
# ===============================
os.makedirs('../outputs', exist_ok=True)
results.to_csv('../outputs/MLR_predicted_profits_py.csv', index=False)

# ===============================
# 📈 Visualization
# ===============================
os.makedirs('../plots', exist_ok=True)

plt.figure(figsize=(8, 5))
sns.scatterplot(x=y_test, y=y_pred)
plt.plot([min(y_test), max(y_test)], [min(y_test), max(y_test)], color='red', linestyle='--')
plt.xlabel('Actual Profit')
plt.ylabel('Predicted Profit')
plt.title('Actual vs Predicted Profit')
plt.grid(True)
plt.tight_layout()
plt.savefig('../plots/mlr_actual_vs_predicted_py.png')
plt.show()

# ===============================
# 📌 Model Coefficients
# ===============================
print("Intercept:", regressor.intercept_)
print("Coefficients:", regressor.coef_)

# ✅ Done
print("✅ Regression complete. Outputs saved in 'outputs/', plot saved in 'plots/'.")
