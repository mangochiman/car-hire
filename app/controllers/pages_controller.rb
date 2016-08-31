class PagesController < ApplicationController
  def home
    @title = "Bantu Motors - Home"
    @email = Setting.find_by_key('email').value rescue ''
    @office_phone = Setting.find_by_key('office_phone').value rescue ''
    @postal_address = Setting.find_by_key('postal_address').value rescue ''
    @strengths = Setting.find_by_key('strengths').value rescue ''
    @fax = Setting.find_by_key('fax').value rescue ''
    @company_description = Page.find_by_page_type('company_description').content rescue ''
    @media = Car.all
    render :layout => "main"
  end

  def our_services
    @title = "Bantu Motors- Our Services"
    @our_services_page = Page.find_by_page_type('our_services')
    @email = Setting.find_by_key('email').value rescue ''
    @office_phone = Setting.find_by_key('office_phone').value rescue ''
    @postal_address = Setting.find_by_key('postal_address').value rescue ''
    @strengths = Setting.find_by_key('strengths').value rescue ''
    @fax = Setting.find_by_key('fax').value rescue ''
    @company_description = Page.find_by_page_type('company_description').content rescue ''
    @media = Car.all
    render :layout => "main"
  end

  def about_us
    @title = "Bantu Motors- About Us"
    @about_us_page = Page.find_by_page_type('about_us')
    @email = Setting.find_by_key('email').value rescue ''
    @office_phone = Setting.find_by_key('office_phone').value rescue ''
    @postal_address = Setting.find_by_key('postal_address').value rescue ''
    @strengths = Setting.find_by_key('strengths').value rescue ''
    @fax = Setting.find_by_key('fax').value rescue ''
    @company_description = Page.find_by_page_type('company_description').content rescue ''
    @media = Car.all
    render :layout => "main"
  end

  def our_mission
    @title = "Bantu Motors- Our Mission"
    @our_mission_page = Page.find_by_page_type('our_mission')
    @email = Setting.find_by_key('email').value rescue ''
    @office_phone = Setting.find_by_key('office_phone').value rescue ''
    @postal_address = Setting.find_by_key('postal_address').value rescue ''
    @strengths = Setting.find_by_key('strengths').value rescue ''
    @fax = Setting.find_by_key('fax').value rescue ''
    @company_description = Page.find_by_page_type('company_description').content rescue ''
    @media = Car.all
    render :layout => "main"
  end

  def gallery
    @title = "Bantu Motors- Gallery"
    @email = Setting.find_by_key('email').value rescue ''
    @office_phone = Setting.find_by_key('office_phone').value rescue ''
    @postal_address = Setting.find_by_key('postal_address').value rescue ''
    @strengths = Setting.find_by_key('strengths').value rescue ''
    @fax = Setting.find_by_key('fax').value rescue ''
    @company_description = Page.find_by_page_type('company_description').content rescue ''
    @media = Car.all
    render :layout => "main"
  end

  def contact_us
    @title = "Bantu Motors- Contact Us"
    @contact_us_page = Page.find_by_page_type('contact_us')
    @email = Setting.find_by_key('email').value rescue ''
    @office_phone = Setting.find_by_key('office_phone').value rescue ''
    @postal_address = Setting.find_by_key('postal_address').value rescue ''
    @strengths = Setting.find_by_key('strengths').value rescue ''
    @fax = Setting.find_by_key('fax').value rescue ''
    @company_description = Page.find_by_page_type('company_description').content rescue ''
    @media = Car.all
    render :layout => "main"
  end

  def bookings
    @title = "Bantu Motors- Bookings"
    @selected_car = Car.find(params[:car_id])
    @email = Setting.find_by_key('email').value rescue ''
    @office_phone = Setting.find_by_key('office_phone').value rescue ''
    @postal_address = Setting.find_by_key('postal_address').value rescue ''
    @strengths = Setting.find_by_key('strengths').value rescue ''
    @fax = Setting.find_by_key('fax').value rescue ''
    @company_description = Page.find_by_page_type('company_description').content rescue ''
    @media = Car.find(:all, :conditions => ["car_id != ?", params[:car_id]])
    render :layout => "main"
  end

  def create_bookings
    booking = Booking.new
    booking.car_id = params[:car_id]
    booking.first_name = params[:first_name]
    booking.last_name = params[:last_name]
    booking.email = params[:email]
    booking.secret_code = params[:secret_code]
    booking.phone = params[:phone]
    booking.start_date = params[:start_date]
    booking.end_date = params[:end_date]
    booking.save
    flash[:notice]= "Thanks for booking with us. We will call you within 24 hrs to confirm your booking"
    redirect_to("/") and return
  end

  def search_bookings
    @title = "Bantu Motors- Search"
    @email = Setting.find_by_key('email').value rescue ''
    @office_phone = Setting.find_by_key('office_phone').value rescue ''
    @postal_address = Setting.find_by_key('postal_address').value rescue ''
    @strengths = Setting.find_by_key('strengths').value rescue ''
    @fax = Setting.find_by_key('fax').value rescue ''
    @company_description = Page.find_by_page_type('company_description').content rescue ''
    @media = Car.all
    render :layout => "main"
  end

  def search_booking_results
    @title = "Bantu Motors- Search Results"
    email = params[:email]
    secret_code = params[:secret_code]

    @search_results = Booking.find(:all, :conditions => ["email =? AND secret_code =?",
        email, secret_code])

    @email = Setting.find_by_key('email').value rescue ''
    @office_phone = Setting.find_by_key('office_phone').value rescue ''
    @postal_address = Setting.find_by_key('postal_address').value rescue ''
    @strengths = Setting.find_by_key('strengths').value rescue ''
    @fax = Setting.find_by_key('fax').value rescue ''
    @company_description = Page.find_by_page_type('company_description').content rescue ''
    @media = Car.all

    render :layout => "main"
  end

  def edit_bookings
    @title = "Bantu Motors- Edit Bookings"
    @booking_id = params[:booking_id]
    @booking = Booking.find(params[:booking_id])
    @selected_car = Booking.find(params[:booking_id]).car
    @email = Setting.find_by_key('email').value rescue ''
    @office_phone = Setting.find_by_key('office_phone').value rescue ''
    @postal_address = Setting.find_by_key('postal_address').value rescue ''
    @strengths = Setting.find_by_key('strengths').value rescue ''
    @fax = Setting.find_by_key('fax').value rescue ''
    @company_description = Page.find_by_page_type('company_description').content rescue ''
    @media = Car.find(:all, :conditions => ["car_id != ?", @selected_car.car_id])
    render :layout => "main"
  end

  def process_edit_bookings
    booking = Booking.find(params[:booking_id])
    booking.car_id = params[:car_id]
    booking.email = params[:email]
    booking.secret_code = params[:secret_code]
    booking.phone = params[:phone]
    booking.start_date = params[:start_date]
    booking.end_date = params[:end_date]
    booking.save
    
    flash[:notice] = "You have successfully made your changes"
    redirect_to("/") and return
  end

  def damage_and_management_policy
    @title = "Bantu Motors- Damage and Management Policy"
    @email = Setting.find_by_key('email').value rescue ''
    @office_phone = Setting.find_by_key('office_phone').value rescue ''
    @postal_address = Setting.find_by_key('postal_address').value rescue ''
    @strengths = Setting.find_by_key('strengths').value rescue ''
    @fax = Setting.find_by_key('fax').value rescue ''
    @company_description = Page.find_by_page_type('company_description').content rescue ''
    @media = Car.all

    @damage_and_management_policy_page = Page.find_by_page_type('damage_and_management_policy')
    render :layout => "main"
  end

  def deposit_policy
    @title = "Bantu Motors- Deposit Policy"
    @email = Setting.find_by_key('email').value rescue ''
    @office_phone = Setting.find_by_key('office_phone').value rescue ''
    @postal_address = Setting.find_by_key('postal_address').value rescue ''
    @strengths = Setting.find_by_key('strengths').value rescue ''
    @fax = Setting.find_by_key('fax').value rescue ''
    @company_description = Page.find_by_page_type('company_description').content rescue ''
    @media = Car.all

    @deposit_policy_page = Page.find_by_page_type('deposit_policy')
    render :layout => "main"
  end

  def protection_package_details
    @title = "Bantu Motors- Protection Package Details"
    @email = Setting.find_by_key('email').value rescue ''
    @office_phone = Setting.find_by_key('office_phone').value rescue ''
    @postal_address = Setting.find_by_key('postal_address').value rescue ''
    @strengths = Setting.find_by_key('strengths').value rescue ''
    @fax = Setting.find_by_key('fax').value rescue ''
    @company_description = Page.find_by_page_type('company_description').content rescue ''
    @media = Car.all

    @protection_package_details_page = Page.find_by_page_type('protection_package_details')
    render :layout => "main"
  end

  def security_and_privacy_policy
    @title = "Bantu Motors- Security and Privacy Policy"
    @email = Setting.find_by_key('email').value rescue ''
    @office_phone = Setting.find_by_key('office_phone').value rescue ''
    @postal_address = Setting.find_by_key('postal_address').value rescue ''
    @strengths = Setting.find_by_key('strengths').value rescue ''
    @fax = Setting.find_by_key('fax').value rescue ''
    @company_description = Page.find_by_page_type('company_description').content rescue ''
    @media = Car.all

    @security_and_privacy_policy_page = Page.find_by_page_type('security_and_privacy_policy')
    render :layout => "main"
  end

  def terms_and_conditions
    @title = "Bantu Motors- Terms and Conditions"
    @email = Setting.find_by_key('email').value rescue ''
    @office_phone = Setting.find_by_key('office_phone').value rescue ''
    @postal_address = Setting.find_by_key('postal_address').value rescue ''
    @strengths = Setting.find_by_key('strengths').value rescue ''
    @fax = Setting.find_by_key('fax').value rescue ''
    @company_description = Page.find_by_page_type('company_description').content rescue ''
    @media = Car.all

    @terms_and_conditions_page = Page.find_by_page_type('terms_and_conditions')
    render :layout => "main"
  end

  def cancel_booking
    booking = Booking.find(params[:booking_id])
    booking.voided = true
    booking.voided_by = booking.email
    booking.save

    redirect_to("/search_bookings") and return
  end
  
end
