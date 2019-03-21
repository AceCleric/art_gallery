ActiveAdmin.register User do
  permit_params:first_name, :last_name, :email, :password, :password_confirmation
end
