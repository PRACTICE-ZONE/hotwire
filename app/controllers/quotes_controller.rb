class QuotesController < ApplicationController
    before_action :set_quote, only: [:show, :edit, :update, :destroy]
    # before_action -> { sleep 3 }

    def index
        @quotes = current_company.quotes.ordered
    end

    def new
        @quote = Quote.new
    end

    def create
        @quote = current_company.quotes.build(quote_params)
        respond_to do |format|
          if @quote.save
            format.html { redirect_to quotes_path, notice: "quote was successfully created." }
            format.json { render :show, status: :created, location: @quote }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @quote.errors, status: :unprocessable_entity }
          end
        end
    end
    
    def edit
    end

    def update
        if @quote.update(quote_params)
          redirect_to quotes_path, notice: "Quote was successfully updated."
        else
          render :edit
        end
    end
    
      def destroy
        @quote.destroy
        respond_to do |format|
          format.html { redirect_to quotes_path, notice: "Quote was successfully destroyed." }
          format.turbo_stream
        end
      end
    
      private
    
      def set_quote
        @quote =  current_company.quotes.find(params[:id])
      end
    
      def quote_params
        params.require(:quote).permit(:name)
      end
end
