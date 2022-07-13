class DeviceQuery

  SORTING = {
    default: ->(scope) { scope.order(name: :asc) },
    name_asc: ->(scope) { scope.order(name: :asc) },
    name_desc: ->(scope) { scope.order(name: :desc) },
    type: ->(scope) {scope.where(type_id: Type.find(scope.type_id))}
  }.freeze

  def initialize(relation, search:, sort_by:)
    @relation = relation
    @search = search
    @sort_by = sort_by.try(:to_sym) || :default
  end

  def call
    scoped = make_search
    SORTING[sort_by].call(scoped)
  end

  private

  attr_reader :search, :relation, :sort_by

  def make_search
    search.blank? ? relation : relation.where('name ILIKE :query', query: "#{search}")
  end

end
