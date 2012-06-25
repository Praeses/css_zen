class window.Quake
  constructor: (opts) ->
    @down = false
    $('.quake').remove()
    $('body').append(@console())
    @input = $('.quake input')
    @input.keyup @search

  speed: 300

  console: =>
    div      = document.createElement 'div'
    div.setAttribute 'class', 'quake'

    results      = document.createElement 'div'
    results.setAttribute 'class', 'results'

    div.appendChild results

    input       = document.createElement 'input'
    input.setAttribute 'class'       , 'q'
    input.setAttribute 'name'        , 'q'
    input.setAttribute 'type'        , 'search'
    input.setAttribute 'autosave'    , 'quake_search'
    input.setAttribute 'placeholder' , 'search...'

    div.appendChild input
    div


  open:  =>
    @down = true
    opts =
      duration: @speed
      complete: ->
        $('.quake input').val('')
        $('.quake input').focus()

    $('.quake').animate { bottom: '45%'}, opts
    @input.fadeIn()

  close: =>
    @down = false
    $('.quake').animate { bottom: '100%'}, { duration: @speed, queue: true }
    @input.fadeOut()

  toggle: =>
    if @down
      @close()
    else
      @open()

  search: (event) =>
    clearTimeout( @timeout ) if @timeout
    if event.which is 27
      event.preventDefault();
      @toggle()
    else if @input.val().length > 2
      @timeout = setTimeout @searchNow, 300

    false

  searchNow: =>
    console.log @input.val(), @input.val().length
