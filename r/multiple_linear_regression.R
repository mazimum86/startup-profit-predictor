# ==========================================================
# 🧠 Multiple Linear Regression: 50 Startups Dataset (R)
# Author: Chukwuka Chijioke Jerry
# ==========================================================

# 📦 Load Required Libraries
library(caTools)
library(ggplot2)

# 📁 1. Import Dataset
dataset <- read.csv("../data/50_startups.csv")

# 🔄 2. Encode Categorical Data
dataset$State <- factor(dataset$State,
                        levels = unique(dataset$State),
                        labels = 1:length(unique(dataset$State)))

# 🔀 3. Split Dataset into Training and Test Sets
set.seed(123)
split <- sample.split(dataset$Profit, SplitRatio = 0.8)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

# 🧠 4. Fit Multiple Linear Regression Model
model <- lm(Profit ~ ., data = training_set)
summary(model)

# 📈 5. Predict on Test Set
predictions <- predict(model, newdata = test_set)

# 💾 6. Save Predictions to CSV
output <- data.frame(
  R.D.Spend = test_set$R.D.Spend,
  ActualProfit = test_set$Profit,
  PredictedProfit = predictions
)

if (!dir.exists("../outputs")) dir.create("../outputs")
write.csv(output, "../outputs/MLR_predicted_profits_r.csv", row.names = FALSE)

# 🖼️ 7. Plot Actual vs Predicted
if (!dir.exists("../plots")) dir.create("../plots")
plot <- ggplot(output, aes(x = ActualProfit, y = PredictedProfit)) +
  geom_point(color = "blue", size = 3) +
  geom_abline(intercept = 0, slope = 1, color = "red", linetype = "dashed") +
  xlab("Actual Profit") +
  ylab("Predicted Profit") +
  ggtitle("Actual vs Predicted Profit (R)") +
  theme_minimal()

ggsave("../plots/mlr_actual_vs_predicted_r.png", plot, width = 8, height = 5)

# 🔄 8. Backward Elimination
cat("\n🔄 Backward Elimination Process:\n")

reg1 <- lm(Profit ~ R.D.Spend + Administration + Marketing.Spend + State, data = dataset)
summary(reg1)

reg2 <- lm(Profit ~ R.D.Spend + Administration + Marketing.Spend, data = dataset)
summary(reg2)

reg3 <- lm(Profit ~ R.D.Spend + Marketing.Spend, data = dataset)
summary(reg3)

reg4 <- lm(Profit ~ R.D.Spend, data = dataset)
summary(reg4)

# ✅ Conclusion
cat("\n✅ Based on adjusted R², the model with 'R.D.Spend + Marketing.Spend' performs best.\n")
