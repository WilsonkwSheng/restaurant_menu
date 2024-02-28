module Enums
  class MenuEnumType < Types::BaseEnum
    value 'draft', "Menu is not ready to be available for public"
    value 'active', "Menu is ready to be available for public"
  end
end
