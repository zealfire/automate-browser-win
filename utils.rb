def check_for_proxy(params)
	hostname = params[:hostname]
	port = params[:port]
  # check for domains allowed to bypass proxy, localhost should be present
  if `networksetup -getproxybypassdomains 'Wi-Fi' | grep "localhost" | wc -l|sed 's/^ *//'` != "1\n"
    `networksetup -setproxybypassdomains 'Wi-Fi' localhost`
  end
  if hostname && port
    `networksetup -setwebproxy 'Wi-Fi' #{hostname} #{port}`
    `networksetup -setsecurewebproxy 'Wi-Fi' #{hostname} #{port}`
  else
    `networksetup -setsecurewebproxystate 'Wi-Fi' off`
    `networksetup -setwebproxystate 'Wi-Fi' off`
  end
end
