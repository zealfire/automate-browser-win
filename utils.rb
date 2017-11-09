# helps to set proxy if settings passed in query params
def check_for_proxy(params)
	hostname = params[:hostname]
	port = params[:port]
  if hostname && port
    if `networksetup -getwebproxy 'Wi-Fi' | grep '^Enabled:' | cut -d' ' -f2 | tr -d $'\n'` == "No"
      `networksetup -setwebproxy 'Wi-Fi' #{hostname} #{port}`
    end
    if `networksetup -getsecurewebproxy 'Wi-Fi' | grep '^Enabled:' | cut -d' ' -f2 | tr -d $'\n'` == "No"
      `networksetup -setsecurewebproxy 'Wi-Fi' #{hostname} #{port}`
    end
  end
end

# helps to disable proxy
def disable_proxy
  if `networksetup -getsecurewebproxy 'Wi-Fi' | grep '^Enabled:' | cut -d' ' -f2 | tr -d $'\n'` == "Yes"
    `networksetup -setsecurewebproxystate 'Wi-Fi' off`
  end
  if `networksetup -getwebproxy 'Wi-Fi' | grep '^Enabled:' | cut -d' ' -f2 | tr -d $'\n'` == "Yes"
  ` networksetup -setwebproxystate 'Wi-Fi' off`
  end
end

# helps to open particular browser
def open(browser, url="")
  case browser
  when 'chrome'
    `open -a '/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome' #{url}`
  when 'firefox'
    `open -a 'Firefox' #{url}`
  when 'safari'
    `open -a 'Safari' #{url}`
  end
end

# helps to do cleaning of browser
def cleanup(browser)
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

# helps to close a specific browser
def close(browser)
  disable_proxy # disabling proxy is part of closing process
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
