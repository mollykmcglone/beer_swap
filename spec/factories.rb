FactoryGirl.define do
  factory :user do
    name('Person')
    email('person@gmail.com')
    password('password')
    admin(true)
    id(1)
  end

  factory(:category) do
    name('News')
    id(2)
  end

  factory(:post) do
    category
    user
    title('No beer for Donald Trump')
    content('Because, obviously.')
    image Rack::Test::UploadedFile.new('spec/fixtures/images/cheers.jpg', 'image/jpg')
  end

  factory(:profile) do
    user
    address('400 SW 6th Avenue')
    city('Portland')
    state('Oregon')
    zipcode('97214')
    avatar Rack::Test::UploadedFile.new('spec/fixtures/images/missing.png', 'image/png')
  end
end
