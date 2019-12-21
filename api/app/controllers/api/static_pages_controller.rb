module Api
class StaticPagesController < ApplicationController
    def contact
        begin
            ContactMailer.contact_mail(contact_params).deliver_now
            success_response('Send success')
        rescue
            error_response('Send fail', :bad_request)
        end
    end

    private

    def contact_params
        params.permit(:name, :email, :content)
    end
end
end
