class PagesController < ApplicationController
  def home
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

end
