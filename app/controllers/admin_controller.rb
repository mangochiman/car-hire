class AdminController < ApplicationController
  def home
    
  end

  def our_services
    @our_services_page = Page.find_by_type('our_services')
    render :layout => "admin"
  end

  def our_mission
    @our_mission_page = Page.find_by_type('our_mission')
    render :layout => "admin"
  end

  def about_us
    @about_us_page = Page.find_by_type('about_us')
    render :layout => "admin"
  end

  def contact_us
    @contact_us_page = Page.find_by_type('contact_us')
    render :layout => "admin"
  end
  
end
