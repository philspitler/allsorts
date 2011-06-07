require 'active_record'

module AllSorts
  attr_accessor :sortable_fields
  def sort(params)

    #remove non filter params
    params.delete_if { |key, value| key.to_s.index('sort_').nil? }
    keys = params.keys.sort
    #params.keys.sort_by {|s| s.to_s}.map {|key| [key, params[key]] }

    sorters = []

    keys.each do |key, value|
      keysplit = key.to_s.split('_')

      sorters << "#{keysplit.last} #{params[key]}"
    end

    order(sorters)
  end


  def sortable_fields(*fields)
    @sortable_fields = fields
  end
end

ActiveRecord::Base.extend AllSorts
