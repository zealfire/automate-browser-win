# helps to set proxy if settings passed in query params
def check_for_proxy(params)
	hostname = params[:hostname]
	port = params[:port]
  if hostname && port
    system('reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 1 /f')
    system('reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /t REG_SZ /d #{hostname}:#{port} /f')
  end
end

# helps to disable proxy
def disable_proxy
  system('reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f')
end

# helps to open particular browser
def open(browser, url="")
  case browser
  when 'chrome'
    `start chrome #{url}`
  when 'firefox'
    `start firefox #{url}`
  when 'ie'
    `start iexplore #{url}`
  end
end

# helps to do cleaning of browser
def cleanup(browser)
  case browser
  when 'chrome'
    `cleanup_browser\clean_chrome.bat`
  when 'firefox'
    `cleanup_browser\clean_firefox.bat`
  when 'ie'
   `cleanup_browser\clean_ie.bat`
  end
end

# helps to close a specific browser
def close(browser)
  disable_proxy # disabling proxy is part of closing process
  kill_arg = ""
  case browser
  when 'chrome'
    kill_arg = 'chrome.exe'
  when 'firefox'
    kill_arg = 'firefox.exe'
  when 'ie'
    kill_arg = 'iexplore.exe'
  end
  `Taskkill /IM #{kill_arg} /F`
end
