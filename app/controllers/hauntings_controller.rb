class HauntingsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_invalid
    def index
        render json: Haunting.all
    end

    def create
        haunting = Haunting.create!(params_haunting)
        render json: haunting, status: :created
    end

    private

    def params_haunting
        params.permit(:haunted_house_id, :ghost_id)
    end

    def render_invalid(invalid)
        render json: {errors: ErrorMessageSerializer.error_messages(invalid.record.errors)}, status: :unprocessable_entity
    end

end
