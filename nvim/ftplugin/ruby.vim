compiler ruby
"setlocal makeprg=ruby\ -wc\ %
set makeprg=bundle\ exec\ rspec\ --require\ ~/Desktop/quickfix_formatter.rb\ -f\ QuickfixFormatter\ %
