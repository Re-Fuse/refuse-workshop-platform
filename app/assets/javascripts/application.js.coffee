# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https:#github.com/sstephenson/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require bootstrap-sprockets
#= require cable

$(window).on 'resize', ->
  $('.messages').height($(window).height()-180)

$(document).on 'turbolinks:load', ->
  $(window).trigger('resize')
  $('.messages').scrollTop($('.messages')[0].scrollHeight) if $('.messages').length
  $(".st_active").hide()


# Text selector
window.Kolich = {}
Kolich.Selector = {}

Kolich.Selector.getSelected = ->
  t = ''
  if window.getSelection
    t = window.getSelection()
  else if document.getSelection
    t = document.getSelection()
  else if document.selection
    t = document.selection.createRange().text
  t

Kolich.Selector.save = ->
  st = Kolich.Selector.getSelected()
  if st != ''
    App.room.speak 'Highlighted this:\n' + st, 1
    $('#save-text').hide()


$(document).ready ->
  $(document).bind 'mouseup', ->
    $('#save-text').show()
