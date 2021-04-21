html_dependencies_rstrap <- function() {
  list(
    # use last jquery
    jquerylib::jquery_core(3),
    # custom deps forked from boostrap
    htmltools::htmlDependency(
      "rstrap",
      utils::packageVersion("rsformat"),
      "rstrap",
      package = "rsformat",
      stylesheet = "rstrap.css",
      script = "rstrap.js",
      all_files = FALSE
    ),
    # this is required so another bootstrap deps is not used.
    # this is to trick htmltools::resolveDependencies() in keeping this dummy one.
    htmltools::htmlDependency(
      "bootstrap",
      "99999.0.0",
      tempdir(),
      all_files = FALSE
    )
  )
}

#' HTML document format with a slim Bootstrap 4-derived theme
#'
#' A substitute for the [rmarkdown::html_document()] format which uses a slimmed
#' down version of Bootstrap 4. All arguments below behave the same as their
#' [rmarkdown::html_document()] equivalents.
#'
#' @inheritParams rmarkdown::html_document
#'
#' @seealso rmarkdown::html_document
#'
#' @export
rstrap_document <- function(toc = FALSE,
  toc_depth = 3,
  toc_float = FALSE,
  number_sections = FALSE,
  section_divs = TRUE,
  fig_width = 7,
  fig_height = 5,
  fig_retina = 2,
  fig_caption = TRUE,
  dev = "png",
  df_print = "default",
  code_folding = c("none", "show", "hide"),
  code_download = FALSE,
  smart = TRUE,
  self_contained = TRUE,
  theme = NULL,
  highlight = "default",
  mathjax = "default",
  template = "default",
  extra_dependencies = NULL,
  css = NULL,
  includes = NULL,
  keep_md = FALSE,
  lib_dir = NULL,
  md_extensions = NULL,
  pandoc_args = NULL,
  ...
) {

  if (!is.null(theme)) {
    stop(call. = FALSE,
      "The `rstrap_document` output format does not support the ",
      "`theme` argument"
    )
  }

  extra_dependencies <- c(
    html_dependencies_rstrap(),
    extra_dependencies
  )

  rmarkdown::html_document(
    theme = list(version = 4),
    toc = toc,
    toc_depth = toc_depth,
    toc_float = toc_float,
    number_sections = number_sections,
    section_divs = section_divs,
    fig_width = fig_width,
    fig_height = fig_height,
    fig_retina = fig_retina,
    fig_caption = fig_caption,
    dev = dev,
    df_print = df_print,
    code_folding = code_folding,
    code_download = code_download,
    smart = smart,
    self_contained = self_contained,
    highlight = highlight,
    mathjax = mathjax,
    template = template,
    extra_dependencies = extra_dependencies,
    css = css,
    includes = includes,
    keep_md = keep_md,
    lib_dir = lib_dir,
    md_extensions = md_extensions,
    pandoc_args = pandoc_args,
    ...
  )
}
