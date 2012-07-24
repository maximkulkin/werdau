module WbrHintsHelper
  def wbr_hints(text)
    raw h(text).gsub(/(.)\b([[:alpha:]])/, '\1<wbr/>\2')
  end
end
