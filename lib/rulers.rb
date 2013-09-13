   # rulers/lib/rulers.rb
    require "rulers/version"
    require "rulers/array"
    require "rulers/routing"
    module Rulers
      class Application
        def call(env)
            `echo debug > debug.txt`
            if env['PATH_INFO'] == '/favicon.ico'
              return [404,
                {'Content-Type' => 'text/html'}, []]
            klass, act = get_controller_and_action(env)
            controller = klass.new(env)
            text = controller.send(act)
          [200, {'Content-Type' => 'text/html'},

          [text]]
        end
	   end 

     class Controller
        def initialize(env)
          @env = env
        end

        def env
          @env
        end
      end
    end	