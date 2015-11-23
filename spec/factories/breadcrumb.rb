FactoryGirl.define do
  factory :breadcrumb, :class => 'Breadcrumb' do
    lat 47.6320767091718
    long -122.033664280162
    title "You've got a breadCrumb!"
    subtitle "hello seattle"
    identifier "44C8D038-7815-45D3-B3D2-40E1A6191C3B"
    photo File.new(Rails.root + 'spec/factories/images/rails.png') 
    # photo { fixture_file_upload "#{Rails.root}/spec/fixtures/images/product.png", 'image/png' }

  end

end
