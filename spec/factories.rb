FactoryGirl.define do
  factory :user do
    
  end
  factory(:category) do
    name('News')
    id(2)
  end

  factory(:post) do
    title('No beer for Donald Trump')
    content('Because, obviously.')
    category
    author('Person')
  end

  factory(:comment) do
    author('AnotherPerson')
    content('This country is terrifying')
    post
  end
end
