// ajax request: https://stackoverflow.com/questions/19015897/jquery-ajax-simple-call/19016091


function anagrams(event) {
  word = $('#anagram-word').val();
  $.ajax({
    url: '/anagrams/' + word,
    type: 'GET',
    success: function(data) {
      $('#anagram-results').html(data);
    },
    error: function() {
      let msg = "Invalid input. Please try again!"
      $('#anagram-results').html(msg);
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
    },
    error: function() {
      let msg = "Invalid input. Please try again!"
      $('#prefix-results').html(msg);
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
    },
    error: function() {
      let msg = "Invalid input (start or end words are invalid). Please try again!"
      $('#ladder-results').html(msg);
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
