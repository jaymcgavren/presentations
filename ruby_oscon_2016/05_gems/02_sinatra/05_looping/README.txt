If you look at app.rb:
$ cat app.rb
...you'll see that it uses a new MovieStore class
to load a list of Movie objects, using YAML::Store.
Try running:
$ ruby test_movie_store.rb
...to get an idea of how MovieStore works.
Then look at views/index.erb to see how it loops
over the array of Movie objects.
