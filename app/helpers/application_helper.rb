# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def page_keywords
    return "Car Rental, Car Services, Car Hire, Tax in Malawi, Malawi Transport"
  end

  def site_description
    description = "We offer reliable and affordable Car Hire Services in Malawi. Try us and you shall never regret."
    return description
  end

  def author
    return "Hope Mwazozo"
  end
  
end
