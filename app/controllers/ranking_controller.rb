class RankingController < ApplicationController
  def have
      #@haves = Ownership.where(type: "Have").group(:item_id).order('count_type desc').count(:type)
      item_counts = Have.group(:item_id).order('count_id desc').limit(10).count(:id)
      @ranking = item_counts.transform_keys!{ |key| Item.find(key) }
  end    

  def want
    item_counts = Want.group(:item_id).order('count_id desc').limit(10).count(:id)
    @ranking = item_counts.transform_keys!{ |key| Item.find(key) }
  end
end
