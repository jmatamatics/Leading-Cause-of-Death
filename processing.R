library(dplyr)

#death <- read.csv("~/Downloads/shiny/New_York_City_Leading_Causes_of_Death.csv", stringsAsFactors = FALSE)
death <- read.csv("/Users/josephmata/Documents/NYCDSA/Projects/leadingdeath/preprocessing/death.csv", stringsAsFactors = FALSE)

death <- death %>% filter(!Race.Ethnicity %in% c("Other Race/ Ethnicity", "Not Stated/Unknown"))
death$Deaths <- as.numeric(death$Deaths)
death$Death.Rate <- as.numeric(death$Death.Rate)
death$Age.Adjusted.Death.Rate <- as.numeric(death$Age.Adjusted.Death.Rate)
death <- death %>% mutate(Race.Ethnicity = ifelse(Race.Ethnicity == "White Non-Hispanic", "White", Race.Ethnicity),
                          Race.Ethnicity = ifelse(Race.Ethnicity == "Black Non-Hispanic", "Black", Race.Ethnicity),
                          Race.Ethnicity = ifelse(Race.Ethnicity == "Asian and Pacific Islander", "Asian", Race.Ethnicity),
                          Sex = ifelse(Sex == "M", "Male", Sex),
                          Sex = ifelse(Sex == "F", "Female", Sex))



death <- death %>% mutate(Leading.Cause = ifelse(Leading.Cause == "Cerebrovascular Disease (Stroke: I60-I69)", "Cerebrovascular Disease (Stroke)", Leading.Cause),
        Leading.Cause = ifelse(Leading.Cause == "Malignant Neoplasms (Cancer: C00-C97)", "Malignant Neoplasms (Cancer)", Leading.Cause),
        Leading.Cause = ifelse(Leading.Cause == "Chronic Lower Respiratory Diseases (J40-J47)", "Chronic Lower Respiratory Diseases", Leading.Cause),
        Leading.Cause = ifelse(Leading.Cause == "Essential Hypertension and Renal Diseases (I10, I12)", "Essential Hypertension and Renal Diseases", Leading.Cause),
        Leading.Cause = ifelse(Leading.Cause == "Diseases of Heart (I00-I09, I11, I13, I20-I51)", "Diseases of Heart", Leading.Cause),
        Leading.Cause = ifelse(Leading.Cause == "Diabetes Mellitus (E10-E14)", "Diabetes Mellitus", Leading.Cause),
        Leading.Cause = ifelse(Leading.Cause == "Accidents Except Drug Posioning (V01-X39, X43, X45-X59, Y85-Y86)", "Accidents Except Drug Posioning", Leading.Cause),
        Leading.Cause = ifelse(Leading.Cause == "Mental and Behavioral Disorders due to Accidental Poisoning and Other Psychoactive Substance Use", 
                               "Accidental Poisoning/Psychoactive Substance", Leading.Cause),
        Leading.Cause = ifelse(Leading.Cause == "Influenza (Flu) and Pneumonia (J09-J18)", "Influenza (Flu) and Pneumonia", Leading.Cause),
        Leading.Cause = ifelse(Leading.Cause == "Septicemia (A40-A41)", "Septicemia", Leading.Cause),
        Leading.Cause = ifelse(Leading.Cause == "Assault (Homicide: Y87.1, X85-Y09)", "Assault (Homicide)", Leading.Cause),
        Leading.Cause = ifelse(Leading.Cause == "Human Immunodeficiency Virus Disease (HIV: B20-B24)", "Human Immunodeficiency Virus Disease (HIV)", Leading.Cause),
        Leading.Cause = ifelse(Leading.Cause == "Alzheimer's Disease (G30)", "Alzheimer's Disease", Leading.Cause),
        Leading.Cause = ifelse(Leading.Cause == "Certain Conditions originating in the Perinatal Period (P00-P96)", "Conditions originating in the Perinatal Period", Leading.Cause),
        Leading.Cause = ifelse(Leading.Cause == "Chronic Liver Disease and Cirrhosis (K70, K73)", "Chronic Liver Disease and Cirrhosis", Leading.Cause),
        Leading.Cause = ifelse(Leading.Cause == "Nephritis, Nephrotic Syndrome and Nephrisis (N00-N07, N17-N19, N25-N27)", "Nephritis, Nephrotic Syndrome and Nephrisis", Leading.Cause),
        Leading.Cause = ifelse(Leading.Cause == "Viral Hepatitis (B15-B19)", "Viral Hepatitis", Leading.Cause),
        Leading.Cause = ifelse(Leading.Cause == "Intentional Self-Harm (Suicide: X60-X84, Y87.0)", "ntentional Self-Harm (Suicide)", Leading.Cause),
        Leading.Cause = ifelse(Leading.Cause == "Congenital Malformations, Deformations, and Chromosomal Abnormalities", "Congenital Malformations/Chromosomal Abnormalities", Leading.Cause))
              

save.image("death.Rdata")

