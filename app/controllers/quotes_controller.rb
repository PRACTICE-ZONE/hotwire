class QuotesController < ApplicationController
    before_action :set_quote, only: [:show, :edit, :update, :destroy]

    def index
        @quotes = Quotes.all
    end

    def new
        @quote = Quote.new
    end

    def create
        @quote = Quote.new(quote_params)
    
        if @quote.save
          redirect_to quotes_path, notice: "Quote was successfully created."
        else
          render :new
        end
    end
    
    def edit
    end
end
