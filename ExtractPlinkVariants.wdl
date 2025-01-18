version 1.0

workflow ExtractPlinkVariants {
  input {
    File plink_bed
    File plink_bim
    File plink_fam
    File variant_list
    String output_prefix
  }

  call ExtractVariants {
    input:
      plink_bed = plink_bed,
      plink_bim = plink_bim,
      plink_fam = plink_fam,
      variant_list = variant_list,
      output_prefix = output_prefix
  }

  output {
    File extracted_bed = ExtractVariants.extracted_bed
    File extracted_bim = ExtractVariants.extracted_bim
    File extracted_fam = ExtractVariants.extracted_fam
  }
}

task ExtractVariants {
  input {
    File plink_bed
    File plink_bim
    File plink_fam
    File variant_list
    String output_prefix
  }

  command {
    # Create symbolic links for PLINK binary files
    ln -s ~{plink_bed} input.bed
    ln -s ~{plink_bim} input.bim
    ln -s ~{plink_fam} input.fam

    # Run PLINK to extract variants
    plink --bfile input --extract ~{variant_list} --make-bed --out ~{output_prefix}
  }

  output {
    File extracted_bed = "~{output_prefix}.bed"
    File extracted_bim = "~{output_prefix}.bim"
    File extracted_fam = "~{output_prefix}.fam"
  }

  runtime {
    docker: "biocontainers/plink:v1.90b6.21-1-deb_cv1"
    memory: "4G"
    cpu: 2
  }
}

