require 'sinatra/jstpages'

class Main
  register Sinatra::JstPages
  serve_jst '/js/jst.js'

  register Sinatra::AssetPack
  assets do
    js :application, '/app.js', %w[
      /js/lib/trim.js
      /js/vendor/json2.js
      /js/vendor/codemirror.js
      /js/vendor/codemirror_modes/*/*.js
      /js/vendor/jade.js
      /js/jst.js
      /js/lib/*.js
      /js/app/**/*.js
      /js/app/*.js
      /js/setup.js
    ]

    css :main, '/main.css', %w[/css/style.css]
    css :error, '/error.css', %w[/css/error.css]
    css :print, '/print.css', %w[/css/print.css]
    css :loading, '/loading.css', %w[/css/loading.css]
  end
end
