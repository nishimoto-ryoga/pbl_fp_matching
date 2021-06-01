const { environment } = require('@rails/webpacker')

module.exports = environment

// https://github.com/rails/webpacker/blob/749675d9c035dbc8777f718582e3e4804147e9e5/docs/webpack.md#plugins
const webpack = require('webpack')
environment.plugins.append(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js', 'default']
  })
)
