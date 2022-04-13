require 'pry'

class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
        !!self.freebies.find_by(item_name: item_name)
    end

    def give_away(dev, freebie)
        freebie.update(dev_id: dev.id) unless self.received_one?(freebie.item_name) && freebie.dev_id != self.id
    end
end
