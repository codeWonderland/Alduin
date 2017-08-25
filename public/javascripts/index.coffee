$(document).ready ->
  createTempHome()
  return

@createTempHome = ->
  getRequest('/creators/getCreators', (response) ->
    response = mergeSort(response)
    document.getElementById('dm-list').innerHTML += '<a href="/creators/' + dm._Id + '"><div class="card dm-card"><h2>' + dm.DisplayName + '</h2></div></a>' for dm in response
    return
  )
  
@mergeSort = (arr) ->
  return arr if arr.length < 2
  middle = parseInt(arr.length / 2)
  left = arr.slice(0, middle)
  right = arr.slice(middle, arr.length)
  merge mergeSort(left), mergeSort(right)
  
@merge = (left, right) ->
  result = []
  while left.length and right.length
    if left[0].DisplayName <= right[0].DisplayName
      result.push left.shift()
    else
      result.push right.shift()
  result.push left.shift() while left.length
  result.push right.shift() while right.length
  result