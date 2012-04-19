class String
  def upcase
    Unicode.upcase(self)
  end

  def upcase!
    replace self.upcase
  end

  def downcase
    Unicode.downcase(self)
  end

  def downcase!
    replace self.downcase
  end

  def capitalize
    Unicode.capitalize(self)
  end

  def capitalize!
    replace self.capitalize
  end
end
