test_that("est_table stays aligned with grouped rows", {
  df <- data.frame(
    name = c("A", "A", "B"),
    grp = c("g1", "g2", "g2"),
    estimate = c(0.10, 0.20, 0.30),
    se = c(0.01, 0.01, 0.01),
    stringsAsFactors = FALSE
  )

  p <- forestplot(
    df = df,
    name = name,
    estimate = estimate,
    se = se,
    colour = grp,
    est_table = TRUE
  )

  effect_layer <- which(vapply(
    p$layers,
    function(layer) inherits(layer$geom, "GeomEffect"),
    logical(1L)
  ))
  text_layer <- which(vapply(
    p$layers,
    function(layer) inherits(layer$geom, "GeomText"),
    logical(1L)
  ))
  expect_length(effect_layer, 1L)
  expect_length(text_layer, 1L)

  built <- ggplot2::ggplot_build(p)
  effect_data <- built$data[[effect_layer]][, c("group", "y")]
  text_data <- built$data[[text_layer]][, c("group", "y")]
  effect_data <- effect_data[order(effect_data$group, effect_data$y), , drop = FALSE]
  text_data <- text_data[order(text_data$group, text_data$y), , drop = FALSE]

  expect_equal(text_data$group, effect_data$group)
  expect_equal(text_data$y, effect_data$y)
})

test_that("est_table keeps original row positions without grouped rows", {
  df <- data.frame(
    name = c("A", "B", "C"),
    estimate = c(0.10, 0.20, 0.30),
    se = c(0.01, 0.01, 0.01),
    stringsAsFactors = FALSE
  )

  p <- forestplot(
    df = df,
    name = name,
    estimate = estimate,
    se = se,
    est_table = TRUE
  )

  effect_layer <- which(vapply(
    p$layers,
    function(layer) inherits(layer$geom, "GeomEffect"),
    logical(1L)
  ))
  text_layer <- which(vapply(
    p$layers,
    function(layer) inherits(layer$geom, "GeomText"),
    logical(1L)
  ))
  expect_length(effect_layer, 1L)
  expect_length(text_layer, 1L)

  built <- ggplot2::ggplot_build(p)
  effect_data <- built$data[[effect_layer]][, "y", drop = TRUE]
  text_data <- built$data[[text_layer]][, "y", drop = TRUE]

  expect_equal(text_data, effect_data)
})
