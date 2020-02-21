const path = require('path');
const webpack = require('webpack');

module.exports = {
  mode: "production",
  entry: './src/index.js',
  output: {
    filename: 'rstrap.js',
    path: path.resolve(__dirname, 'dist'),
  },
  plugins: [
    new webpack.NormalModuleReplacementPlugin(
      /^jquery$/,
      path.resolve(__dirname, "src/jquery-window.js")
    ),
    new webpack.NormalModuleReplacementPlugin(
      /^popper\.js$/,
      path.resolve(__dirname, "src/popper-window.js")
    )
  ]
};
