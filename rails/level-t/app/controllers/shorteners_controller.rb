class ShortenersController < ApplicationController
    # https://medium.com/@noestauffert/building-a-url-shortener-with-rails-5-ece84f59b6a3 - Understand logic of url shortener as well as random chars generate

    URL_BASE = 'psu/'

    def index
        @shorteners = Shortener.all
    end

    def show
        @shortener = Shortener.find(params[:id])
        p @shortener
    end

    def new
        @shortener = Shortener.new
    end

    def create
        @shortener = Shortener.new(filter_params)

        # Generate a one dimension array with a-zA-Z0-9 and get 8 random chars
        all_chars = ['0'..'9', 'A'..'Z', 'a'..'z'].map { |range| range.to_a }.flatten
        @shortener.shorted_url = URL_BASE + 8.times.map { all_chars.sample }.join
        if @shortener.save
            redirect_to shorteners_path
        else
            render :index
        end
    end

    # Destroy an url
    def destroy
        @shortener = find_or_redirect(params[:id])

        # prevent from destroying unexisting url
        @shortener.destroy
        redirect_to shorteners_path
    end

    # Define which fields are accepted
    private
    def filter_params
        params.require(:shortener).permit(:original_url)
    end

    # Redirect user if the link is not found, else return the link
    # Param: id : Integer, redirect_url: String
    # return Link || rescue RecordNotFound => redirect
    private
    def find_or_redirect(id, redirect_url=shorteners_path)
        Shortener.find(id)
        rescue ActiveRecord::RecordNotFound
             redirect_to redirect_url
    end

end
