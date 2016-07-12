class PagesController < ApplicationController
  def home
    
  end

  def our_services
    @our_services_page = Page.find_by_page_type('our_services')
  end

  def about_us
    @about_us_page = Page.find_by_page_type('about_us')
  end

  def our_mission
    @our_mission_page = Page.find_by_page_type('our_mission')
  end

  def gallery

  end

  def contact_us
    @contact_us_page = Page.find_by_page_type('contact_us')
  end
  
end
