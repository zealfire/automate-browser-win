require 'sinatra'

require_relative 'utils'

get '/' do
  'Home page'
end

# end point for starting browser
get '/start/?' do
  puts params
  check_for_proxy(params)
  browser = params[:browser]
  url = params[:url]
  case browser
  when 'chrome'
    `open -a '/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome' #{url}`
  when 'firefox'
    `open -a 'Firefox' #{url}`
  when 'safari'
    `open -a 'Safari' #{url}`
  end
end

# end point for closing browser
get '/close/?' do
  browser = params[:browser]
  kill_all_arg = ""
  case browser
  when 'chrome'
    kill_all_arg = 'Google Chrome'
  when 'firefox'
    kill_all_arg = 'firefox'
  when 'safari'
    kill_all_arg = 'Safari'
  end
  `killall -SIGTERM #{kill_all_arg}`
end

# end point for cleaning browser
get '/clean/?' do
  browser = params[:browser]
  username = `id -un`
  username = username.split("\n")[0]
  close # close so that profiles can be deleted
  if username
    case browser
    when 'chrome'
      `rm -rf "#{Dir.home}/Library/Caches/Google/Chrome/Default/Cache/"`
      `rm -rf "#{Dir.home}/Library/Application Support/Google/Chrome/"`
    when 'firefox'
      `rm -rf "#{Dir.home}/Library/Application Support/Firefox"`
      `rm -Rf "#{Dir.home}/Library/Caches/Firefox"`
      puts "Deletion done"
    when 'safari'
      `rm -Rf "#{Dir.home}/Library/Caches/Metadata/Safari"`
      `rm -Rf "#{Dir.home}/Library/Caches/com.apple.Safari"`
      `rm -Rf "#{Dir.home}/Library/Cookies/Cookies.binarycookies"`
    end
  end
end
