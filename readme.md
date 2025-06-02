# Koppet

<small>_(Pronounced "cop-it")_</small>

## Send markdown files in a given directory to your Kobo device as optimised KePubs

**Warning:** This is _extremely_ unpolished. In its current form, Koppet is an MVP that suits my needs. In theory, it should work on both macOS and Linux, but I have only tested it on the former.

## Usage

Once you've cloned this repo, make a global `KOPPET_ARTICLES_DIR` environment variable and set it to the path of the directory containing the markdown files you wish to send.
Make sure you have [Pandoc](https://pandoc.org/installing.html) and [Kepubify](https://pgaskin.net/kepubify/) installed on your system.
Plug in and mount your Kobo device, cross your fingers, and execute `./koppet.sh`.

## Rationale

My Kobo device came with built-in support for syncing with [Pocket](https://getpocket.com/). This allowed me to easily save online articles and read them on my eReader, and was a major factor I considered when choosing to purchase it.
When Mozilla decided to shut down Pocket in May 2025, I was naturally disappointed. I began using [Obsidian Web Clipper](https://obsidian.md/clipper) to save articles I wanted to read, and then manually converted them to ePubs to send to my Kobo. This script basically does that automatically. It's not quite as convenient as Pocket once was, but I've found that Obsidian Web Clipper usually does a better and more consistent job at saving articles anyway.
