FactoryGirl.define do 
  
  factory :customer do
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    created_at "2016-02-15T03:06:12.449Z"
    updated_at "2016-02-24T03:06:12.449Z"
  end

  factory :merchant do 
    name {Faker::Hipster.word}
    created_at "2016-02-15T03:06:12.449Z"
    updated_at "2016-02-24T03:06:12.449Z"
  end

  factory :invoice do 
    customer
    merchant
    status "shipped"
    created_at "2016-02-15T03:06:12.449Z"
    updated_at "2016-02-24T03:06:12.449Z"
  end

  factory :item do 
    merchant
    name {Faker::Hacker.noun}
    description {Faker::Hacker.adjective}
    unit_price "127.05"
    created_at "2016-02-15T03:06:12.449Z"
    updated_at "2016-02-24T03:06:12.449Z"
  end

  factory :invoice_item do 
    item
    invoice
    quantity {Faker::Number.between(1, 10)}
    unit_price {Faker::Number.decimal(2)}
    created_at "2016-02-15T03:06:12.449Z"
    updated_at "2016-02-24T03:06:12.449Z"
  end

  factory :transaction do 
    invoice
    credit_card_number "4654405418249632"
    result "success"
    created_at "2016-02-15T03:06:12.449Z"
    updated_at "2016-02-24T03:06:12.449Z"
  end

end