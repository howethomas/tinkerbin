class Main
  get '/' do
    haml :home
  end

  helpers do
    # Gets the lines around a given string and line number.
    def get_context(string, line, spread)
      lines = string.split("\n")
      alpha = [line-spread, 0].max
      omega = [line+spread, lines.size-1].min

      lines = (alpha..omega).map { |i|
        [ i+1, lines[i] ]
      }
    end
  end

  post '/preview' do
    preview = Previewer.new(params, self)

    if preview.error?
      @error   = preview.error
      @area    = preview.error_area_proper
      @source  = params[preview.error_area]
      @line    = preview.error_line
      @context = get_context(@source, @line, 3)  if @line

      haml :error, layout: false
    else
      preview.html
    end
  end
end

