<!-- See http://style.tidyverse.org/news.html for advice on writing news -->


# ggforestplot 0.0.1

Initial GitHub release

# ggforestplot 0.0.2

## Minor changes

- Change tick breaks algorithm in `forestplot()` when `logodds = TRUE` with an
example for explicit definition of tick marks.
- Correct typos in vignettes.
- Updates for tidyr 1.0.0
- Updates for dplyr 0.8.3

# ggforestplot 0.1.0

## Changes

- `plot_all_NG_biomarkers()` accepts now layout as an input parameter.
Layout can be one of predefined layouts in `df_grouping_all_NG_biomarkers` or a
user provided `tibble`.
- `forestplot()` takes also x-tick breaks as an input parameter.
- `discovery_regression()` accepts factor predictors. In this case an additional
column with term is returned.
- `df_NG_biomarker_metadata` updated to include new platform biomarkers. `unit`
column is set to "deprecated" since different quantification versions can have
different units. Users interested in plotting their biomarker data should read
units from their own files.
- `df_grouping_all_NG_biomarkers` was updated to contain layouts for 2016 and
2020 Nighitingale Heath Ltd. platforms.
- `df_linear_associations` and `df_logodds_associations` where updated with new
names for some biomarkers.
- `df_demo_metabolomic_data`, `data-raw/metabolomics_data.zip` and the same data
in `vignettes/data` was updated to include new biomarkers.
- Vignettes updated to reflect the number of biomarkers in current 2020 platform,
while `ggforce::facet_col()` is used in examples instead of
`patchwork::wrap_plots()`.

# ggforestplot 0.1.1

## Changes

- Fix `ggforce::facet_col()` compatibility by requiring `ggforce (>= 0.5.0)` and
`ggplot2 (>= 3.4.0)`.
- Replace deprecated `size` aesthetic with `linewidth` in `geom_stripes()`.
- `forestplot()` gains a new `alpha` parameter (default `NULL`). When a number
between 0 and 1 is provided, non-significant entries (determined by `pvalue` and
`psignif`) are drawn semi-transparent at that alpha level in addition to being
shown as hollow points.
- `forestplot()` now accepts multiple column names for the `name` argument via
`name = c(col1, col2, ...)`. When multiple columns are supplied, an internally
unique composite key is built from all columns so that rows sharing the same
first-column value but differing in other columns (e.g. same gene, different
rsid) are placed on separate y-axis rows. Values are formatted and combined into
a table-like label in the y-axis area (monospace font applied automatically for
alignment).
- `forestplot()` gains a new `filled_nonsig` parameter (default `FALSE`). When
`TRUE`, non-significant entries are drawn as filled points rather than hollow;
intended for use with `alpha` so that transparency alone distinguishes
significant from non-significant entries.
- `forestplot()` gains a new `est_table` parameter (default `FALSE`). When
`TRUE`, a monospace-formatted text column is drawn to the right of the plotting
area showing the estimate and confidence interval as `"1.50 (1.25 - 1.75)"`.
For log-odds plots the exponentiated values are displayed. Trailing zeros are
preserved for consistent alignment.
