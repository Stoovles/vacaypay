class Users::DwollasController < ApplicationController
  def new
  end

  def create
    token = dwolla_token
    response = dwolla_customer_location(token)
    current_user.update(dwolla_id: response.response_headers[:location])
    redirect_to funding_source_path(current_user)
  end

  private

  def dwolla_customer_location(token)
    @_customer_location ||= dwolla_customer_service(token).create_verified_user
  end

  def dwolla_token
    @_dwolla_token ||= dwolla_oauth_service.application_token
  end

  def dwolla_oauth_service
    @_oauth_service ||= DwollaOauthService.new
  end

  def dwolla_customer_service(token)
    @_customer_service ||= DwollaCustomerService.new(current_user, user_params, token)
  end

  def user_params
    params.permit(:address, :city, :state, :postal_code, :dob, :ssn)
  end
end
