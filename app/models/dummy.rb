class Dummy
  include Helper::InstanceMethods

  after_initialize :make_method
end
