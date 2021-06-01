require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Pbl
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    config.generators do |g|
      g.test_framework :rspec,
        # テストデータベースにレコードを作成するファイルの作成をスキップする
                       fixtures: false,
                       # ビュースペックを作成しない
                       view_specs: false,
                       # ヘルパーファイル用のスペックを作成しない
                       helper_specs: false,
                       # config/routes.rb用のスペックファイルの作成を省略(ルーティングが複雑になったら導入する)
                       routing_specs: false

        # コントローラースペックを生成したくない場合
        # controller_specs: false
    end
  end
end
