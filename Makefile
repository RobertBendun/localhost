all: nginx.conf index.html

%: %.erb docs.rb
	erb $< > $@

index.html: index.html.erb
nginx.conf: nginx.conf.erb
