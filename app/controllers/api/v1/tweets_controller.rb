module Api
    module V1
      class TweetsController < ApplicationController
  
        def index
          tweets = Tweet.order(created_at: :desc)
          render json: { status: 'success', data: tweets }
        end

      #   /api/v1/tweets/:id(.:format) 
      def show
        tweets = Tweet.where('user_id': params[:id]).to_json(:include => :user)
        render :json => tweets
      end
  
        private
  
      end
    end
  end