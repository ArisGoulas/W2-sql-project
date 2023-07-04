<img src="https://bit.ly/2VnXWr2" alt="Ironhack Logo" width="100"/>

# Project: CLI - Competitive Landscape of Ironhack

## Overview

The AAA data analytics & consultancy firm comprises of three data analysts ([Aris Goulas](https://github.com/ArisGoulas), [Alvaro Gracio](https://github.com/alvarogracio), [Afonso Macedo](https://github.com/Afonso-Macedo)). They were recently hired by Ironhack, Portugal to perform an Analytics Consulting Project entitled: competitive landscape of Ironhack (cli).
You were hired by Ironhack to perform an Analytics Consulting Project entitled: competitive landscape.

Your mission is to create and populate an appropriate database with many coding schools that are our competition, as well as design an suitable queries that answer business questions of interest (to be defined by you)

---

## Suggested Steps in the Project:

- A basic python notebook for obtaining data on competitor schools by using [SwitchUp](https://www.switchup.org/) was provided

- The initial notebook contained info on 3 schools (including Ironhack). The first task was to enrich it with a wider variety of schools
  - The top-25 schools based on their total number of reviews in the portal of switchup was used to populate the database further 

- The 5 obtained dataframes (comments, locations, courses, badges, schools) were imported to a SQL database 

- Take a look at the obtained dataframes. What dimensions do you have? what keys do you have? how could the different dataframes be connected?

- Go back to the drawing board and try to create an entity relationship diagram for tables available

- Once you have the schemas you want, you will need to:
  - create the suitable SQL queries to create the tables and populate them
  - run these queries using the appropriate Python connectors

- Bonus: How will this datamodel be updated in the future? Please write auxiliary functions that test the database for data quality issues. For example: how could you make sure you only include the most recent comments when you re-run the script?

### Suggested Deliverables

- 5-6 minute presentation of data model created, decision process and business analysis proposed

- exported .sql file with the final schema

- Supporting python files used to generate all logic

- High level documentation explaining tables designed and focusing on update methods

Crucial hint: check out the following tutorial: https://www.dataquest.io/blog/sql-insert-tutorial/
