module RussianHelper
  def ru_quantify(n, f1, f2, f5)
    form = begin
      x = n % 100
      if (10..20).include? x
        f5
      else
        case x % 10
        when 1 then f1
        when 2, 3, 4 then f2
        else f5
        end
      end
    end
    format(form, n)
  end
end
