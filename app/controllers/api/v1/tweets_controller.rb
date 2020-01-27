module Api
    module V1
      class TweetsController < ApplicationController
  
        def index
          tweets = Tweet.order(created_at: :asc)
          render json: { status: 'success', data: tweets }
        end

      #  GET  /api/v1/tweets/:id(.:format)
      def show
        get_tweets(params[:id])
        render :json => @tweets
      end

      #  POST  /api/v1/tweets(.:format)
      def create
        @tweet = Tweet.new(tweet_params)
        if @tweet.save
          get_tweets(params[:id])
          render :json => @tweets
        else
          render json: { status: 'ERROR', data: post.errors }
        end
      end
  
        private

        def get_tweets(userId)
          @tweets = Tweet.where('user_id': userId).order(created_at: "DESC").to_json(:include => :user)
        end

        def tweet_params
          params.require(:tweet).permit(:user_id, :content)
        end
      end
    end
  end