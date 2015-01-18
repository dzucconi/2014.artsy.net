$ = require 'jquery'

module.exports = class Share
  title: 'See Artsy’s 2014 Year in Review'
  href: 'http://2014.artsy.net'

  constructor: ({ @$twitter, @$facebook }) ->
    @$twitter.on 'click', (e) =>
      e.preventDefault()
      @popUp @twitter

    @$facebook.on 'click', (e) =>
      e.preventDefault()
      @popUp @facebook

  popUp: (callback) ->
    width = 750
    height = 400
    $window = $(window)
    wLeft = window?.screenLeft or window.screenX
    wTop = window?.screenTop or window.screenY

    options =
      width: width
      height: height
      top: (wTop + ($window.height() / 2) - (height / 2)) or 0
      left: (wLeft + ($window.width() / 2) - (width / 2)) or 0

    callback "status=1,width=#{options.width},height=#{options.height},top=#{options.top},left=#{options.left}"

  facebook: (opts) =>
    url = "https://www.facebook.com/sharer/sharer.php?u=#{@href}"
    window.open url, 'facebook', opts

  twitter: (opts) =>
    url = "https://twitter.com/intent/tweet?original_referer=#{@href}&text=#{@title}:&url=#{@href}&via=artsy"
    window.open url, 'twitter', opts
