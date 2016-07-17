class PagesController < ApplicationController
  def home
    @email = Setting.find_by_key('email').value rescue ''
    @office_phone = Setting.find_by_key('office_phone').value rescue ''
    @postal_address = Setting.find_by_key('postal_address').value rescue ''
    @strengths = Setting.find_by_key('strengths').value rescue ''
    @fax = Setting.find_by_key('fax').value rescue ''
    @company_description = Page.find_by_page_type('company_description').content rescue ''
    @media = Car.all
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
