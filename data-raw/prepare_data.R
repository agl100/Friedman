# Load library
library(MASS)

# Load dataset
bw <- MASS::birthwt

# Make column names lowercase (cleaner)
names(bw) <- tolower(names(bw))

# Convert binary variables to Yes/No factors
bw$low   <- factor(bw$low,   levels = c(0, 1), labels = c("No", "Yes"))
bw$smoke <- factor(bw$smoke, levels = c(0, 1), labels = c("No", "Yes"))
bw$ht    <- factor(bw$ht,    levels = c(0, 1), labels = c("No", "Yes"))
bw$ui    <- factor(bw$ui,    levels = c(0, 1), labels = c("No", "Yes"))

# Save cleaned dataset into the package
birthwt_clean <- bw

# Write dataset into /data folder
usethis::use_data(birthwt_clean, overwrite = TRUE)
