[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.11473204.svg)](https://doi.org/10.5281/zenodo.11473204)

# Background
Apple producers are dealing with weather related risks affecting their production. One important risk, is the damage of buds or young fruits by late spring frosts. Fruit growers can protect their apple orchards against this risk in various ways. With our probabilistic model presented in the manuscript on “Model-based decision support for the choice of active spring frost protection measures in apple production” by [Christine Schmitz](https://github.com/ChristineSchmitz), [Lars Zimmermann](https://github.com/Lars-Zimmermann), [Katja Schiffers](https://github.com/katjaschiffers), [Cory Whitney](https://github.com/CWWhitney), Martin Balmer and [Eike Luedeling](https://github.com/eikeluedeling), we want to support the decision between several active frost protection measures. The measures considered in the model are: overhead irrigation, below-canopy irrigation, stationary wind machine, mobile wind machine, tractor-mounted gas heater, portable gas heater, candles and pellet heaters. 

This repository contains all files needed to follow the simulation presented in the manuscript. The model can be used for additional production scenarios by adapting the input values. 
The code is written in R (R Core team, 2021)[^1] and mainly uses the package decisionSupport (Luedeling et al., 2021)[^2]. The Expected Value of Perfect Information (EVPI) is calculated with the package evpi developed by Kopton (2024)[^3]. In addition, functions from tidyverse (Wickham et al., 2019)[^4] and patchwork (Pedersen, 2024)[^5], as well as attached packages, were used in the code.

# Repository Content
## Model
[`Decision_model_code.R`](https://github.com/ChristineSchmitz/Supporting_Information_DA_Frost_Protection/blob/main/Decision_model_code.R) is the file where the model itself is stored. The file starts with general preparations and reading in and formatting the input data. The decision function called `frost_protection_apple`, combines all important costs, risks and benefits of the protection measures to calculate Net Present Value, Yield, Costs per kg and further outputs for the measures and allows to compare them to the baseline scenario of producing apples without frost protection. Decision function and input data are used to run Monte Carlo Simulations for two apple growing regions in Germany (Rhineland and Lake Constance region), as case studies. 

## Input data files
### The Input data for the model is stored in three data sheets:
[`Frost_protection_input_apple_supplementary.csv`](https://github.com/ChristineSchmitz/Supporting_Information_DA_Frost_Protection/blob/main/Frost_protection_input_apple_supplementary.csv) contains all inputs valid for both case study regions. This inputs are parameterized for the scenarios of apple production in Germany. Therefore, monetary values are estimated in €. 

[`frost_scenario_supplementary.csv`](https://github.com/ChristineSchmitz/Supporting_Information_DA_Frost_Protection/blob/main/frost_scenario_supplementary.csv) contains all inputs which differ between the Rhineland and the Lake Constance region. 

[`Information_input_apple_supplementary.csv`](https://github.com/ChristineSchmitz/Supporting_Information_DA_Frost_Protection/blob/main/Information_input_apple_supplementary.csv) contains additional information needed to calculate the investment costs. 

## Functions
[`Functions.R`](https://github.com/ChristineSchmitz/Supporting_Information_DA_Frost_Protection/blob/main/Functions.R) is a file with functions needed to produce the plots as presented in the manuscript. 
## Post-Hoc Analysis
For each input variable we calculated the Variable Importance in Projection (VIP) and the EVPI. 

[`VIP_Analysis.R`](https://github.com/ChristineSchmitz/Supporting_Information_DA_Frost_Protection/blob/main/VIP_Analysis.R) contains the code used to calculate and plot the VIP

[`EVPI_Analysis.R`](https://github.com/ChristineSchmitz/Supporting_Information_DA_Frost_Protection/blob/main/EVPI_Analysis.R) contains the code used to calculate the EVPI
## Plots
[`Result_figures.R`](https://github.com/ChristineSchmitz/Supporting_Information_DA_Frost_Protection/blob/main/Result_figures.R) produces the plots showed in the manuscript and the supporting information
## Results
### The results of the evpi calculation [`EVPI_Analysis.R`](https://github.com/ChristineSchmitz/Supporting_Information_DA_Frost_Protection/blob/main/EVPI_Analysis.R) are stored in the files

[`evpi_Rhineland.csv`](https://github.com/ChristineSchmitz/Supporting_Information_DA_Frost_Protection/blob/main/evpi_Rhineland.csv) for the Rhineland
[`evpi_LakeConstance.csv`](https://github.com/ChristineSchmitz/Supporting_Information_DA_Frost_Protection/blob/main/evpi_LakeConstance.csv) for the Lake Constance region

The results of the Monte Carlo simulation are stored on Zenodo in the repository [`Model results: Model-based decision support for the choice of active spring frost protection measures in apple production`](https://doi.org/10.5281/zenodo.11470867), as the files are large. 

# References
[^1]: R Core Team, 2021. R: A language and environment for statistical computing. R Foundation for Statistical Computing, Vienna, Austria.
[^2]: Luedeling, E., Goehring, L., Schiffers, K., Whitney, C., Fernandez, E., 2021. decisionSupport – Quantitative Support of Decision Making under Uncertainty. Contributed package to the R programming language. Version 1.106.
[^3]: Kopton, J., 2024. A fast implementation of the Expected Value of Perfect Parameter Information (EVPPI) for large Monte Carlo simulations. Zenodo. https://doi.org/10.5281/ZENODO.10728646
[^4]: Wickham H, Averick M, Bryan J, Chang W, McGowan LD, François R, Grolemund G, Hayes A, Henry L, Hester J, Kuhn M, Pedersen TL, Miller E, Bache SM, Müller K, Ooms J, Robinson D, Seidel DP, Spinu V, Takahashi K, Vaughan D, Wilke C, Woo K, Yutani H (2019). “Welcome to the tidyverse.” Journal of Open Source Software, 4(43), 1686. doi:10.21105/joss.01686.
[^5]: Pedersen, T (2024). patchwork: The Composer of Plots. R package version 1.2.0.9000, https://github.com/thomasp85/patchwork, https://patchwork.data-imaginist.com.
