# install.packages("pak", repos = "https://r-lib.github.io/p/pak/dev/")
pak::pak("bslib")
pak::pak("fs")


# Get bs3 compat ----------------------------------------------------------

bs3comptat_dir <- system.file("bs3compat", package = "bslib")
where <- fs::path("tools/rstrap/", fs::path_file(bs3comptat_dir))
fs::dir_delete(where)
fs::dir_copy(bs3comptat_dir, where )

## Adapt scss for our bundle
withr::with_dir(
  "tools/rstrap/bs3compat/", {
    ## rename file to avoid conflict
    files <- c("_declarations", "_defaults", "_rules")
    new <- paste0(files, "_bs3_compat")
    try(fs::file_move(fs::path_ext_set(files, ".scss"), fs::path_ext_set(new, ".scss")))
    ## Remove rules we don't need
    xfun::gsub_file("_rules_bs3_compat.scss", "^(@import \"wells\";)$", "// \\1")
    xfun::gsub_file("_rules_bs3_compat.scss", "^(@import \"glyphicons\";)$", "// \\1")
})

# Build rstrap

# See tools/update.sh
