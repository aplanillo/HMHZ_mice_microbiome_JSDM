# HMHZ_mice_microbiome_JSDM

Analisis of microbiome gut communities in wild house mice from the house mice hybrid zone

### data/ --> "PS.TSS_filtered.rds"

A phyloseq object. This contains the dataset, consisting of OTU table
(number of sequening reads for each sample and cASV), taxonomy table
(for each cASV) and sample data for each sample (mouse). This data is
the result of amplicon processing with the packages dada2\[\] and the
wrapper MultiAmplicon\[\].

The process to assign cASVs and functions for further transformation
(total sum scaling per amplicon to obtain relative abundances) of this
data were developed in:

* https://github.com/ferreira-scm/Eimeria_AmpSeq "Amplicon sequencing allows differential quantification of closely related parasite species: an example from rodent coccidia (Eimeria)" https://doi.org/10.1186/s13071-023-05800-6

Basic bioinfomratic curation of this data has been performed in

* https://github.com/ferreira-scm/Hybridization_spatial_HMHZ.: Briefly, removing cASVs with less than 0.005% abundance (within overall sequencing read numbers) and removing samples with less than 100 reads. Removing taxonomic handlers from Silva to obtain clean taxonomic annotations. Manual cASV annotation for some parasite taxa (Eimeria and Oxyurida).

### intermediate_data/

Different datasets created during the cleaning and preparing of the input for the jSDM models.

### rscripts/

#### helpers

- <code>source_pkgs.R</code>: Loads (and if neccesary installs) the R
  packages used in the project.
- <code>transformPS.R</code> Transformation function developed in this
  work but not availale in packages are provided within the present
  repository in "rscripts/transformPS.R".

#### the pipeline

- <code>1_variables.R</code> This script prepares the response and explanatory variables for the jSDM analysis.