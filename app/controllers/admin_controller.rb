class AdminController < ApplicationController
  def home
    
  end

  def our_services
    @our_services_page = Page.find_by_page_type('our_services')
    render :layout => "admin"
  end

  def create_our_services
    our_services_page = Page.find_by_page_type('our_services')
    
    if our_services_page.blank?
      our_services_page = Page.new()
      our_services_page.page_type = 'our_services'
    end

    our_services_page.content = params[:content]
    our_services_page.save
    
    redirect_to("/admin/our_services") and return
  end

  def our_mission
    @our_mission_page = Page.find_by_page_type('our_mission')
    render :layout => "admin"
  end

  def create_our_mission
    our_mission_page = Page.find_by_page_type('our_mission')

    if our_mission_page.blank?
      our_mission_page = Page.new()
      our_mission_page.page_type = 'our_mission'
    end

    our_mission_page.content = params[:content]
    our_mission_page.save

    redirect_to("/admin/our_mission") and return
  end

  def about_us
    @about_us_page = Page.find_by_page_type('about_us')
    render :layout => "admin"
  end

  def create_about_us
    about_us_page = Page.find_by_page_type('about_us')

    if about_us_page.blank?
      about_us_page = Page.new()
      about_us_page.page_type = 'about_us'
    end

    about_us_page.content = params[:content]
    about_us_page.save

    redirect_to("/admin/about_us") and return
  end

  def contact_us
    @contact_us_page = Page.find_by_page_type('contact_us')
    render :layout => "admin"
  end

  def create_contact_us
    contact_us_page = Page.find_by_page_type('contact_us')

    if contact_us_page.blank?
      contact_us_page = Page.new()
      contact_us_page.page_type = 'contact_us'
    end

    contact_us_page.content = params[:content]
    contact_us_page.save

    redirect_to("/admin/contact_us") and return
  end
end
