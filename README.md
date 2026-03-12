# deep-oaks: Anna's class project branch
## ATM298 (Group Study in Enviornmental Data Science) WQ 2026
## TL;DR: Anna uses microbial taxonomy and lifestyle data from deep-oaks to learn about network vizualisation!

### About the data: 
These data are from Bogar Lab's "Deep Oaks" project (sampled 2023), which identified fungal and bacterial taxa present in depth-resolved soil samples under six oak trees (half of which were dead at the time of sampling). The main branch of this repo contains the data mangament and analysis code for all analyses repored in [our manuscript](https://www.biorxiv.org/content/10.1101/2024.11.28.625745v1.full), which is in review (accepted pending minor revisions) with Soil Biology and Biogeochemistry.

Lab work and pre-processing that occured before this project:
- "Barcoding" genes (16S for bacteria, ITS for fungi) were amplified from whole-soil-sample cDNA (cDNA was reverse-transcribed from rRNA extracted directly from soil).
- Amplified genes were sequenced. Variations of each gene ("ASVs", amplicon sequence variants) were assigned taxonomy using publically availible databases (UNITE for fungi, SILVA for bacteria). Specificity of availible taxonomic assignment varied.
- Read count of each ASV/sample was normalized to relative abundance of each ASV in each sample.
- Fungal "lifestyle" assignments attached to ASVs where possible using the publically availible FungalTraits database.

### which files am I looking at?
Everything I did for ATM298 (and changed in this branch of the repo) is in Analysis/Networks. The network graph I presented in class is Analysis/Networks/Results/tree-fun-bip_default-layout.png

### Network project workflow:
I spent a lot of time learning igraph and manipulating my phyloseq objects to make them compatible -- great practice for me, and some good remedial education in data structures beyond simple csvs. All "sandbox_.Rmd" files are messy notebooks that I was practicing this in as I worked thorugh the igraph course in DataCamp.

Here's the work directly upstream of my final graph:

1) genus_gloms.Rmd
   a) Agglomerate both phyloseq objects to genus. For ASVs that could not be assigned to genus, create and agglomerate into meaningful placeholder taxa which reference the most specific availible taxonomic assignment. For example, all ASVs which were assigned a given family (say, Helotiaceae) but were not assigned a genus are sorted into "genus" "Unclass_f__Helotiaceae". ASVs not assigned a family or genus but assigned to the same order are agglomerated -- e.g., "Unclass_o__Helotiales" -- and so on.
   b) Attach "primary lifestyles" to genus-agglomerated fungal taxa.
2) tree-fun_bipartite.Rmd
   a) Combine the OTU tables from both the bacterial and fungal phyloseq objects (relevant when I was trying to make a co-occurence network)
   b) Make an edgelist linking soil samples 15cm+ below the surface to the fungal taxa that appeared in them
   c) Make an igraph object, adding vertex attributes (all sample metadata for soil sample nodes, all taxonomy and fungal primary lifestyles for microbial taxon nodes). Set size and color attributes based on tree mortality and fungal primary lifestyle
   d) Impose arbitrary thresholds (fungi only, taxa with relative abundance > 1% only) for readability.  
   d) Make a bipartite network graph linking trees to fungal taxa!

### Final product I presented in ATM298: 
tree-fun-bip_default-layout.png
