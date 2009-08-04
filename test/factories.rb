Factory.define :user do |f|
  f.sequence(:login) { |n| "foo#{n}" }
  f.password "foobar"
  f.password_confirmation { |u| u.password }
  f.sequence(:email) { |n| "foo#{n}@example.com" }
end

Factory.define :publication do |f|
  f.publication_date DateTime.now
end

Factory.define :event do |f|
  f.date DateTime.now
  f.sequence(:title) { |n| "Title#{n}"}
  f.sequence(:body) { |n| "#{n}body"}
end