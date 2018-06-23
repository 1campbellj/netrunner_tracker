// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require lodash
//= require_tree .

document.addEventListener('turbolinks:load', function () {
  setupCardNameClicks();
  setupSearchBox();
  setupOwnClicks();
  setupProxyClicks();
  setupStackClicks();
  setupPackButtons();
  setupBoxButtons();
  renderStack();
});

function setupPackButtons() {
  ownBtn = document.getElementById('pack-own');
  disownBtn = document.getElementById('pack-disown');

  if (ownBtn) {
    ownBtn.addEventListener('click', function (event) {
      var id = event.target.attributes['data-pack-id'].value
      var url = `/pack/${id}/own_all`
      fetchAndReload(url);
    });
  }

  if (disownBtn) {
    disownBtn.addEventListener('click', function (event) {
      var id = event.target.attributes['data-pack-id'].value
      var url = `/pack/${id}/disown_all`
      fetchAndReload(url);
    });
  }
}

function setupBoxButtons() {
  ownBtn = document.getElementById('box-own');
  disownBtn = document.getElementById('box-disown');

  if (ownBtn) {
    ownBtn.addEventListener('click', function (event) {
      var id = event.target.attributes['data-box-id'].value
      var url = `/box/${id}/own_all`
      fetchAndReload(url);
    });
  }

  if (disownBtn) {
    disownBtn.addEventListener('click', function (event) {
      var id = event.target.attributes['data-box-id'].value
      var url = `/box/${id}/disown_all`
      fetchAndReload(url);
    });
  }
}

function setupOwnClicks() {
  var buttons = Array.from(document.getElementsByClassName('own-button'));
  buttons.forEach(function (button) {
    button.addEventListener('click', function (event) {
      handleOwnClick(event);
    });
  })
}

function setupProxyClicks() {
  var buttons = Array.from(document.getElementsByClassName('proxy-button'));
  buttons.forEach(function (button) {
    button.addEventListener('click', function (event) {
      handleProxyClick(event);
    });
  })
}

function searchElement() {
  return document.getElementById('search-form');
}

function submitSearch() {
  console.log('search submit');
  searchElement().submit();
}

function scrollToCard(cardId) {
  document.getElementById(cardId).scrollIntoView();
};

var handleOwnClick = function (event) {
  var target = event.target;
  var action = target.attributes['active'].value == 'true' ? 'disown' : 'own';
  var cardId = target.attributes['data-card-id'].value;
  fetch(`/card/${cardId}/${action}`, {
    method: 'POST',
    headers: {
      'X-Requested-With': 'XMLHttpRequest',
      'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
    },
    credentials: 'same-origin'
  })
    .then(function (response) {
      if (response.ok) {
        return toggleActive(target);
      }
      throw new Error('Network response was not ok.');
    })
    .catch(function (error) {
      console.log('There has been a problem with your fetch operation: ', error.message);
    })
}

var handleProxyClick = function (event) {
  var target = event.target;
  var action = target.attributes['active'].value == 'true' ? 'unproxy' : 'proxy';
  var cardId = target.attributes['data-card-id'].value;
  fetch(`/card/${cardId}/${action}`, {
    method: 'POST',
    headers: {
      'X-Requested-With': 'XMLHttpRequest',
      'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
    },
    credentials: 'same-origin'
  })
    .then(function (response) {
      if (response.ok) {
        return toggleActive(target);
      }
      throw new Error('Network response was not ok.');
    })
    .catch(function (error) {
      console.log('There has been a problem with your fetch operation: ', error.message);
    })
}

function toggleActive(element) {
  var current = element.attributes['active'].value
  var next = current === 'true' ? 'false' : 'true'
  element.setAttribute('active', next);
};

function searchInput() {
  return document.getElementById('card_list');
}

function setupSearchBox() {
  var se = searchElement();
  if (se) {
    searchElement().addEventListener('input', _.debounce(submitSearch, 500));
    searchInput().addEventListener('input', function (event) {
      localStorage.setItem('search-content', event.target.value)
    })

    var storage = localStorage.getItem('search-content');
    if (storage !== searchInput().value) {
      searchInput().value = storage;
      submitSearch();
    }
  }
}

function setupCardNameClicks() {
  var cardNames = Array.from(document.getElementsByClassName('card-link'));
  cardNames.forEach(function (card) {
    card.addEventListener('click', function () {
      scrollToCard(card.attributes['data-card-id'].value);
    });
  });
}

// stack handling

function pushMissing() {
  var cards = document.querySelectorAll('div.card-wrapper[data-owned="false"][data-proxied="false"]');
  _(cards).each(function (card) {
    stackPush({ id: card.attributes['data-card-id'].value, name: card.attributes['data-card-name'].value })
  });
}

function setupStackClicks() {
  var buttons = Array.from(document.getElementsByClassName('push-button'));
  buttons.forEach(function (button) {
    button.addEventListener('click', function (event) {
      handlePushClick(event);
    });
  });

  var stackClearBtn = document.getElementById('stack-clear');
  if (stackClearBtn) {
    stackClearBtn.addEventListener('click', function () {
      localStorage.removeItem('cardStack');
      renderStack();
    });
  }

  var stackOwnBtn = document.getElementById('stack-own');
  if (stackOwnBtn) {
    stackOwnBtn.addEventListener('click', function () {
      stackOp('own_all');
    });
  }

  var stackProxyBtn = document.getElementById('stack-proxy');
  if (stackProxyBtn) {
    stackProxyBtn.addEventListener('click', function () {
      stackOp('proxy_all');
    });
  }

  var stackOwnBtn = document.getElementById('stack-disown');
  if (stackOwnBtn) {
    stackOwnBtn.addEventListener('click', function () {
      stackOp('disown_all');
    });
  }

  var stackProxyBtn = document.getElementById('stack-unproxy');
  if (stackProxyBtn) {
    stackProxyBtn.addEventListener('click', function () {
      stackOp('unproxy_all');
    });
  }

  var stackViewBtn = document.getElementById('stack-view');
  if (stackViewBtn) {
    stackViewBtn.addEventListener('click', function () {
      var url = '/view_list?ids=';
      url += _.join(stackIds(), ',');
      Turbolinks.visit(url);
    });
  }

  var stackPushMissingBtn = document.getElementById('stack-missing');
  if (stackPushMissingBtn) {
    stackPushMissingBtn.addEventListener('click', function () {
      pushMissing();
    });
  }

  document.addEventListener('click', function (e) {
    if (e.target && _.indexOf(e.target.classList, 'pop-stack-element') >= 0) {
      var i = parseInt(e.target.attributes['data-index'].value);
      popIndex(i);
    }
  });

}

function popIndex(i) {
  var stack = JSON.parse(localStorage.getItem('cardStack'));
  stack.splice(i, 1);
  localStorage.setItem('cardStack', JSON.stringify(stack));
  renderStack();
}

function stackIds() {
  return _.map(JSON.parse(localStorage.getItem('cardStack')), 'id');
}

function stackOp(action) {
  var url = `/card/${action}`
  var ids = stackIds();
  fetchAndReload(url, { card_ids: ids });
}

function fetchAndReload(url, body = {}) {
  fetch(url, {
    method: 'POST',
    headers: {
      'X-Requested-With': 'XMLHttpRequest',
      'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content,
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    },
    body: JSON.stringify(body),
    credentials: 'same-origin'
  })
    .then(function (response) {
      if (response.ok) {
        location.reload();
      }
      throw new Error('Network response was not ok.');
    })
    .catch(function (error) {
      console.log('There has been a problem with your fetch operation: ', error.message);
    })
}

var stackTemplate = `
    <div class='stack'>
      <% _(cardList).each(function(card, i){ %>
        <div>
          <span class='pop-stack-element' data-index='<%= i %>'>x</span> 
          <%= card.name %>
        </div>
      <% }); %>
    </div>
  `
var stackTemplateFn = _.template(stackTemplate);

function renderStack() {
  var stackContainer = document.getElementById('stack-container');
  if (!stackContainer) {
    return;
  }
  var stack = JSON.parse(localStorage.getItem('cardStack')) || []
  var html = stackTemplateFn({ cardList: stack });
  stackContainer.innerHTML = html;
}

function handlePushClick(event) {
  var attributes = event.target.attributes;
  var name = attributes['data-card-name'].value;
  var id = attributes['data-card-id'].value;

  stackPush({ id: id, name: name });
}

function stackPush(cardData) {
  var stack = JSON.parse(localStorage.getItem('cardStack')) || [];
  stack.unshift({ id: cardData.id, name: cardData.name });
  localStorage.setItem('cardStack', JSON.stringify(stack));
  renderStack();
}

// end stack handling

