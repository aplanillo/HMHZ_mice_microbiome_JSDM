# HMHZ_mice_microbiome_JSDM
Analisis of microbiome gut communities in wild house mice from the house mice hybrid zone

### data/ --> "PS.TSS_filtered.rds" 
Data necessary to run these scripts; A phyloseq object for the mice dataset, consisting of OTU table, taxonomic table and metadata for each amplicon, after identification and quality screening of ASVs and taxonomic annotation. 
The scripts to create the data are found in the repositories:

* https://github.com/ferreira-scm/Eimeria_AmpSeq
Original Raw data.
Methods are described in the "Amplicon sequencing allows differential quantification of closely related parasite species: an example from rodent coccidia (Eimeria)" manuscript https://doi.org/10.1186/s13071-023-05800-6

* https://github.com/ferreira-scm/Hybridization_spatial_HMHZ.
Filter and clean raw data for wild mouse.
Quality filtering ASVs per amplicon and merging.
Removing ASVs with less than 0.005% abundance and removing samples with less than 100 reads.
Removing taxonomic handlers from silva.
Total sum scaling per amplicon (relative abundances). 
Resulting in 3 combined ASVs (cASVs) for E. ferrisi, E. falciformis and E. vermiformis
Correlation co-occurrence networks for all known parasite genera.
For Oxyurida, we do phylogenetic analysis as done for Eimeria in Ferreira et al. 2023.
Merge ASVs that cluster together.
