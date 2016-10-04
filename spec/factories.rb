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

  factory(:style) do
    name('Porter/Stout')
    id(1)
  end

  factory(:beer) do
    style
    user
    name('Outrageous Oatmeal Stout')
    description('This turned out really well! Creamy and not-too-sweet.')
    abv(7.5)
    container_type('22 oz. bottles')
    homebrew(true)
    brew_date('2016-06-13')
  end
end
