class QuotesController < ApplicationController
    before_action :set_quote, only: [:show, :edit, :update, :destroy]

    def index
        @quotes = Quotes.all
    end

    def new
        @quote = Quote.new
    end
end
