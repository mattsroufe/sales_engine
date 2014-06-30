module SalesEngineFinder
  def sales_engine
    ObjectSpace._id2ref(@sales_engine_id)
  end

  def invoice_item_repository
    sales_engine.invoice_item_repository
  end
end
