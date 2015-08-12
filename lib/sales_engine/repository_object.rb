class RepositoryObject
  def inspect
    ObjectSpace._id2ref(object_id).to_s.insert(-2, (instance_variables - [:@repository]).map do |ivar|
      var = instance_variable_get(ivar)
      [ivar, var.is_a?(String) ? "\"#{var}\"" : var].join('=')
    end.join(', ').insert(0, ' '))
  end
end
