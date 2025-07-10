# Course: **R for Excel Users**

R for Excel Users is an introductory course that helps spreadsheet users transition into data analysis with R. By building on familiar Excel concepts, students learn how to manipulate, clean, and summarize data using R scripts and packages like `dplyr`, `readxl`, and `ggplot2`. 

This course has been strongly inspired in those materials:

 - [R for Excel Users](https://rforexcelusers.com/) (book by John L Taveras)
 - [R for Excel Users](https://rstudio-conf-2020.github.io/r-for-excel/) (book by Julie Lowndes & Allison Horst)


The course was conducted in Spanish; therefore, most of the sources in this repository are in Spanish as well.


These resources are organized as follows:

* **01\_diagnostico-excel**: Contains diagnostic materials used to assess students’ prior knowledge and skills in Microsoft Excel.

* **02\_material**: Includes datasets for hands-on exercises, such as Colombian municipal and departmental maps and some educatinal data. Thanks to [Saber data](https://github.com/nebulae-co/saber) and [Colmaps](https://github.com/nebulae-co/colmaps).

* **03\_miscelanea**: A collection of complementary study materials and reference documents.

* **04\_resultados**: A directory designated for storing evaluation results generated during the course.

* **05\_avance**: A workspace for student projects; each student uploads their code in a dedicated personal folder.



---


## Detailed Course Logbook

---

### 🎯 General Objective of the Course

The course *“R for Excel Users”* is designed to introduce individuals with prior experience in Microsoft Excel to the R programming language. By leveraging students’ practical and intuitive understanding of spreadsheets, the course aims to develop foundational competencies in structured and reproducible data analysis. Through a comparative and hands-on methodology, the course translates common Excel operations—such as filters, formulas, functions, pivot tables, and data structures—into the R environment.
By the end of the course, students will be able to:

* Install and use R and RStudio.
* Create and manage reproducible projects.
* Manipulate, transform, and summarize data using the `dplyr` package.
* Read and understand datasets from different formats, especially Excel files.
* Work with text variables, dates, and categorical data.
* Perform basic aggregation, and mapping tasks.
* Understand key conceptual differences between Excel and R (objects, functions, structures).

---

## Session 1 – Introduction: From Excel to R

### 🧠 Theoretical Content

* What is Excel and how do we use it?
* The spirit of the course: translating Excel skills into R code.
* What is covered: data manipulation, structures, scripting, basic calculations.
* What is **not** covered: data collection tools, integration with Power BI, advanced modeling or sophisticated visualization.
* Differences between spreadsheets and `data.frames`.

### 🛠️ Practical Activities

* Presentation of the course, syllabus, and evaluation criteria (minimum 75% attendance).
* Watch an introductory video about Excel.
* Excel knowledge diagnostic test (`01_diagnostico-excel`).
* Participant introductions.
* Completion of an [expectations form](https://forms.office.com/r/j9nJWRGEwJ).
* Create a first RStudio project: what it is and why it matters.
* Recommended project folder structure.
* Install and load the `readxl` package.
* Load an Excel file into R. 
* First conceptual contrast: spreadsheet vs `data.frame`.

---

## Session 2 – Navigating R: Context, Packages, and Transformations

### 🧠 Theoretical Content

* What is R: origin, history, and the concept of free software.
* Cultural and technological ecosystems: IBM/SPSS vs Microsoft/Excel vs R/Posit.
* The R package ecosystem (CRAN, Bioconductor, GitHub).
* Concept review: `data.frame`, `glimpse`, pipe operator (`%>%`), `select`.
* The importance of projects for reproducible research.
* Visualizing and reviewing student expectations (generated HTML file).

### 🛠️ Practical Activities

* Review of data import procedures.
* Introduction to the `dplyr` package.
* Basic functions: `ncol`, `nrow`, `class`.
* Transformations using `mutate` to create new variables.
* Conditional logic: `if_else`, `case_when`.
* Filtering data: `filter`, `slice`.
* Grouped operations: `group_by` + `summarise` (e.g., basic technology index by municipality).

---

## Session 3 – Language, Structures, and Advanced Data Manipulation

### 🧠 Theoretical Content

* Why do we program?
* When is programming more efficient than point-and-click interfaces?
* Brief overview of the modern ecosystem: Python, AI, Google Colab, etc.
* The data life cycle.
* Best practices for variable naming.
* Internal structure of a `data.frame`.

### 🛠️ Practical Activities

* Installation of key packages: `stringr`, `lubridate`, `sf`, `ggplot2`, `scales`.
* Accessing variables: `select`, `[ ]`, `$`, `[[ ]]`.
* Data types: numeric, text, and date formats.
* Logical checks: `%in%`, `count`, `n`.
* Text manipulation with `stringr`: case transformation, `str_pad`.
* Date manipulation with `lubridate`: calculating age using intervals.

---

## Session 4 – Relationships, Complex Structures, and Introductory Mapping

### 🧠 Theoretical Content

* The difference between theoretical knowledge and skill acquisition.
* Fundamentals of *joins* and relational tables.
* Introduction to pivoting tables in R.
* The concept of nesting: subtables inside columns.
* Geographic data columns using the `sf` package.

### 🛠️ Practical Activities

* Data transformation: `pivot_longer`, `pivot_wider`.
* Creating contingency tables.
* Data joins: `left_join`, `right_join`, `inner_join`, etc.
* Case studies: city name harmonization, Likert-type scale analysis.
* Nested data structures: `nest()`, `unnest()`.
* Basic spatial visualization with `sf`: Let’s make a map!

---

### 📦 Key Packages Used in the Course

| Package     | Main Functionality                    |
| ----------- | ------------------------------------- |
| `readxl`    | Read Excel files                      |
| `dplyr`     | Efficient data manipulation           |
| `lubridate` | Date and time management              |
| `stringr`   | Text manipulation                     |
| `sf`        | Handling spatial (geographic) data    |
| `scales`    | Formatting and scaling visualizations |
| `ggplot2`   | Data visualization                    |




## 🧪 Final Project – *Measuring with R What Excel Can Only Hint At*

### ✍️ Description

Each student will individually complete a small project that consolidates the core skills developed throughout the course. This final project serves as a practical synthesis of essential competencies including data importation, transformation, indicator construction, `data.frame` manipulation, and the creation of simple spatial visualizations (choropleth maps).

---

### 📂 Tasks

1. **Data Loading**

   * Load the 2008 Saber 11 dataset, available in the `otros_materiales/` folder.
   * Load the departmental reference dataset from the same folder.

2. **Indicator Construction**

   * **Humanities Score**: Calculate the departmental average based on the variables `ciencias_sociales`, `filosofia`, and `lenguaje`.
   * **Technology Score**: Calculate the departmental average based on the variables `celular`, `internet`, and `computador`.

3. **Summary Table**

   * Create a summary table containing:

     * Department code of residence.
     * Humanities Score.
     * Technology Score.

4. **Visualization**

   * Merge the summary table with the geographic dataset.
   * Create two choropleth maps, one for each score.
   * Ensure that scales are well-defined, readable, and appropriately styled.

5. **Submission**

   * Upload a `.R` or `.Rmd` file containing the complete, functional, and well-documented code to the `avance/` folder in your RStudio project.
   * The code must be organized and commented for clarity and reproducibility.

6. **Reflection**

   * Upon completion, take a moment to breathe deeply and appreciate the satisfaction of having learned something powerful and lasting.

---

## 📏 Evaluation Rubric

| Criterion                       | Excellent (5)                                                                    | Satisfactory (3)                                          | Insufficient (1)                               |
| ------------------------------- | -------------------------------------------------------------------------------- | --------------------------------------------------------- | ---------------------------------------------- |
| **Data Loading**                | Data correctly imported using `readxl` and processed using `dplyr`.              | Data loaded with minor errors or redundancies.            | Data not properly loaded or serious errors.    |
| **Indicator Calculation**       | Clear formulas, reproducible code, effective use of `group_by` + `summarise`.    | Correct indicators, but code is disorganized or unclear.  | Incorrect or missing indicators.               |
| **Final `data.frame` Usage**    | Clean, well-structured table with only relevant columns.                         | Table includes unnecessary or poorly organized columns.   | Final table not generated or incorrect.        |
| **Spatial Join (`sf`)**         | Geographic data joined correctly; process is clearly understood.                 | Join completed, but with minor errors or confusion.       | Join not performed or contains critical flaws. |
| **Visualization (Choropleths)** | Maps are clear, visually appealing, with appropriate legends and color scales.   | Maps are functional but have design or scaling issues.    | Maps are missing or illegible.                 |
| **Code and Organization**       | Code is clean, well-commented, and structured in logical sections.               | Code is minimally documented or somewhat disorganized.    | Code is disorganized and lacks documentation.  |
| **Submission and Format**       | Correctly submitted in the appropriate folder and format.                        | Submission contains formatting or folder location errors. | Not submitted or inaccessible.                 |
| **Closing Attitude**            | Evidence of reflection, personal insight, and enjoyment of the learning process. | Task completed without clear engagement or reflection.    | Incomplete work or lack of commitment.         |

> **Note**: The final project accounts for **25% of the overall course grade**.




---

## 📚 Further Reading and Resources

### 📘 **Introductory Texts and Learning Platforms**

* **Grolemund, G., & Wickham, H. (2016).** *R for Data Science*. O’Reilly Media.
  [https://r4ds.hadley.nz/](https://r4ds.hadley.nz/)
  A comprehensive and beginner-friendly guide to data manipulation, transformation, and visualization using the tidyverse approach.

* **Peng, R. D. (2016).** *R Programming for Data Science*. Leanpub.
  [https://bookdown.org/rdpeng/rprogdatascience/](https://bookdown.org/rdpeng/rprogdatascience/)
  A more technical introduction to programming structures in R, including control flow, functions, and base R concepts.

* **DataCamp** – *Introduction to R*, *Data Manipulation with dplyr*, *Importing Data in R*.
  [https://www.datacamp.com](https://www.datacamp.com)
  Interactive, hands-on learning platform offering short courses on R essentials, including many Excel-to-R analogies.

---

### 📗 **Reference Manuals and Documentation**

* **The R Project Documentation**
  [https://cran.r-project.org/manuals.html](https://cran.r-project.org/manuals.html)
  Official manuals including *An Introduction to R* and *R Language Definition*, for deeper reference on R syntax and data types.

* **RStudio Cheatsheets** (by Posit)
  [https://posit.co/resources/cheatsheets/](https://posit.co/resources/cheatsheets/)
  Quick-reference guides on packages like `dplyr`, `ggplot2`, `readxl`, `lubridate`, and more.

---

### 📙 **Thematic Resources**

* **Wickham, H. (2019).** *Advanced R* (2nd ed.). Chapman and Hall/CRC.
  [https://adv-r.hadley.nz/](https://adv-r.hadley.nz/)
  For students wishing to go beyond the basics, this book dives into object-oriented programming, environments, and functional programming in R.

* **Wickham, H., & Bryan, J. (2023).** *Happy Git and GitHub for the useR*.
  [https://happygitwithr.com/](https://happygitwithr.com/)
  Ideal for students interested in reproducibility, version control, and collaborative workflows.

* **Pebesma, E., & Bivand, R.** (2023). *Spatial Data Science with R*
  [https://r-spatial.org/book/](https://r-spatial.org/book/)
  A modern introduction to handling geospatial data using `sf`, `tmap`, and related packages, especially useful for the mapping component.

---

### 📄 **Articles and Pedagogical Tools**

* **van der Loo, M. P. J., & de Jonge, E. (2018).** *Learning R by Translation: From Excel to R*.
  *The R Journal*, 10(1), 282–292.
  [https://journal.r-project.org/archive/2018/RJ-2018-032/index.html](https://journal.r-project.org/archive/2018/RJ-2018-032/index.html)
  An excellent paper specifically addressing the pedagogical bridge between Excel thinking and R scripting.

* **University of Toronto** – *From Excel to R: A Guide for Transitioning Analysts*.
  [https://uoftcoders.github.io/studyGroup/lessons/excel-R/](https://uoftcoders.github.io/studyGroup/lessons/excel-R/)
  A practical step-by-step guide for Excel users transitioning into R, with real data examples and conceptual analogies.

---

### 🎥 **Videos and Multimedia**

* **YouTube – R Programming for Excel Users**
  Search for curated tutorials that address common Excel tasks translated into R, such as filters, pivot tables, and formulas.

* **Posit (RStudio) Webinars**
  [https://posit.co/resources/webinars/](https://posit.co/resources/webinars/)
  Includes recorded sessions on tidyverse, data science workflows, and reproducible research in R.




