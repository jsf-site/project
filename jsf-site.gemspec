# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "jsf-site"
  spec.version       = "0.1"
  spec.authors       = ["Sam Carecho"]
  spec.email         = ["digiwise@gmail.com"]

  spec.summary       = %q{A Jekyll website using Devoll Theme.}
  spec.description   = "A Jekyll website using Devoll Theme, for Java Server Faces."
  spec.homepage      = "http://dev.javaserverfaces.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r{^(assets|_layouts|_includes|_sass|LICENSE|README)}i) }

  spec.add_runtime_dependency "jekyll", "~> 3.4"
  spec.add_runtime_dependency "jekyll-sitemap", "~> 0.10"
  spec.add_runtime_dependency "jekyll-mentions", "~> 1.2"
  spec.add_runtime_dependency "jekyll-paginate", "~> 1.1"
  spec.add_runtime_dependency "jekyll-seo-tag", "~> 2.0"
  spec.add_runtime_dependency "jekyll-redirect-from", "~> 0.11"
  spec.add_runtime_dependency "jekyll-feed", "~> 0.5"
  spec.add_runtime_dependency "jemoji", "~> 0.7"
  spec.add_runtime_dependency "jekyll-paginate-category", "~> 0.1.2"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "jekyll-admin", "~> 0.4.1"
end
