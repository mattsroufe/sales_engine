class Repository

  def random
    all.sample
  end

  def find_by_id(id)
    all.find { |object| object.id == id }
  end
end
