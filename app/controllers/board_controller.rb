class BoardController < ApplicationController
    def index
        @post_list = Post.all
    end
    
    def new
    end
    
    def create
        post = Post.new
        post.title = params[:title]
        post.editor = params[:editor]
        post.content = params[:content]
        post.save
        
        redirect_to "/index"
    end
    
    def show
        @id = params[:post_id]
        @post = Post.find(@id)
        
    end
    
    def edit
        @edit_id = params[:edit_id]
        @edit_post = Post.find(@edit_id)
    end
    
    def update
        edit_id = params[:edit_id]
        edit_post = Post.find(edit_id)
        edit_post.title = params[:title]
        edit_post.editor = params[:editor]
        edit_post.content = params[:content]
        edit_post.save
        redirect_to "/index"
    end
    
    def delete
        delete_id = params[:delete_id]
        delete_post = Post.find(delete_id)
        delete_post.destroy
        redirect_to "/index"
    end
end
