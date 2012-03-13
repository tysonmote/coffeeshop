# coffeeshop

`coffeeshop` is a simple Sinatra app that serves up all CoffeeScript files in a directory as JavaScript. For example, if you had `/my/project/src/rad.coffee`, and ran `coffeeshop` in `/my/project` you could hit `http://localhost:4567/src/rad.coffee` and it will be served up as JavaScript.

`coffeeshop` uses Redis for simple 1-hour caching of the generated JavaScript to keep things snappy.

## Usage

    > gem install coffeeshop
    > cd /my/project/
    > coffeeshop

`coffeeshop` accepts the usual [Sinatra][sinatra] options:

    -p port                          set the port (default is 4567)
    -o addr                          set the host (default is 0.0.0.0)
    -e env                           set the environment (default is development)
    -s server                        specify rack server/handler (default is thin)
    -x                               turn on the mutex lock (default is off)

  [sinatra]: http://www.sinatrarb.com/
