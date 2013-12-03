class Game < ActiveRecord::Base
  def fetch_psn_price!
    fail "Can't fetch from PSN without a PSN id" if psn_id.blank?

    json = PSN::Product.new(psn_id).to_json
    new_price = json["default_sku"]["price"]/100.0
    new_price = new_price.round

    self.psn_price = new_price
  end

  def fetch_psn_title!
    fail "Can't fetch from PSN without a PSN id" if psn_id.blank?

    json = PSN::Product.new(psn_id).to_json
    new_title = json["title_name"]

    self.title = new_title
  end
end
