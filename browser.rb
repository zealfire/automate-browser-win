$options = {}


require 'optparse'

return if ARGV.length == 0

$options[:method] = ARGV[0]
options = {}
OptionParser.new do |parser|
  parser.on("-u", "--require URL",
            "Require the URL before executing your script") do |url|
    $options[:url] = url
  end
  parser.on("-h", "--require HOSTNAME",
            "Require the HOSTNAME before executing your script") do |hostname|
    $options[:hostname] = hostname
  end
  parser.on("-p", "--require PORTNAME",
            "Require the PORTNAME before executing your script") do |port|
    $options[:port] = port
  end
  parser.on("-b", "--require BROWSER",
            "Require the BROWSERNAME before executing your script") do |browser|
    $options[:browser] = browser
  end
end.parse!

class Browser
	attr_reader :url, :browser
	def initialize
		@url = $options[:url]
		@browser = $options[:browser]
		# if $options[:hostname] and $options[:port]
		# 	`sudo networksetup -setwebproxy 'Wi-Fi' #{$options[:hostname]} #{$options[:port]}`
		# 	`sudo networksetup -setsecurewebproxy 'Wi-Fi' #{$options[:hostname]} #{$options[:port]}`
		# 	# system("export http_proxy='http://#{$options[:hostname]}:#{$options[:port]}'")
		# 	# system("export https_proxy='https://#{$options[:hostname]}:#{$options[:port]}'")
		# else
		# 	`sudo networksetup -setsecurewebproxystate 'Wi-Fi' off`
		# 	`sudo networksetup -setwebproxystate 'Wi-Fi' off`
		# end
	end

	def start
		case @browser
		when 'chrome'
		  `open -a '/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome' #{@url}`
		when 'firefox'
		  `open -a 'Firefox' #{@url}`
		when 'safari'
		  `open -a 'Safari' #{@url}`
		end
	end

	def close
		kill_all_arg = ""
		case @browser
		when 'chrome'
		  kill_all_arg = 'Google Chrome'
		when 'firefox'
		  kill_all_arg = 'firefox'
		when 'safari'
		  kill_all_arg = 'Safari'
		end
		`killall -SIGTERM #{kill_all_arg}`
	end

	def clean
		username = `id -un`
		username = username.split("\n")[0]
		close # close so that profiles can be deleted
		if username
			case @browser
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
end

browser_obj = Browser.new
if $options[:browser]
	return if !['chrome', 'firefox', 'safari'].include?($options[:browser])
else
	$options[:browser] = 'chrome'
end
if $options[:method] == 'start'
	browser_obj.start
elsif $options[:method] == 'close'
	browser_obj.close
elsif $options[:method] == 'clean'
	browser_obj.clean
end