module SalesEngineFinder
  def sales_engine
    ObjectSpace._id2ref(@sales_engine_id)
  end
end
