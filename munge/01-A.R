# ------------------------------------------------------------
# Cycle 1 Pre-processing: Enrolment & Step Activity Data
# ------------------------------------------------------------

# Identify datasets loaded by ProjectTemplate
enrolment_names <- ls(pattern = "enrolments$")
step_names      <- ls(pattern = "step\\.activity$")

# Combine enrollments
enrolments_all <- purrr::map_dfr(
  enrolment_names,
  function(df_name) {
    get(df_name) %>%
      dplyr::mutate(run_id = df_name)
  }
)

# Combine step activity
step_activity_all <- purrr::map_dfr(
  step_names,
  function(df_name) {
    get(df_name) %>%
      dplyr::mutate(run_id = df_name)
  }
)

# Data Cleaning(Remove rows where all values are missing)
enrolments_all_cleaned <- enrolments_all %>%
  dplyr::filter(!dplyr::if_all(dplyr::everything(),is.na))
step_activity_all_cleaned <- step_activity_all %>%
  dplyr::filter(!dplyr::if_all(dplyr::everything(),is.na))

#Summaries enrollment and step activity by course run

enrolment_summary <- enrolments_all_cleaned %>%
  dplyr::group_by(run_id) %>%
  dplyr::summarise(
    total_step_activity = dplyr::n(),
    .groups = 'drop'
  )
step_activity_summary <- step_activity_all_cleaned %>%
  dplyr::group_by(run_id) %>%
  dplyr::summarise(
    total_step_activity = dplyr::n(),
    .groups = 'drop'
  )

engagement_summary <- enrolment_summary %>%
  dplyr::left_join(step_activity_summary, by='run_id')

cache('enrolments_all_cleaned')
cache('step_activity_all_cleaned')
cache('engagement_summary')