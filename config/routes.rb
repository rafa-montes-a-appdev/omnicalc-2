Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get("/add", { :controller => "application", :action => "add_blank"  })
  get("/wizard_add", { :controller => "application", :action => "add_calc"})

  get("/subtract", { :controller => "application", :action => "subtract_blank"  })
  get("/wizard_subtract", { :controller => "application", :action => "subtract_calc"})

  get("/multiply", { :controller => "application", :action => "multiply_blank"  })
  get("/wizard_multiply", { :controller => "application", :action => "multiply_calc"})

  get("/divide", { :controller => "application", :action => "divide_blank"  })
  get("/wizard_divide", { :controller => "application", :action => "divide_calc"})

  get("/street_to_coords/new", { :controller => "streetcoord", :action => "street_blank"})
  get("/street_to_coords/results", { :controller => "streetcoord", :action => "street_calc"})

  get("/coords_to_weather/new", { :controller => "streetcoord", :action => "coords_blank" })
  get("/coords_to_weather/results", { :controller => "streetcoord", :action => "coords_calc" })

  #get("/street_to_weather/new", { :controller => "streetcoord", :action => "weather_blank" })
  #get("/street_to_weather/results", { :controller => "streetcoord", :action => "weather_calc" })

end
