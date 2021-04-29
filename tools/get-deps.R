# install.packages("pak", repos = "https://r-lib.github.io/p/pak/dev/")
pak::pak("bslib")
pak::pak("fs")


# Get bs3 compat ----------------------------------------------------------

bs3comptat_dir <- system.file("bs3compat", package = "bslib")
fs::dir_copy(bs3comptat_dir, "tools/rstrap/")

## Adapt scss for our bundle
withr::with_dir(
  "tools/rstrap/bs3compat/", {
    ## rename file to avoid conflict
    files <- c("_declarations", "_defaults", "_rules")
    new <- paste0(files, "_bs3_compat")
    try(fs::file_move(fs::path_ext_set(files, ".scss"), fs::path_ext_set(new, ".scss")))
    ## Remove rules we don't need
    xfun::gsub_file("_rules_bs3_compat.scss", "^(@import \"wells\";)$", "// \\1")
})

