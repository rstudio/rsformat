# render with different options

render_example <- function(format = rsformat::rstrap_document, output_file = NULL, ...) {
  res <- rmarkdown::render("examples/example1.Rmd",
                           output_format = format(...),
                           output_file = output_file
  )
  rstudioapi::viewer(res)
}

render_rstrap <- function(...) {
  render_example(format = rsformat::rstrap_document,
                 output_file = NULL,
                 ...)
}

render_base <- function(...) {
  render_example(format = rmarkdown::html_document,
                 output_file = "base.html",
                 ...)
}

# Default doc

render_rstrap(self_contained = FALSE)
render_base(theme = list(version = 4), self_contained = FALSE)
# what happens if we don't have bs3compat file from bslib.
render_base(theme = bslib::bs_remove(bslib::bs_theme(version = 4), "bs3compat"), self_contained = FALSE)

# TOC ---------------------------------------------------------------------

render_rstrap(toc = TRUE)
render_rstrap(toc = TRUE, toc_float = TRUE)
render_rstrap(
  toc = TRUE,
  toc_float = list(
    collapsed = FALSE,
    smooth_scroll = FALSE,
    print = FALSE
  )
)
render_rstrap(toc = TRUE,
              toc_float = TRUE,
              theme = list(version = 4))
render_rstrap(
  toc = TRUE,
  toc_float = list(
    collapsed = FALSE,
    smooth_scroll = FALSE,
    print = FALSE
  ),
  theme = list(version = 4)
)

# Number section ----------------------------------------------------------

render_rstrap(number_sections = TRUE)

# Code folding ------------------------------------------------------------

render_rstrap(code_folding = "show", self_contained = FALSE)
render_base(code_folding = "show", self_contained = FALSE, theme = list(version = 4))

# Code download -----------------------------------------------------------

render_rstrap(code_download = TRUE, self_contained = FALSE)
render_base(code_download = TRUE, theme = list(version = 4), self_contained = FALSE)
render_base(code_download = TRUE, theme = bslib::bs_remove(bslib::bs_theme(version = 4), "bs3compat"), self_contained = FALSE)

# Anchor sections ---------------------------------------------------------

render_rstrap(anchor_sections = TRUE)
render_base(anchor_sections = TRUE)

# navbar ----------------
with_navbar <- function(expr, nav_yml = "examples/_navbar.yml") {
  navbar <- list(
    title = "My Website",
    type = "default",
    left = list(
      list(text = "Home", href = "index.html"),
      list(text = "Example", href = "example1.html")
    ),
    right = list(list(text = "GitHub",  href = "https://github.com"))
  )
  yaml::write_yaml(navbar, nav_yml)
  on.exit(unlink(nav_yml), add = TRUE)
  force(expr)
}

with_navbar(render_rstrap(self_contained = FALSE))
with_navbar(render_base(theme = list(version = 4), self_contained = FALSE))
