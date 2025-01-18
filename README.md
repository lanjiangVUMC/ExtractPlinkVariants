# ExtractPlinkVariants Workflow

## Overview
This workflow extracts a specified set of variants from a PLINK binary file and generates a new set of binary files. It uses PLINK for efficient genetic data processing.

## Inputs
The workflow requires the following inputs:
- **PLINK Binary Files**:
  - `plink_bed`: The `.bed` file of the PLINK binary dataset.
  - `plink_bim`: The `.bim` file of the PLINK binary dataset.
  - `plink_fam`: The `.fam` file of the PLINK binary dataset.
- **Variant List**:
  - `variant_list`: A text file containing the list of variants to extract.
- **Output Prefix**:
  - `output_prefix`: Prefix for the output binary files.

## Outputs
The workflow produces the following files:
- `output_prefix.bed`: The binary genotype file for the extracted variants.
- `output_prefix.bim`: The marker information file for the extracted variants.
- `output_prefix.fam`: The individual information file for the extracted variants.

## Usage
### Input Example
Prepare an input JSON file as shown below:

```json
{
  "ExtractPlinkVariants.plink_bed": "path/to/input.bed",
  "ExtractPlinkVariants.plink_bim": "path/to/input.bim",
  "ExtractPlinkVariants.plink_fam": "path/to/input.fam",
  "ExtractPlinkVariants.variant_list": "path/to/variant_list.txt",
  "ExtractPlinkVariants.output_prefix": "path/to/output_prefix"
}

