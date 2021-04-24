CURDATE = `date +"%Y%m%d"`

clean:
	@rm -f adfilters*
	@rm -f list

download:
	@rm -f list
	@echo "downloading material"
	@curl -s https://raw.githubusercontent.com/hl2guide/Filterlist-for-AdGuard/master/Blocklist/filter_blocklist1.txt >> list
	@curl -s https://raw.githubusercontent.com/hl2guide/Filterlist-for-AdGuard/master/Blocklist/filter_blocklist2.txt >> list
	@curl -s https://raw.githubusercontent.com/hl2guide/Filterlist-for-AdGuard/master/Blocklist/filter_blocklist3.txt >> list
	@curl -s https://raw.githubusercontent.com/hl2guide/Filterlist-for-AdGuard/master/Blocklist/filter_blocklist4.txt >> list
	@echo "sorting material"
	@cat list | sort | uniq > adfilters
	@rm -f list

adguard: download
	@echo "building AdGuard compatible filterlist"
	@cp adfilters adfilters.txt

dnsmasq: download
	@echo "building dnsmasq compatible host filterlist"
	@echo "127.0.0.1 localhost" > adfilters.host
	@sed 's/^/0.0.0.0 /' adfilters >> adfilters.host

yaml: download
	@echo "building YAML filterlist"
	@echo "filters:" > adfilters.yml
	@sed 's/^/- /' adfilters >> adfilters.yml

publish:
	@git fetch
	@git pull
	@git add adfilters*
	@echo "git commit -mS 'v$(CURDATE)'"
	@echo "git push origin main"

all: clean download adguard dnsmasq yaml