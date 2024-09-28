all: localhost.conf index.html

%: %.erb docs.rb
	erb $< > $@

index.html: index.html.erb
localhost.conf: localhost.conf.erb
