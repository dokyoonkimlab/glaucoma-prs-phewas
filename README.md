# glaucoma-prs-phewas
#### Polygenic Risk Score-based Phenome-wide Association for Glaucoma and Its Impact on Disease Susceptibility in Two Large Biobanks
Jae-Seung Yun; Sang-Hyuk Jung; Su-Nam Lee; Seung Min Jung; Penn Medicine Biobank; Hong-Hee Won; Dokyoon Kim; Jin A Choi


## Description
### 1. PRS Generation for POAG
To quantify genetic risk for glaucoma, we generated a PRS using summary statistics from the GWAS conducted by the International Glaucoma Genetics Consortium (IGGC) [1], which consisted of 12,713,176 variants. The GWAS was conducted with a fixed-effects meta-analysis of 15,229 POAG cases and 177,473 controls of European descent excluding UK Biobank samples and the summary statistics are available via GWAS Catalog [2],  under the study accession identifier GCST90011767.

The PRS was constructed using PRS-CS (version 1.0.0) [3], which is a Bayesian polygenic method that infers the posterior mean effect size of each variant based on GWAS summary statistics and the linkage disequilibrium reference panel. The individual PRSs were computed from beta coefficients as the weighted sum of the risk alleles by applying PLINK version 1.90 [4].

---
### Glaucoma PRS-CS model - xxx.xxx variants
> [TBD](https://github.com/dokyoonkimlab/hnc-prs-phewas/blob/main/prs-model/GAME-ON_HNC-all_PRSCS_auto.zip)
---

### 2. Phenome-wide Association Study Scripts
The “PheWAS” R package (version 0.99.5.5) was used to perform PheWAS analyses [5]. In these analyses, POAG PRS was set as the independent variable, and disease phenotypes as dependent variables, with age, sex, genotyping array, and first 10 genetic PCs of ancestry as covariates. Disease diagnosis category phenotypes were obtained by mapping the International Classification of Diseases, Ninth or Tenth Revision (ICD-9 and -10) diagnosis codes of the UK Biobank to 1,618 hierarchical phenotypes (PheCodes) categorized into 17 disease categories [6]. We removed phenotypic codes with less than 100 cases and those concerning symptoms, injuries, and poisoning, resulting in 776 phenotypes in 15 disease categories that were included in our analysis.

---
> [TBD](https://github.com/dokyoonkimlab/hnc-prs-phewas/blob/main/prs-model/GAME-ON_HNC-all_PRSCS_auto.zip)
---

### References
1. Gharahkhani P, Jorgenson E, Hysi P, et al. Genome-wide meta-analysis identifies 127 open-angle glaucoma loci with consistent effect across ancestries. Nat Commun. 2021;12:1258.
2. Buniello A, MacArthur JAL, Cerezo M, et al. The NHGRI-EBI GWAS Catalog of published genome-wide association studies, targeted arrays and summary statistics 2019. Nucleic Acids Res. 2019;47:D1005-d1012.
3. Ge T, Chen CY, Ni Y, et al. Polygenic prediction via Bayesian regression and continuous shrinkage priors. Nat Commun. 2019;10:1776.
4. Chang CC, Chow CC, Tellier LC, et al. Second-generation PLINK: rising to the challenge of larger and richer datasets. Gigascience. 2015;4:7.
5. Denny JC, Ritchie MD, Basford MA, et al. PheWAS: demonstrating the feasibility of a phenome-wide scan to discover gene-disease associations. Bioinformatics. 2010;26:1205-1210.
6. Denny JC, Bastarache L, Ritchie MD, et al. Systematic comparison of phenome-wide association study of electronic medical record data and genome-wide association study data. Nat Biotechnol. 2013;31:1102-1110.
