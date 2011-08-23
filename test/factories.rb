Factory.define :user do |f|
  f.sequence(:login) { |n| "foo#{n}" }
  f.password "foobar"
  f.password_confirmation { |u| u.password }
  f.sequence(:email) { |n| "foo#{n}@example.com" }
end

Factory.define :publication do |f|
  f.sequence(:publication_date) { |n| DateTime.now - n.to_i.weeks }
  f.sequence(:authors_info) { |n| "authors-list-#{n}" }
  f.sequence(:title) { |n| "title-#{n}" }
end

Factory.define :event do |f|
  f.date DateTime.now
  f.sequence(:title) { |n| "Title#{n}"}
  f.sequence(:body) { |n| "#{n}body"}
end

Factory.define :person do |f|
  f.first_name
  f.last_name
  f.group
end