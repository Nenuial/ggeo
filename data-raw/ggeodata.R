ggeodata <- list(
  themes = list(
    main = list(
      text = list(
        size = 24,
        face = "plain",
        family = "Avenir Next"
      ),
      title = list(
        size = 28,
        face = "bold",
        family = "DINAlternate-Bold"
      )
    ),
    plot = list(
      title = list(
        size = 72,
        face = "bold",
        family = "DINCondensed-Bold"
      ),
      subtitle = list(
        size = 32,
        face = "bold",
        family = "DINAlternate-Bold"
      ),
      caption = list(
        size = 18,
        face = "italic",
        family = "Avenir Next"
      )
    ),

    main_oc = list(
      text = list(
        size = 11,
        face = "plain",
        family = "Helvetica"
      ),
      title = list(
        size = 11,
        face = "plain",
        family = "Helvetica"
      )
    ),
    plot_oc = list(
      title = list(
        size = 14,
        face = "bold",
        family = "Helvetica"
      ),
      subtitle = list(
        size = 12,
        face = "plain",
        family = "Helvetica"
      ),
      caption = list(
        size = 8,
        face = "italic",
        family = "Helvetica"
      )
    ),

    nord_blue = list(
      light = list(
        text = "#4c566a",
        title = "#4f93b8",
        line = "#3b4457",
        grid = "#eddaeb"
      ),
      dark = list(
        text = "#eddaeb",
        title = "#4f93b8",
        line = "#eddaeb",
        grid = "#3b4457"
      )
    ),

    ghibli_mononoke = list(
      light = list(
        text = "#762b19",
        title = "#e78a40",
        line = "#69261e",
        grid = "#ebd799"
      ),
      dark = list(
        text = "#ebd799",
        title = "#e78a40",
        line = "#ebd799",
        grid = "#8891aa"
      )
    ),

    pomological_green = list(
      light = list(
        text = "#2b323f",
        title = "#909c4d",
        line = "#b3b3b3",
        grid = "#d8d9d9"
      ),
      dark = list(
        text = "#f7eed1",
        title = "#909c4d",
        line = "#b3b3b3",
        grid = "#818585"
      )
    ),

    pomological_red = list(
      light = list(
        text = "#2b323f",
        title = "#c03729",
        line = "#b3b3b3",
        grid = "#d8d9d9"
      ),
      dark = list(
        text = "#f7eed1",
        title = "#c03729",
        line = "#b3b3b3",
        grid = "#818585"
      )
    ),

    islamic_samarquand = list(
      light = list(
        text = "#a58c60",
        title = "#4c9ac4",
        line = "#475286",
        grid = "#738492"
      ),
      dark = list(
        text = "#cec0a5",
        title = "#4c9ac4",
        line = "#8ec6e9",
        grid = "#b7daec"
      )
    ),

    swiss_red = list(
      light = list(
        text = "#3a3e3f",
        title = "#ff0000",
        line = "#3a3e3f",
        grid = "#3a3e3f"
      ),
      dark = list(
        text = "#b2b3b3",
        title = "#ff0000",
        line = "#b2b3b3",
        grid = "#b2b3b3"
      )
    ),

    oc_exam = list(
      light = list(
        text = "black",
        title = "black",
        line = "black",
        grid = "#696969"
      ),
      dark = list(
        text = "#white",
        title = "white",
        line = "white",
        grid = "#696969"
      )
    )
  )
)

usethis::use_data(ggeodata,
                  internal = TRUE,
                  overwrite = TRUE)
