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
    it "should have no tags" do
      Transaction.new.tags.should be_empty
    end

    it "should add tag" do
      food = Tag.create(:name=>'food')
      t = Transaction.new(:amount=>5)
      t.add_tag food
      t.save!
      t.reload
      t.tags.should include(food)
    end

    let!(:food) { Factory(:tag, :name=>'food') }
    let!(:housing) { Factory(:tag, :name=>'housing') }
    let(:cake_expense) { Factory.build(:transaction) }


    it 'should attach tag by name' do
      cake_expense.tag_names = 'food'
      cake_expense.tags.should include(food)
    end

    it 'should create a tag if it does not exist' do
      cake_expense.tag_names = 'food, nonexisting'
      cake_expense.save!
      created = Tag.find_by_name('nonexisting')
      created.should_not be_nil
      cake_expense.tags.should include(food, created)
    end

    it 'should not have duplicates' do
      cake_expense.tag_names = 'food, food, food'
      cake_expense.save!
      cake_expense.tags.count.should == 1
    end

    it 'should return tag names' do
      cake_expense.tags << food
      cake_expense.tag_names.should == 'food'
    end

    it 'should remove existing tag' do
      cake_expense.tags << food
      cake_expense.tag_names = ''
      cake_expense.tags.should be_empty
    end

    it 'should attach multiple tags by name' do
      cake_expense.tag_names = 'food, housing'
      cake_expense.tags.should include(food, housing)
    end

  end

end
