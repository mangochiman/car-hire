require 'RMagick'
include Magick

class AdminController < ApplicationController
  before_filter :authenticate_user
  
  def home
    @bookings = Booking.all
  end

  def our_services
    @our_services_page = Page.find_by_page_type('our_services')
    @bookings = Booking.all
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
    @bookings = Booking.all
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
    @bookings = Booking.all
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
    @bookings = Booking.all
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

  def gallery
    @media = Car.all
    @bookings = Booking.all
  end
  
  def create_gallery
    car_image = params[:car_image]

    File.open(Rails.root.join('public', 'uploads', car_image.original_filename), 'wb') do |file|
      file.write(car_image.read)
    end
    
    car = Car.new()
    car.name = params[:car_name]
    car.engine_size = params[:engine_size]
    car.seats = params[:total_seats]
    car.description = params[:description]
    car.path = "/uploads/#{car_image.original_filename}"
    car.alt = car_image.original_filename
    car.save

    file_path = Rails.root.to_s + '/public' +  car.path
    front_file_name = "#{car.car_id}-front.png"
    thumb_file_name = "#{car.car_id}-thumb.png"

    new_front_file_path = Rails.root.to_s + '/public/uploads/' +  front_file_name
    new_thumb_file_path = Rails.root.to_s + '/public/uploads/' +  thumb_file_name

    Kernel.system "convert #{file_path} -resize 618x246! #{new_front_file_path}" #front Image
    Kernel.system "convert #{file_path} -resize 228x168! #{new_thumb_file_path}" #Thumbnail Image
    
    redirect_to("/admin/gallery") and return
  end

  def delete_media
    car = Car.find(params[:car_id])
    file_path = Rails.root.to_s + '/public' +  car.path
    File.delete(file_path) if File.exist?(file_path)
    car.delete
    redirect_to("/admin/gallery") and return
  end

  def settings
    @email = Setting.find_by_key('email').value rescue ''
    @office_phone = Setting.find_by_key('office_phone').value rescue ''
    @postal_address = Setting.find_by_key('postal_address').value rescue ''
    @strengths = Setting.find_by_key('strengths').value rescue ''
    @bookings = Booking.all
    render :layout => "admin"
  end

  def create_settings
    email = Setting.find_by_key('email')
    office_phone = Setting.find_by_key('office_phone')
    fax = Setting.find_by_key('fax')
    postal_address = Setting.find_by_key('postal_address')
    strengths = Setting.find_by_key('strengths')

    if email.blank?
      email = Setting.new()
      email.key = 'email'
    end

    if office_phone.blank?
      office_phone = Setting.new()
      office_phone.key = 'office_phone'
    end

    if fax.blank?
      fax = Setting.new()
      fax.key = 'fax'
    end
    if postal_address.blank?
      postal_address = Setting.new()
      postal_address.key = 'postal_address'
    end

    if strengths.blank?
      strengths = Setting.new()
      strengths.key = 'strengths'
    end

    email.value = params[:email]
    office_phone.value = params[:office_phone]
    postal_address.value = params[:postal_address]
    strengths.value = params[:strengths]

    email.save
    office_phone.save
    fax.save
    postal_address.save
    strengths.save

    redirect_to("/admin/settings") and return
  end

  def company_description
    @company_description = Page.find_by_page_type('company_description')
    @bookings = Booking.all
  end

  def create_company_description
    company_description_page = Page.find_by_page_type('company_description')

    if company_description_page.blank?
      company_description_page = Page.new()
      company_description_page.page_type = 'company_description'
    end

    company_description_page.content = params[:content]
    company_description_page.save

    redirect_to("/admin/company_description") and return
  end

  def damage_and_management_policy
    @damage_and_management_policy_page = Page.find_by_page_type('damage_and_management_policy')
    @bookings = Booking.all
  end

  def create_damage_and_management_policy
    damage_and_management_policy_page = Page.find_by_page_type('damage_and_management_policy')

    if damage_and_management_policy_page.blank?
      damage_and_management_policy_page = Page.new()
      damage_and_management_policy_page.page_type = 'damage_and_management_policy'
    end

    damage_and_management_policy_page.content = params[:content]
    damage_and_management_policy_page.save

    redirect_to("/admin/damage_and_management_policy") and return
  end

  def deposit_policy
    @deposit_policy_page = Page.find_by_page_type('deposit_policy')
    @bookings = Booking.all
  end

  def create_deposit_policy
    deposit_policy_page = Page.find_by_page_type('deposit_policy')

    if deposit_policy_page.blank?
      deposit_policy_page = Page.new()
      deposit_policy_page.page_type = 'deposit_policy'
    end

    deposit_policy_page.content = params[:content]
    deposit_policy_page.save

    redirect_to("/admin/deposit_policy") and return
  end

  def protection_package_details
    @protection_package_details_page = Page.find_by_page_type('protection_package_details')
    @bookings = Booking.all
  end

  def create_protection_package_details
    protection_package_details_page = Page.find_by_page_type('protection_package_details')

    if protection_package_details_page.blank?
      protection_package_details_page = Page.new()
      protection_package_details_page.page_type = 'protection_package_details'
    end

    protection_package_details_page.content = params[:content]
    protection_package_details_page.save

    redirect_to("/admin/protection_package_details") and return
  end

  def security_and_privacy_policy
    @security_and_privacy_policy_page = Page.find_by_page_type('security_and_privacy_policy')
    @bookings = Booking.all
  end

  def create_security_and_privacy_policy
    security_and_privacy_policy_page = Page.find_by_page_type('security_and_privacy_policy')

    if security_and_privacy_policy_page.blank?
      security_and_privacy_policy_page = Page.new()
      security_and_privacy_policy_page.page_type = 'security_and_privacy_policy'
    end

    security_and_privacy_policy_page.content = params[:content]
    security_and_privacy_policy_page.save

    redirect_to("/admin/security_and_privacy_policy") and return
  end

  def terms_and_conditions
    @terms_and_conditions_page = Page.find_by_page_type('terms_and_conditions')
    @bookings = Booking.all
  end

  def create_terms_and_conditions
    terms_and_conditions_page = Page.find_by_page_type('terms_and_conditions')

    if terms_and_conditions_page.blank?
      terms_and_conditions_page = Page.new()
      terms_and_conditions_page.page_type = 'terms_and_conditions'
    end

    terms_and_conditions_page.content = params[:content]
    terms_and_conditions_page.save

    redirect_to("/admin/terms_and_conditions") and return
  end

  def archive_booking
    booking = Booking.find(params[:booking_id])
    booking.voided = true
    booking.voided_by = User.find(session[:current_user_id]).username
    booking.save

    redirect_to("/admin") and return
  end

end
