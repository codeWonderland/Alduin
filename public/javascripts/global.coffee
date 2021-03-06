HOST = ''

$(document).ready ->
  switch window.location.pathname.trunc(3)
    when 'cre' then setActive('Creators')
    when 'art' then setActive('Art')
    when 'sto' then setActive('Stories')
    when 'exp' then setActive('Explore')
    else setActive('Home')
  return

@String.prototype.trunc = (n) ->
  if this.length > n
    return this.substr 1, n
  else
    return this
    
@setActive = (navItem) ->
  for item in $('.nav.navbar-nav')[0].getElementsByTagName('li')
    if $(item).hasClass 'active'
      $(item).removeClass('active')
  
  for item in $('.nav.navbar-nav')[0].getElementsByTagName('li')
    if item.getElementsByTagName('a')[0].innerHTML is navItem
      $(item).addClass('active')
  return

@postRequest = (path, data, success) ->
  $.ajax
    url: HOST + path
    type: 'POST'
    data: data
    dataType: 'JSON'
    success: (response) ->
      success response
      return
  return

@getRequest = (path, success) ->
  $.ajax
    url: HOST + path
    type: 'GET'
    success: (response) ->
      success response
      return
  return
  
@guid = ->
  s4 = ->
    return Math.floor((1 + Math.random()) * 0x10000).toString(16).substring(1)
  return s4() + s4() + '-' + s4() + '-' + s4() + '-' + s4() + '-' + s4() + s4() + s4()
  
@convertMsToDate = (ms) ->
  months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
  time = new Date(ms)
  year = time.getFullYear()
  month = time.getMonth()
  day = time.getDate()
  
  return months[month] + ' ' + day + ', ' + year

@textToBin = (text) ->
  length = text.length
  output = []
  i = 0
  while i < length
    bin = text[i].charCodeAt().toString(2)
    output.push Array(8 - (bin.length) + 1).join('0') + bin
    i++
  output.join ' '

@encrypt = (message) ->
  key = textToBin(message[message.length - 1])
  output = []
  i = 0
  while i < message.length - 1
    bin = textToBin(message[i])
    enc = bin ^ key
    output.push ('00000000' + enc).slice(-8)
    i++
  output.push key
  output.join ' '