class QuotesController < Rulers::Controller
  def a_quote
    render :a_quote, :noun => :thinking
  end

  def exception
    raise "It's a bad one!"
  end
end


