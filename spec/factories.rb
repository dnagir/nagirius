
Factory.sequence :name do |n|
  "name#{n}"
end

Factory.sequence :description do |n|
  "A description of something #{n}"
end

Factory.define :transaction do |f|
  f.amount 15.50
  f.description
end

Factory.define :tag do |f|
  f.name
end
