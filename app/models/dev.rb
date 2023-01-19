class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
        self.freebies.each do |freebie|
            if freebie.item_name == item_name
                return true
            else return false 
            end 
        end  
    end 

    def give_away(dev, freebie)
        if self.id == freebie.dev_id
            freebie.update(dev_id: dev.id)
        else 
            "not yours"
        end 
    end 

end
