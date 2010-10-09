class Transaction < ActiveRecord::Base
  validates_numericality_of :amount
  validate :amount_should_be_reasonable

  has_many :transaction_taggings, :dependent => :destroy
  has_many :tags, :through => :transaction_taggings


  def add_tag(tag)
    tags << tag
  end

  private
    def amount_should_be_reasonable
      errors.add(:amount, "can't be zero") unless amount.abs > 0.01
    end
end
