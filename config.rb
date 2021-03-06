require 'dotenv'
Dotenv.load

require 'active_support/core_ext'

###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

# Settings
activate :directory_indexes
activate :i18n, mount_at_root: :fr

# Plugins settings
activate :sync do |sync|
  sync.fog_provider          = 'AWS'                 # Your storage provider
  sync.fog_directory         = ENV['AWS_BUCKET']     # Your bucket name
  sync.fog_region            = ENV['AWS_REGION']     # The region your storage bucket is in (eg us-east-1, us-west-1, eu-west-1, ap-southeast-1 )
  sync.aws_access_key_id     = ENV['AWS_PUBLIC_KEY'] # Your Amazon S3 access key
  sync.aws_secret_access_key = ENV['AWS_SECRET_KEY'] # Your Amazon S3 access secret
  sync.existing_remote_files = 'keep'                # What to do with your existing remote files? ( keep or delete )
  sync.gzip_compression      = true                  # Automatically replace files with their equivalent gzip compressed version
  sync.after_build           = true                  # Disable sync to run after Middleman build ( defaults to true )
end

# Workaround for bucket names with dots, see https://github.com/fog/fog/issues/2357
::Fog.credentials = { path_style: true }


###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# activate :livereload

# Methods defined in the helpers block are available in templates
helpers do
  def slugify(string)
    string.dasherize
  end
end

# Routes
data.projects.keys.each do |slug|
  proxy("/projets/#{slugify(slug)}.html", "/projects/template.html", locals: { project: data.projects[slug] }, ignore: true)
end

if data.try(:directors)
  data.directors.keys.each do |slug|
    proxy("/realisateurs/#{slugify(slug)}.html", "/directors/template.html", locals: { director: data.directors[slug] }, ignore: true)
  end
end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # Minify assets
  activate :minify_javascript
  activate :minify_css

  # Enable cache buster
  activate :asset_hash, ignore: /facebook-icon/

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
