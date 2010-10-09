require 'spec_helper'

describe Transaction do

  describe 'amount validation' do

    def amount_of(a) Transaction.new(:amount=>a) end

    [-1, 1, -2.55, 2.55, '3.55'].each do |number|
      it "should allow number #{number}" do
        amount_of(number).should_not have_error_on(:amount)
      end
    end

   ['a', '--', /asd/, '5..6'].each do |something|
     it "should not allow non-number #{something}" do
       amount_of(something).should have_error_on(:amount)
     end
   end 

   [0, '0', '0.00', 0.00, 0.000001].each do |zero|
     it "should not allow zero for #{zero.inspect}" do
       amount_of(zero).should have_error_on(:amount)
     end
   end

  end

  describe 'tagging' do
    it "should has no tags" do
      Transaction.new.tags.should be_empty
    end

    it "should has added tag" do
      food = Tag.create(:name=>'food')
      t = Transaction.new(:amount=>5)
      t.add_tag food
      t.save!
      t.reload
      t.tags.should include(food)
    end

  end

end
