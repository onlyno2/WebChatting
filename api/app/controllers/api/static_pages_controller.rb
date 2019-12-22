module Api
  class StaticPagesController < ApplicationController
    def contact
      ContactMailer.contact_mail(contact_params).deliver_now
      success_response('Send success')
    rescue StandardError
      error_response('Send fail', :bad_request)
    end

    private

    def contact_params
      params.permit(:name, :email, :content)
    end
  end
end
