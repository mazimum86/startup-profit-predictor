<h1>📊 Multiple Linear Regression on 50 Startups Dataset</h1>

<p>
  A simple yet practical application of <strong>Multiple Linear Regression</strong> using Python and R to predict a startup’s profit based on its expenditures in R&D, Administration, Marketing, and the State of operation.
</p>

<hr />

<h2>📁 Dataset</h2>
<p>The dataset used in this project is <code>50_startups.csv</code>, containing:</p>
<ul>
  <li><strong>R&D Spend</strong></li>
  <li><strong>Administration</strong></li>
  <li><strong>Marketing Spend</strong></li>
  <li><strong>State</strong> (categorical)</li>
  <li><strong>Profit</strong> (target)</li>
</ul>

<hr />

<h2>💻 Languages & Libraries</h2>

<h3>🐍 Python</h3>
<ul>
  <li>pandas</li>
  <li>numpy</li>
  <li>matplotlib</li>
  <li>scikit-learn</li>
</ul>

<h3>📘 R</h3>
<ul>
  <li>caTools</li>
  <li>ggplot2</li>
</ul>

<hr />

<h2>🧠 Models</h2>
<ul>
  <li><strong>Multiple Linear Regression</strong> trained and evaluated in both Python and R.</li>
  <li>Categorical feature (<code>State</code>) is encoded appropriately.</li>
  <li><strong>Backward elimination</strong> was also performed in R to evaluate the best combination of features for prediction.</li>
</ul>

<hr />

<h2>📂 Project Structure</h2>
<pre><code>
project-root/
├── data/
│   └── 50_startups.csv
├── outputs/
│   └── MLR_predictions_python.csv
│   └── MLR_predictions_r.csv
├── plots/
│   └── regression_plot_train_r.png
│   └── regression_plot_test_r.png
├── multiple_linear_regression.py
├── multiple_linear_regression.R
├── requirements.txt
└── README.md
</code></pre>

<hr />

<h2>✅ Results Summary</h2>
<table border="1" cellpadding="6">
  <thead>
    <tr>
      <th>Model</th>
      <th>Platform</th>
      <th>Notes</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Full MLR</td>
      <td>Python</td>
      <td>All variables used</td>
    </tr>
    <tr>
      <td>Reduced MLR</td>
      <td>R</td>
      <td>Backward elimination suggests R&D Spend and Marketing Spend as key predictors</td>
    </tr>
  </tbody>
</table>

<hr />

<h2>📷 Sample Visualizations (R)</h2>
<p>Plots are generated using <code>ggplot2</code>:</p>
<ul>
  <li>📈 <strong>Training Set</strong></li>
  <li>📉 <strong>Test Set</strong></li>
</ul>
<p>Saved under <code>plots/</code> folder.</p>

<hr />

<h2>📌 How to Run</h2>

<h3>In Python:</h3>
<pre><code>pip install -r requirements.txt
python multiple_linear_regression.py
</code></pre>

<h3>In R:</h3>
<pre><code>source("multiple_linear_regression.R")
</code></pre>

<hr />

<h2>🔗 Connect</h2>
<p><strong>Author</strong>: Chukwuka Chijioke Jerry</p>
<ul>
  <li>📧 Email: <a href="mailto:chukwuka.jerry@gmail.com">chukwuka.jerry@gmail.com</a> | <a href="mailto:chukwuka_jerry@yahoo.com">chukwuka_jerry@yahoo.com</a></li>
  <li>📱 WhatsApp: +2348038782912</li>
  <li>🔗 <a href="https://www.linkedin.com/in/chukwukacj/">LinkedIn</a> | <a href="https://x.com/Mazimum_">X (formerly Twitter)</a></li>
</ul>

<hr />

<h2>⭐ Repo Info</h2>
<p>
  This repository demonstrates model training, evaluation, prediction, backward feature elimination, and visualization for linear regression in both <strong>Python and R</strong>.
</p>
<p>Feel free to ⭐️ the repo if you find it useful and fork to modify!</p>

</body>
</html>
