# rsformat

<!-- badges: start -->
<!-- badges: end -->

Provides a document format similar to rmarkdown::html_document but
with a slimmed-down Bootstrap derivative instead of the real thing.

## Installation

``` r
remotes::install_github("rstudio/rsformat")
```

## Usage

In your .Rmd document, specify `rsformat::rstrap_document` as your `output`:
    
    ---
    title: My Great R Markdown Document
    output: rsformat::rstrap_document
    ---

The options available to `rstrap_document` are essentially the same as for
`rmarkdown::html_document`, except that the `theme` argument is not respected.
