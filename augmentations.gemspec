$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "augmentations/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "augmentations"
  s.version     = Augmentations::VERSION
  s.authors     = ["scragz"]
  s.email       = ["hi@scragz.com"]
  s.homepage    = "http://scragz.com/"
  s.summary     = "Serve the same cached page to everyone and augment it for special cases after the fact."
  s.description = "Serve the same cached page to everyone and augment it for special cases after the fact."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]
end
