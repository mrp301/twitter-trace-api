module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: [:show]

      def index
        users = User.order(created_at: :desc)
        render status: 200, json: { status: 200, data: users }
      end

      #   /api/v1/users/:id(.:format) 
      def show 
        render status: 200, json: { status: 200, data: @user }
      end

      private

      def set_user
        @user = User.find(params[:id])
      end

      def set_uset_tweet
        @user_tweet = User.find_by(userId: 'aoba')
      end
    end
  end
end