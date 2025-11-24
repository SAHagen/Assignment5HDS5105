library(shiny)
library(bslib)
library(ggplot2)
library(plotly)
library(tidyr)
library(dplyr)
library(shinythemes)


#loading and re-coding the data
dig.df <- read.csv("DIG.csv")

data <- dig.df %>%
  select(
    patient_id = ID,
    treatment_group = TRTMT,
    age = AGE,
    sex = SEX,
    bmi = BMI,
    potassium_level = KLEVEL,
    creatinine_level = CREAT,
    bp_diastolic = DIABP,
    bp_systolic = SYSBP,
    hypertension_hist = HYPERTEN,
    cvd = CVD,
    worsening_heart_failure = WHF,
    used_digoxin = DIG,
    hospitalized = HOSP,
    hospdays = HOSPDAYS,
    death_status = DEATH,
    day_of_death = DEATHDAY
  ) %>%
  mutate( 
    patient_id = as.character(patient_id),
    treatment_group = recode_factor(treatment_group, '0'="Placebo", '1'="Treatment"),
    sex = recode_factor(sex, '1'="M", '2'="F"),
    hypertension_hist = recode_factor(hypertension_hist, '1'  = "Yes", '0'= "No"),
    cvd = recode_factor(cvd, '1'="CVD Event", '0'="No CVD Event"),
    worsening_heart_failure = recode_factor(worsening_heart_failure, '1'="Yes", '0'="No"),
    used_digoxin = recode_factor(used_digoxin, '1'= "Yes", '0'="No"),
    hospitalized = recode_factor(hospitalized, '1'="Hospitalization", 
                                 '0'="No Hospitalization"),
    death_status = recode_factor(death_status, '0'="Alive", '1'="Death")
  )
