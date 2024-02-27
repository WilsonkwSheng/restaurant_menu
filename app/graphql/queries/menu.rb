module Queries
  module Menu
    extend ActiveSupport::Concern

    included do
      field :menu, [Types::Model::Menu], null: false do
        argument :state_eq, String, required: false
        argument :start_date_gteq, GraphQL::Types::ISO8601DateTime, required: false
        argument :end_date_lteq, GraphQL::Types::ISO8601DateTime, required: false
      end
    end

    def menu(state_eq: nil, start_date_gteq: nil, end_date_lteq: nil)
      menu_items = ::Menu.all
      menu_items = menu_items.where(state: state_eq) if state_eq.present?
      menu_items = menu_items.where("start_date >= ?", start_date_gteq) if start_date_gteq.present?
      menu_items = menu_items.where("end_date <= ?", end_date_lteq) if end_date_lteq.present?
      menu_items
    end
  end
end
