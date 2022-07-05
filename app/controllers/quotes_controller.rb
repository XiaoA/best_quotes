class QuotesController < Rulers::Controller

  def index
    quotes = FileModel.all
    render :index, :quotes => quotes
  end

  def new_quote
    attrs = {
      "submitter" => "web user",
      "quote" => "A picture is worth a thousand pixels",
      "attribution" => "Me"
    }

    m = FileModel.create attrs
    render :quote, :obj => m    
  end

  def a_quote
    render :a_quote, :noun => :thinking
  end

  def quote_1
    quote_1 = FileModel.find(1)
    render :quote, :obj => quote_1    
  end

  def show
    quote = FileModel.find(params["id"])
    ua = request.user_agent
    render_response :quote, :obj => quote, :ua => ua
  end

  def view_test
    @noun = "roller skating"
    render :view_test    
  end

  def update
    raise "Only POST to this route!" unless
      env["REQUEST_METHOD"] == "POST"
    body = env["rack.input"].read
    astr = body.split("&")
    params = {}
    astr.each do |a|
      name, val = a.split "="
      params[name] = val
    end

    quote = FileModel.find(params["id"].to_i)
    quote["submitter"] = params["submitter"]
    quote.save

    rander :quote, :obj => quote
  end

  def exception
    raise "It's a bad one!"
  end


end


