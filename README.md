ikachan Cookbook
================
Perlで作られたIRCツール、ikachanのデプロイと設定を行うCookbookでゲソ。
https://github.com/yappo/p5-App-Ikachan

Configuration
===============

node[:ikachan][:irc_server]    IRCサーバーのアドレス(default: chat.freenode.net)
node[:ikachan][:irc_port]      IRCサーバーのポート(default: 6667)
node[:ikachan][:irc_password]  IRCサーバーのパスワード(default: nil)
node[:ikachan][:irc_nick]      IRCのnickname(default: ikachan)
node[:ikachan][:irc_user]      IRCのuser(default: ikachan)
node[:ikachan][:port]          ikachanのポート(default: 4979)
node[:ikachan][:bind_addr]     ikachanのbindアドレス(default: 127.0.0.1)
