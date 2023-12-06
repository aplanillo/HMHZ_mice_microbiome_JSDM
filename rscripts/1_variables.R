## load packages
source("rscripts/source_pkgs.R")

## the data in object still has a data losing transformation (relative
## abundances added up over different amplicons) in @otu_table. We
## will replace this by the complete data  
PS.TSS_filtered <- readRDS("./data/PS.TSS_filtered.rds")


unclass(sample_data(PS.TSS_filtered)) %>%
    ## need to remove class "sample_data" (phyloseq)
    as_tibble() %>%
    group_by(Locality, Year) %>%
    ## Number of mice trapped at one locality (combined long/lat at
    ## 4-digit resolution, available in "Locality"). We processed all
    ## mice for each locality. We create the variable per year to
    ## estimate density at one point in time. Hypothesis: as measure
    ## of host population density this indicates increase transmission
    ## between mice. More host-associated transmissible taxa will be
    ## enriched. Potential alternatives not considered now:
    ## collapsing localities at larger scale (more rounding),
    ## persistent density over years for those)
    summarize(jS_Ntrapped = n()) -> aggregateDensity

## using jS_ as a prefix for the variables selected in this project
## part (for this manuscript)
unclass(sample_data(PS.TSS_filtered)) %>%
    ## need to remove class "sample_data" (phyloseq)
    as_tibble() %>%
    ## mice needing to be dropped because of NA values (might be
    ## worthwhile to imput this at some point, "Status" could be most
    filter(!is.na(Body_Length)) %>% 
    ## add here other variable that could need filtering if included
    ## SELECTION FOR NOW:
    ## Latitude and longitude: the basic spatial coordinates, decimal
    ## format, rounded to 4 digits
    mutate(jS_lon = Longitude, 
           jS_lat = Latitude, 
           ## year: the year of sampling, hypothesis: closer years are more
           ## similar as a result of community persistence or similarity of
           ## environmental condition in closer years.
           jS_year = Year,
           ## BMI: the residuals of body weight on body
           ## length. Hypothesis: mice with worth body condition have
           ## disturbed microbiomes either as a cause or consequence
           ## of bad health. Might be worthwhile to consider plain
           ## weight or lenght as a proxy for age?! It'd be actually
           ## btter to use tail lenght for that, but not for now...
           jS_BMI = residuals(lm(Body_Weight~Body_Length, data = .)),
           ## HI, the hybrid index. Hypothesis: "disturbed"
           ## microbiomes (especially mycobiomes) in hybrids as
           ## observed previously.
           jS_HI = HI
           ## Remark: All species interaciton hypotheses
           ## (e.g. parasite infections, which would be available as
           ## derived sample variables) should be addressed as part of
           ## the response variable
           ) %>%
    full_join(aggregateDensity) -> allSData

## so see the selected variables, or later to select for analysis
## select(starts_with("jS_")) %>% head()

## feed it back into the core data set after dropping the same NA
## mice as for the sample data

PS.TSS_filtered <- subset_samples(PS.TSS_filtered, !is.na(Body_Length))
PS.TSS_filtered@sam_data <- sample_data(allSData)

PS.TSS_filtered <- saveRDS(PS.TSS_filtered, "./intermediate_data/PSvar.rds")
