# ssak-coursework
Exploratory spatial analysis on the association between deprivation data and secondary school educational attainment across areas in England. Group coursework for CEGE0097 Spatial Analysis and Geocomputation.Team members: [@daley610](https://github.com/daley610), [@Kumsw](https://github.com/Kumsw), [@seainiquirke](https://github.com/seainiquirke), [@simonaen](https://github.com/simonaen).

## Project structure

Data used in this project is stored in `data/` directory where raw data and processed data are further separated into `data/raw/` and `data/processed/`. Raw data is data as found from the source and processed data is a snapshot of any data transformation performed with the raw data for this project.

Utility functions (unique reusable logic) are stored in `R/` directory.
Project logic (using utility functions) and spatial analysis is implemented in files in `scripts/` directory.

Directory `outputs/` stores any output plots, maps, text, as well as the final report.
