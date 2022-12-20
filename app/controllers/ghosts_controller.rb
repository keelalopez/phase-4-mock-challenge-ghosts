class GhostsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :not_found

    def index
        render json: Ghost.all
    end

    def show
        ghost = find_ghost
        render json: ghost, serializer: GhostShowSerializer
    end

    def destroy
        ghost = find_ghost
        ghost.destroy
        head :no_content
    end

    private

    def not_found
        render json: {error: "Ghost not found"}, status: :not_found
    end

    def find_ghost
        Ghost.find(params[:id])
    end
end
