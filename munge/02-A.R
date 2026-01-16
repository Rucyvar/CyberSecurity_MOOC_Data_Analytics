# -----------------------
# Cycle 1 Pre-processing
# -----------------------

# Identify datasets loaded by ProjectTemplate
video_names <- ls(pattern = '_video.stats$')
question_names <- ls(pattern = '_question.response$')
archetype_names<- ls(pattern = '_archetype.survey.responses$')


# Combine Question Response
question_response_all <- purrr::imap_dfr(
  question_names,
  function(name, idx) {
    get(name) %>%
      dplyr::mutate(
        run_id = stringr::str_extract(name, "\\d+")
      )
  }
)

#combine Archetype survey response
archetype_all <- purrr::imap_dfr(
  archetype_names,
  function(name, idx) {
    get(name) %>%
      dplyr::mutate(
        dplyr::across(everything(), as.character),
        run_id = stringr::str_extract(name, "\\d+")
      )
  }
)

# learner-level active engagemnet summary
question_summary <- question_response_all %>%
  dplyr::mutate(
    correct = as.numeric(correct)
  ) %>%
  dplyr::group_by(learner_id, run_id) %>%
  dplyr::summarise(
    questions_attempted = dplyr::n(),
    questions_correct   = sum(correct, na.rm = TRUE),
    .groups = "drop"
  )

#Attach learner archetypes
cycle2_munged <- question_summary %>%
  dplyr::left_join(
    archetype_all %>%
      dplyr::select(learner_id, run_id, archetype),
    by = c("learner_id", "run_id")
  )

#handle missing archtypes
cycle2_munged <- cycle2_munged %>%
  dplyr::mutate(
    archetype = tidyr::replace_na(archetype, "Unclassified")
  )

#store Final learner-level dataset in cache 
cache("cycle2_munged")

##combine video stats by runs and store to cache
video_context <- purrr::imap_dfr(
  video_names,
  function(name, idx) {
    get(name) %>%
      dplyr::mutate(
        run_id = stringr::str_extract(name, "\\d+")
      )
  }
)

cache("video_context")

