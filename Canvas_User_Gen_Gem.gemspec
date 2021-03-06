Gem::Specification.new do |s|
  s.name = %q{CanvasUserGen}
  s.version = "0.0.2"
  s.date = %q{2021-01-29}
  s.summary = %q{A gem for creating random (and not so random) canvas users}
  s.authors     = ["Trevor Byington"]
  s.homepage = "https://github.com/tabyington/CanvasUserGen"
  s.license = 'MIT'
  s.files = [
    "lib/CanvasUserGen.rb",
    "lib/User.rb"
  ]
  s.require_paths = ["lib"]
  s.add_runtime_dependency 'faker', '~> 1.1', '>= 1.1.4'
end
