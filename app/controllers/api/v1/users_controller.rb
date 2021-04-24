module Api
  module V1
    class UsersController < ApplicationController
      def index
        @users = User.all
        @total_users = @users.size
        @users = @users.page(params[:page] || 1).per(params[:per_page] || 10)

        render json: @users, meta: { total_pages: @users.total_pages, total_users: @total_users }
      end
    end
  end
end