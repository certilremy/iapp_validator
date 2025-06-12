# IappValidator
[![Gem Version](https://badge.fury.io/rb/iapp_validator.svg)](https://badge.fury.io/rb/iapp_validator)

`IappValidator` is a Ruby gem that facilitates purchase verification for Google Play. It leverages the Google Play Developer API to confirm whether a purchase is valid or not.

## 📦 Installation

Add the gem to your application's `Gemfile`:

```ruby
gem 'iapp_validator'
```

Then run:

```bash
bundle install
```

## 🔐 Configuration

To verify Google Play purchases, you need a **Google Play Service Account JSON key**.

1. Go to [Google Cloud Console](https://console.cloud.google.com).
2. Create a Service Account and grant it "Android Publisher" permissions.
3. Download the JSON key file.
4. Place it in your app (e.g., `config/credentials/google_play_service_account.json`).

## 🚀 Usage

```ruby
require 'iapp_validator'

validator = ReceiptHelper::GooglePlayValidator.new
result = validator.verify_purchase("com.package.name", "your.product.id", "purchase_token")

if result[:success]
  puts "Purchase is valid"
else
  puts "Purchase failed: #{result[:error]}"
end
```

### ✅ `verify_purchase(package_name, product_id, token)` Parameters

- `package_name`: The package name of your app on Google Play (e.g., `com.katkatgames.kanbiztoupatou`)
- `product_id`: The ID of the purchased product (e.g., `coins_100`)
- `token`: The purchase token returned from the Google Play API.

## 🛠 Development

To install the gem locally:

```bash
bundle exec rake install
```

To open an interactive console:

```bash
bin/console
```

## 🤝 Contributing

Pull requests, bug reports, and suggestions are welcome! Please follow the [Code of Conduct](https://github.com/certilremy/iapp_validator/blob/main/CODE_OF_CONDUCT.md).

## 📄 License

This gem is licensed under the [MIT License](https://opensource.org/licenses/MIT).
