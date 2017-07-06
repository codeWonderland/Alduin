$(document).ready ->
  switch window.location.pathname.trunc(3)
    when 'cre' then setActive('Creators')
    when 'art' then setActive('Art')
    when 'sto' then setActive('Stories')
    when 'exp' then setActive('Explore')
    else setActive(Home)
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