App = {

  init: async function () {
    // Load pets.
    $.getJSON('../petSelect', function (data) {
      var petsRow = $('#petsRow');
      // added. #persRow 하위 html 요소를 초기화하기 위햇 지워주기.
      petsRow.children().remove();

      var petTemplate = $('#petTemplate');

      for (i = 0; i < data.length; i++) {
        petTemplate.find('.panel-title').text(data[i].name);
        petTemplate.find('img').attr('src', '../' + data[i].picture);
        petTemplate.find('.pet-breed').text(data[i].breed);
        petTemplate.find('.pet-age').text(data[i].age);
        petTemplate.find('.pet-location').text(data[i].location);
        petTemplate.find('.btn-adopt').attr('data-id', data[i].id);

        petsRow.append(petTemplate.html());
      }
    });

    return await App.initContract();
  },

  initContract: function () {
    /*
     * Replace me...
     */
    this.markAdopted();

    return App.bindEvents();
  },

  bindEvents: function () {
    $(document).on('click', '.btn-adopt', App.handleAdopt);
  },

  markAdopted: function () {

    fetch('../adoptSelect')
      .then(response => response.json())
      .then(function (adopters) {
        console.log(adopters)
        for (i = 0; i < adopters.length; i++) {
          $('.panel-pet').eq(adopters[i].id).find('button').text('Success').attr('disabled', true);
        }
      })
      .catch(function (err) {
        console.log(err.message);
      });

  },

  handleAdopt: function (event) {
    event.preventDefault();

    var petId = parseInt($(event.target).data('id'));

    fetch('../adoptInsert', {
      method: 'POST',
      headers: {
        //'Content-type': 'application/x-www-form-urlencoded'
        'Content-type': 'application/json'
      },
      body: JSON.stringify({
        id: petId,
        price: 9000
      })
    }).then(function (result) {
      console.log(result);
      return App.markAdopted();
    }).catch(function (err) {
      console.log(err.message);
    });

  }

}

$(function () {
  $(window).load(function () {
    App.init();
  });
});