module Helper

  module InstanceMethods

    def res_to_list
      if self.listings.count > 0
        self.reservations.count.to_f / self.listings.count.to_f
      else
        0
      end
    end



  end

  module ClassMethods

    define_method(:hello_"#{"hi"}") do
      puts "Hello!"
    end

    def highest_ratio_res_to_listings
      self.all.max_by do |element|
        element.res_to_list
      end
    end

    def most_res
      self.all.max_by do |element|
        element.reservations.count
      end
    end

  end

end
