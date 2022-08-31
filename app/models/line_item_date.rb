class LineItemDate < ApplicationRecord
  belongs_to :quote

  validates :date, presence: true, uniqueness: { scope: :quote_id }

  scope :ordered, -> { order(date: :asc) }

  def prev_date
    quote.line_item_dates.ordered.where("date < ?", date).last
  end
end
