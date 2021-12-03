# AdFilters

This repository contains the famous Filterlist by [hl2guide](https://github.com/hl2guide/Filterlist-for-AdGuard-or-PiHole) in a suitable format for `dnsmasq` (and more).

🧊 This repository is no longer maintained and is archived (no more commits)

As hl2guide decided to sunset his repo, this one became useless. I respect, unsderstand and share his point: such repos

- are too large
- have a wide hit-and-miss ratio
- make AdGuard Home use too much RAM
- make manually adding whitelisted sites slow or not apply
- take too long to generate
- are not the right approach

I urge you, privacy fans, to move your setup to a "block all then manually whitelist" solution.


## Purpose

The source material is obviously already cuerated. This helps a lot. Anyway, should you try to implement an adblocking system with, let's say, `dnsmasq`, then you'll come to trouble. That's where this repository helps. Just load the already cooked dnsmaq compatible file from your config file:

    conf-file=/path/to/downloaded/adfilters.host
    addn-hosts=/path/to/downloaded/adfilters.host

Not using `dnsmasq`? No problem. There are various other formats available as well.

## Formats

| filename | presentation | suitable for... |
|---|---|---|
| [adfilters](https://raw.githubusercontent.com/fmasclef/adfilters/main/adfilters.tar.gz) | one host by line | machine processing |
| [adfilters.host](https://raw.githubusercontent.com/fmasclef/adfilters/main/adfilters.host.tar.gz) | hosts file | dnsmasq, `/etc/hosts`, Windows hosts, gasmask |
| [adfilters.txt](https://raw.githubusercontent.com/fmasclef/adfilters/main/adfilters.txt.tar.gz) | one host by line | AdGuard, AdGuardHome, Pi-Hole |
| [adfilters.yml](https://raw.githubusercontent.com/fmasclef/adfilters/main/adfilters.yml.tar.gz) | YAML | YAML fans |

## Cook it by yourself

There's even an idiot level `Makefile`. Feel free to hack it. Then... guess what... `make all`.
