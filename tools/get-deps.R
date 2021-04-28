# install.packages("pak", repos = "https://r-lib.github.io/p/pak/dev/")
pak::pak("bslib")
pak::pak("fs")


# Get bs3 compat ----------------------------------------------------------

bs3comptat_dir <- system.file("bs3compat", package = "bslib")
fs::dir_copy(bs3comptat_dir, "tools/rstrap/")
