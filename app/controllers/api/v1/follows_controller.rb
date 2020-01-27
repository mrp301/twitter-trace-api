module Api
    module V1
      class FollowsController < ApplicationController
  
        def index
          follows = Follow.order(created_at: :desc)
          render :json => follows
        end

        #  GET  /api/v1/follows/:id(.:format)
        def show
          #   follows = Follow.joins(:user).select('users.*').where('user_id': params[:id]).order(created_at: "DESC")
          ids = User.find(params[:id]).follows.pluck(:follow_uesr_id)
          follows = User.where('id': User.find(params[:id]).follows.pluck(:follow_uesr_id)).order(created_at: "DESC")
          followers = Follow.joins(:user).select('users.*').where('follow_uesr_id': params[:id]).order(created_at: "DESC")
          render json: { 'follows': follows, 'followers': followers }
        end

        def followers
          follows = Follow.where('follow_uesr_id': params[:id]).order(created_at: "DESC")
          render :json => follows
        end
  
        def create
          post = Post.new(post_params)
          if post.save
            render json: { status: 'SUCCESS', data: post }
          else
            render json: { status: 'ERROR', data: post.errors }
          end
        end
  
        def destroy
          follow = Follow.find(params[:id])
          if follow.destroy
            render json: { status: 'SUCCESS', message: 'Deleted the followUser', data: follow }
          else
            render json: { status: 'ERROR', data: post.errors }
          end
        end
  
        def update
          if @post.update(post_params)
            render json: { status: 'SUCCESS', message: 'Updated the post', data: @post }
          else
            render json: { status: 'SUCCESS', message: 'Not updated', data: @post.errors }
          end
        end
  
        private
  
        def get_follows(userId)
          @follows = Follow.where()
        end
      end
    end
  end