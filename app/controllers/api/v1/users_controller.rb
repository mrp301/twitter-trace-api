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
        @user = User.find(params[:id])
        render :json => @user
      end

      def timeline
        user_id = params[:id].to_i
        ids = User.find(user_id).follows.pluck(:follow_uesr_id) << user_id
        tweets = Tweet.where('user_id': ids).order(created_at: "DESC").to_json(:include => :user)
        render :json => tweets
      end

      def follow_tweets
        users = User.find(params[:id]).follows_tweets.order(created_at: "DESC").to_json(:include => :user)
        render :json => tweets
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