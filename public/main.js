// ajax request: https://stackoverflow.com/questions/19015897/jquery-ajax-simple-call/19016091


function anagrams(event) {
  word = $('#anagram-word').val();
  $.ajax({
    url: '/anagrams/' + word,
    type: 'GET',
    success: function(data) {
      $('#anagram-results').html(data);
      console.log(data);
    },
    error: function(request, err) {
      alert("Request: " + JSON.stringify(request));
      alert(err);
    }
  })
  return false;
}

function prefixes(event) {
  word = $('#prefix').val();
  $.ajax({
    url: '/prefixed/' + word,
    type: 'GET',
    success: function(data) {
      $('#prefix-results').html(data);
      console.log(data);
    },
    error: function(request, err) {
      alert("Request: " + JSON.stringify(request));
      alert(err);
    }
  })
  return false;
}

function ladder(event) {
  startWord = $('#start-word').val();
  endWord = $('#end-word').val();
  $.ajax({
    url: '/word_ladder/' + startWord + '/' + endWord,
    type: 'GET',
    success: function(data) {
      $('#ladder-results').html(data);
      console.log(data);
    },
    error: function(request, err) {
      alert("Request: " + JSON.stringify(request));
      alert(err);
    }
  })
  return false;
}

function init() {
  $('#anagram-link').on('click', anagrams);
  $('#prefix-link').on('click', prefixes);
  $('#word-ladder').on('click', ladder);
}

$(init);
