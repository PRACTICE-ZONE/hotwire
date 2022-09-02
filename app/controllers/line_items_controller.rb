class LineItemsController < ApplicationController
  def new
    @line_item = @line_item_date.line_items.build
  end

  def edit
  end

  def create
    @line_item = @line_item_date.line_items.build(line_item_params)

    if @line_item.save
      redirect_to quote_path(@quote), notice: "Item was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end
end
