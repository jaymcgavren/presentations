rails g scaffold reward amount:float
rails g scaffold User name:string email:string password:string
rails g scaffold post title:string content:string
rails g scaffold photo title:string
rails generate scaffold User name:string email:string
bin/rails generate scaffold User name:string email:string
bundle exec rails generate scaffold User name:string email:string
rails g scaffold photo title:string
rails g scaffold post title:string content:string
rails generate scaffold User name:string email:string
rails g scaffold Micropost content:string user_id:integer
rails g rspec:install
rails g controller StaticPages home help --no-test-framework
rails g integration_test static_pages
rails g controller Users new --no-test-framework
rails g integration_test user_pages
rails g model User name:string email:string
rails generate rspec:install
rails generate model User name:string email:string
rails g scaffold Post title:string body:string user_id:integer
rails g integration_test posts
rails g model Tag name:string
rails g model Tagging tag:belongs_to article:belongs_to
rails g model Comment body:string commentable:reference
rails g controller Comments
rails g migration AddCommenterIdToComments
search rails gravatar
rails g migration AddFeaturedToPosts featured:boolean
rails g controller things index create
rails generate rspec:install
rails generate rspec:install
search rails get url of object
search rails gitignore
rails g scaffold Poll question:string
rails g model Choice poll_id:integer description:string
rails generate controller blog
search_past_year rails generate controller
search rails generate view
rails g scaffold Post title:string
rails g scaffold Post title:string
rails g migration AddBodyToPosts body:string
rails g model Comment post_id:integer content:string
rails g controller comments
rails g controller comments
rails g rspec:install
rails g rspec:install
bundle exec rails g scaffold Pet name:string
rails g scaffold Thing name:string phone:string number:integer size:string password:string
rails g scaffold Post title:string body:string
rails g
rails g
search rails generate controller
rails generate scaffold movie title:string director:string year:integer
rails generate --help
rails generate model --help
rails generate controller --help
rails generate controller movie title:string director:string year:integer
rails generate controller movie title:string director:string year:integer
rails generate controller movie
rails generate controller movie
rails generate controller --help
rails generate controller --help
rails generate model --help
rails generate --help
rails generate --help
rails generate controller --help
rails generate --help
rails generate controller movies
rails generate scaffold movie title:string director:string year:integer
rails generate scaffold movie title:string director:string year:integer
rails generate scaffold movie title:string director:string year:integer
rails generate scaffold movie title:string director:string year:integer
rails generate --help
rails generate
search rails generator help
rails generate --help
rails generate model --help
rails generate rspec:install
rails generate model --help
search rails generate skip specs
be rails g model Publisher name:string --no-test-framework
be rails g model Author first_name:string last_name:string --no-test-framework
be rails g model BookFormatType name:string physical:boolean --no-test-framework
be rails g model Book title:string --no-test-framework
search rails generate migration belongs_to
be rails g model Publisher name:string --no-test-framework
be rails g model Author first_name:string last_name:string --no-test-framework
be rails g model BookFormatType name:string physical:boolean --no-test-framework
be rails g model Book title:string --no-test-framework
rails generate rspec:install
be rails g model Publisher name:string --no-test-framework
be rails g model Author first_name:string last_name:string --no-test-framework
be rails g model BookFormatType name:string physical:boolean --no-test-framework
be rails g model Publisher name:string --no-test-framework
be rails g model Author first_name:string last_name:string --no-test-framework
be rails g model BookFormatType name:string physical:boolean --no-test-framework
be rails g model BookFormat book_id:references book_format_type_id:references --no-test-framework
be rails g model Book title:string publisher:references author:references --no-test-framework
history | grep 'rails g' | tail -n 100
be rails g migration ReverseBookPublisherRelation
be rails g model BookReview rating:integer book:references --no-test-framework
be rails g rspec:model Book
be rails g rspec:model Book
rails g factory_girl:model
rails g factory_girl:model Author
rails g factory_girl:model Publisher
rails g factory_girl:model Book
rails g controller EditorController show
search rails generate controller uninitialized constant Rails::Application
rails g controller EditorController show
search undo rails generate
rails g controller Editor show
rails g rspec:install
history | grep 'rails g'
ruby -e "letter_set = 'leawbfulstbe'; puts readlines.reject{|w| w.length > 9}.map(&:chomp).find_all{|w| (w.chars - letter_set.split('')).empty? }.sort_by{|w| (w.chars & letter_set.split('')).length}" ~/Documents/3esl.txt #Find words for Hanging With Friends
find /Volumes/NO\ NAME/ | wc
history | wc
echo 'COBOL is the best!' | ruby -pe 'gsub(/COBOL/, "Ruby")'
ruby -ne 'puts "> #{$_}"' email.txt
cat email.txt | ruby -ne "puts \"> #{\$_}\""
cat email.txt | ruby -ne 'puts "> #{$_}"'
git log --name-only | head
history | tail
tail -f log/development.log
tail -f log/development.log | grep Error
networksetup -setairportpower en0 off; networksetup -setairportpower en0 on # Restart wifi
git checkout master && git pull && bi && bundle exec cap production deploy
bundle install && rake db:migrate && bundle exec rails server
unset LESS
export LESS='-r-i-P%f (%i/%m) Line %lt/%L'
cp "`latest ~/Downloads/`" .
cp "`latest ~/Pictures/Screenshots/`" ~/Downloads/
ssh -t myhost 'cd /srv/myapp/current/ && bundle exec rails console production' #Access production console.
ssh -t myhost "crontab -l"
ssh jay.mcgavren.com "crontab -l"
ssh jay.mcgavren.com
ssh blackhat@jay.mcgavren.com
ssh blackhat@ps9295.dreamhost.com
history | less
history | less
exit
history | less
history | grep 'rails g'
