
desc 'Print out all defined routes (including mounted applications) in match order, with names.'
task :all_routes => :environment do
  Rails.application.reload_routes!

  routes = []

  apps = [['/', Rails.application]]
  until apps.empty?
    mount, app = apps.shift
    mount.gsub!(%r{/$}, '')

    app.routes.routes.collect do |route|
      if route.app.respond_to?(:routes)
        apps.push [mount + route.path, route.app]
      else
        routes << {
          :name => route.name.to_s,
          :verb => route.verb.to_s,
          :path => mount+route.path,
          :reqs => route.requirements.inspect,
          :defaults => route.defaults.inspect
        }
      end
    end
  end

   # Skip the route if it's internal info route
  routes.reject! { |r| r[:path] =~ %r{/rails/info/properties|^/assets} }

  name_width = routes.map { |r| r[:name].length }.max
  verb_width = routes.map { |r| r[:verb].length }.max
  path_width = routes.map { |r| r[:path].length }.max
  reqs_width = routes.map { |r| r[:reqs].length }.max

  routes.each do |r|
    puts "#{r[:path].ljust(path_width)} #{r[:name].ljust(name_width)} #{r[:verb].ljust(verb_width)} #{r[:reqs].ljust(reqs_width)} #{r[:defaults]}"
  end
end
