# deep-oaks: Anna's class project branch
## ATM298 (Group Study in Enviornmental Data Science) WQ 2026
## Anna uses microbial taxonomy and lifestyle data from deep-oaks to learn about network vizualisation 

### About the data: 
These data are from Bogar Lab's "Deep Oaks" project (sampled 2023), which identified fungal and bacterial taxa present in depth-resolved soil samples under six oak trees (half of which were dead at the time of sampling). The main branch of this repo contains the data mangament and analysis code for all analyses repored in [our preprint](https://www.biorxiv.org/content/10.1101/2024.11.28.625745v1.full), which is pending publication in Soil Biology and Biogeochemistry.

Lab work and pre-processing that occured before this project:
- "Barcoding" genes (16S for bacteria, ITS for fungi) were amplified from whole-soil-sample cDNA (cDNA was reverse-transcribed from rRNA extracted directly from soil).
- Amplified genes were sequenced. Variations of each gene ("ASVs", amplicon sequence variants) were assigned taxonomy using publically availible databases (UNITE for fungi, SILVA for bacteria). Specificity of availible taxonomic assignment varied.
- Read count of each ASV/sample was normalized to relative abundance of each ASV in each sample.
- Fungal "lifestyle" assignments attached to ASVs where possible using the publically availible FungalTraits database.

### Project workflow:
I spent a lot of time learning igraph and manipulating my phyloseq objects to make them compatible -- great practice for me, and some good remedial education in data structures beyond simple csvs. All "sandbox_.Rmd" files are messy notebooks that I was practicing this in as I worked thorugh the igraph course in DataCamp.

Here's the work directly upstream of my final graph:

1) Agglomerate both phyloseq objects to genus, and create meaningful placeholder genera into which to sort ASVs that could not be assigned to genera. For example, all ASVs which were assigned a given family (say, Entolomataceae) but were not assigned a genus are sorted into genus "Unclass_f__Entolomataceae".
   - genus_gloms.Rmd
2) Attach "primary lifestyles" assigned to fungi appropriately to genus-agglomerated taxa
2) Make a bipartite network graph linking trees to taxa, based on arbitrary thresholds (deeper soil samples only, fungi only, taxa with relative abundance > 1% only) set for readability.  
