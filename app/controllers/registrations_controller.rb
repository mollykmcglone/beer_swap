class RegistrationsController < Devise::RegistrationsController
  def create
    super
    if resource.save
      resource.create_profile
    end
  end
end
