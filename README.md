# CyberSecurity MOOC Data Analytics Project

## Project Description

This project analyses learner engagement and assessment behaviour in a CyberSecurity Massive Open Online Course (MOOC).  
The analysis is conducted using R and follows the CRISP-DM (Cross-Industry Standard Process for Data Mining) framework.

The project aims to:
- Explore learner engagement across multiple course runs
- Analyse assessment activity and question attempts
- Apply structured data analytics methods
- Produce clear, reproducible statistical reports

This work is completed as part of a statistics and data analytics academic project.

---

## Directory Structure

Directory Structure
```
CyberSecurity_MOOC_Data_Analytics/
├── data/                      All raw MOOC datasets
├── munge/
│   ├── 01-A.r                 Cycle 1 data preprocessing script
│   └── 02-A.r                 Cycle 2 data preprocessing script
├── cache/                     Cleaned and processed datasets
├── reports/
│   ├── report.Rmd             Main analytical report (R Markdown)
│   └── report.pdf             Rendered report (PDF)
├── renv/                      renv environment files
├── renv.lock                  Reproducible package snapshot
├── README.md                  Project documentation
├── .gitignore
└── CyberSecurity_MOOC_Data_Analytics.Rproj

```
------------------------------------------------------------

Project Setup Instructions

1. Clone the Repository
Clone the repository from GitHub:
```git clone https://github.com/Rucyvar/CyberSecurity_MOOC_Data_Analytics.git```

2. Open the Project
Open CyberSecurity_MOOC_Data_Analytics.Rproj in RStudio.

3. Install renv (First-Time Users Only)
If renv is not already installed, install it:
```install.packages("renv")```

4. Restore the renv Environment
Restore the project-specific R package environment:
```renv::restore()```

This will install all required packages as specified in ```renv.lock```.

------------------------------------------------------------

Project Execution Instructions

Step 1: Initialise the ProjectTemplate Workflow
Load the project and run all preprocessing steps:
```
library(ProjectTemplate)
load.project()
```

This will:
- Load raw data from the ```data/``` directory
- Execute preprocessing scripts in the ```munge/``` directory
- Store cleaned datasets in the ```cache/``` directory

Step 2: Reporting
Open and knit the report file located in the ```reports/``` directory:
- ```report.Rmd```

This will generate the final PDF report.

------------------------------------------------------------

Methodology

The project follows the CRISP-DM framework:
1. Business Understanding
2. Data Understanding
3. Data Preparation
4. Analysis
5. Evaluation
6. Reporting

Cycle 1 focuses on broad engagement analysis, while Cycle 2 performs focused analytical investigations using refined datasets produced during preprocessing.

------------------------------------------------------------

Author
Rucyvar

------------------------------------------------------------

License
This project is for academic use only.
