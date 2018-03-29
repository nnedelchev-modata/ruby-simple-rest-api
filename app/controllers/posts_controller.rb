class PostsController < ApplicationController
    before_action :set_post, only: [:show, :update, :destroy]
    def index
        @posts = Post.order("id DESC")

        render json: @posts
    end

    def show
        render json: @post
    end

    def create
        @post = Post.new(post_params)

        if @post.save
            render json: @post, status: :created, location: @post
        else
            render json: @post.errors, status: :unprocessable_entity
        end
    end

    private
        def set_post
            @post = Post.find(params[:id])
        end

        def post_params
            params.require(:post).permit!
        end
end
