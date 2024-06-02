class Plan < ApplicationRecord
    validates :title, presence: true, length: { maximum: 20 }
    validates :start_date, presence: true
    validates :end_date, presence: true
    validates :memo, length: { maximum: 500 }, allow_blank: true
    validate :end_date_after_start_date
  
    private
  
    def end_date_after_start_date
      return if end_date.blank? || start_date.blank?
  
      if end_date <= start_date
        errors.add(:end_date, :end_date_after_start_date)
      end
    end
  end
  
