factory :user, aliases: [:author, :commenter] do
  first_name { "John" }
  last_name { "Doe" }
  date_of_birth { 18.years.ago }
end

factory :post do
  author
  #instead of
  #association :author, factory: :user
  title { "How to read a book effectively" }
  body { "There are five steps involved." }
end

factory :comment do
  commenter
  #instead of
  #association :commenter, factory: :user
  body { "Great article!" }
end


#### Depenedent attributes
factory :user do
  first_name { "Joe" }
  last_name { "Blow" }
  email { "#{first_name}.#{last_name}@example.com".downcase }
end

create(:user, last_name: "Doe").email

# => "Joe.doe@example.com
