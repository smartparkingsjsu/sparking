class Licenseplate < ApplicationRecord
  belongs_to :user, optional: true
end
