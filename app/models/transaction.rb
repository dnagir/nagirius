class Transaction < ActiveRecord::Base
  validates_numericality_of :amount
  validate :amount_should_be_reasonable

  has_many :transaction_taggings, :dependent => :destroy
  has_many :tags, :through => :transaction_taggings


  def add_tag(tag)
    tags << tag
  end

  def tag_names
    tags.map(&:name).join(',')
  end

  def tag_names=(names)
    names = names.split(',').map {|n| n.strip}

    all_tags = Tag.where(['name in (?)', names]).all
    existing_tags = all_tags.select { |t| names.include? t.name }
    self.tags = existing_tags
    (names - all_tags.map(&:name).to_a).each do |new_name|
      self.tags << Tag.new(:name => new_name)
    end
  end

  private
    def amount_should_be_reasonable
      errors.add(:amount, "can't be zero") unless amount.abs > 0.01
    end
end
