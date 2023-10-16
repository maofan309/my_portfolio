# Define the possible pizza sizes, crusts, and toppings
pizza_sizes <- c("small", "medium", "large")
pizza_crusts <- c("thin", "thick", "hand-tossed")
pizza_toppings <- c("pepperoni", "mushrooms", "onions", "sausage", "olives")

# Create a function to get the pizza order
get_pizza_order <- function() {

  # Prompt the user to select the pizza size
  pizza_size <- readLines(
    "What size pizza would you like? (small, medium, large): "
  )

  # Validate the pizza size
  while (!pizza_size %in% pizza_sizes) {
    pizza_size <- readLines(
      "Please enter a valid pizza size: "
    )
  }

  # Prompt the user to select the pizza crust
  pizza_crust <- readLines(
    "What type of crust would you like? (thin, thick, hand-tossed): "
  )

  # Validate the pizza crust
  while (!pizza_crust %in% pizza_crusts) {
    pizza_crust <- readLines(
      "Please enter a valid pizza crust: "
    )
  }

  # Prompt the user to select the pizza toppings
  pizza_toppings <- readLines(
    "What toppings would you like? (pepperoni, mushrooms, onions, sausage, olives): "
  )

  # Validate the pizza toppings
  while (!all(pizza_toppings %in% pizza_toppings)) {
    pizza_toppings <- readLines(
      "Please enter valid pizza toppings: "
    )
  }

  # Return the pizza order
  return(list(size = pizza_size, crust = pizza_crust, toppings = pizza_toppings))
}

# Create a function to place the pizza order
place_pizza_order <- function(pizza_order) {

  # Print the pizza order
  print(paste("Your pizza order has been placed:", pizza_order))

  # Send the pizza order to the pizzeria
  # ...
}

# Get the pizza order
pizza_order <- get_pizza_order()

# Place the pizza order
place_pizza_order(pizza_order)



