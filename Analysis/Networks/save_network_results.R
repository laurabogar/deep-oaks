# save network results function

library(tidyverse)
library(NetCoMi)

# Helper function to save networks using tidyverse logic
save_network_results <- function(net_list, path = "Class_Network_Data") {
  if (!dir.exists(path)) dir.create(path)
  
  # iwalk iterates over the list and its names simultaneously
  net_list %>% 
    purrr::iwalk(~{
      file_out <- file.path(path, paste0(.y, ".rds"))
      saveRDS(.x, file = file_out, compress = "xz")
      message("Saved: ", file_out)
    })
}

# Example usage for your DNA comparison:
# net_list_to_save <- list("Living_Oak" = net_liv_analyzed, "Dead_Oak" = net_ded_analyzed)
# save_network_results(net_list_to_save)