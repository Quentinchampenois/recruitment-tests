class LinksController < ApplicationController
    RANDOM_RECORD_LIMIT = 6
    # index page
    def index
        #@links = Link.all.sample(RANDOM_RECORD_LIMIT)
        # https://github.com/haopingfan/quick_random_records - More performant random records
              # source: https://stackoverflow.com/a/50409630/11018979
        if Link.nil? # avoid error NilClass when db is empty
            @links = Link.random_records(RANDOM_RECORD_LIMIT)
        else
            @links = Link.all
        end
        @links
    end

    # Page for one link
    def show
        @link = find_or_redirect(params[:id])
    end

    # Form for creating new link
    def new
        @link = Link.new
    end

    # Form for editing one existing link
    def edit
        @link = find_or_redirect(params[:id])
    end

    # Link creation
    def create
        @link = Link.new(filter_params)

        if @link.save
            redirect_to links_path
        else
            render :new
        end
    end

    # Link edition
    def update
        @link = find_or_redirect(params[:id])

        if @link.update(filter_params)
            redirect_to @link
        else
            render 'edit'
        end
    end

    # Link destruction
    def destroy
        @link = find_or_redirect(params[:id])

        @link.destroy
        redirect_to links_path
    end

    # Define which fields are accepted
    private
    def filter_params
        params.require(:link).permit(:title, :description, :name, :link)
    end

    # Redirect user if the link is not found, else return the link
    # Param: id : Integer, redirect_url: String
    # return Link || rescue RecordNotFound => redirect
    private
    def find_or_redirect(id, redirect_url=links_path)
        Link.find(id)
        rescue ActiveRecord::RecordNotFound
             redirect_to redirect_url
    end
end
