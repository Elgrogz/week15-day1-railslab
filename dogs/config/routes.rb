Rails.application.routes.draw do
  scope path: 'api' do
    resources(:dogs)
  end
end
