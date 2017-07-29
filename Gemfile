source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# common gem list
gem 'rails', '~> 5.0.4'
gem 'mysql2', '>= 0.3.18', '< 0.5'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'haml-rails'
gem 'erb2haml'
gem 'bootstrap-sass'
gem 'devise'
gem 'carrierwave'
gem 'rmagick', require: 'RMagick'
gem 'fog'
gem 'acts-as-taggable-on', '~> 4.0'
gem 'kaminari'


# development and test gem list
group :development, :test do
  gem 'byebug', platform: :mri
  gem 'pry-rails'
  gem "rspec-rails"         #Rails 専用の機能を追加するRSpecのラッパーライブラリ
  gem "factory_girl_rails"  #テストデータを作成する
  gem "faker", "~> 1.6.6"              #名前やメールアドレス、その他のプレースホルダなどをダミーデータ生成
  gem 'rails-controller-testing'
end

# development gem list
group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'bullet'
end

# test gem list
group :test do
  gem "capybara"            #ユーザーとWebアプリケーションのやり取りをプログラム上で簡単にシュミレートを可能にする
  gem "database_cleaner"    #データベースをまっさらな状態で各specが実行できるようにする
  gem "launchy"             #テストのデバック用
  gem "poltergeist"         #capybaraのためのドライバ
end
