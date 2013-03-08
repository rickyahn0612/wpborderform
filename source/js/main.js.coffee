$ ->
  $("#button").button()


  $("#datepicker").datepicker inline: true

  $("#progressbar").progressbar value: 38
  $("#progressbar2").progressbar value: 60
  $("#progressbar3").progressbar value: 90
  $("#dialog").dialog
    autoOpen: false
    width: 600
    modal: true
    open: ->
      jQuery(".ui-widget-overlay").bind "click", ->
        jQuery("#dialog").dialog "close"    
  # Link to open the dialog
  $("#dialog-link").click (event) ->
    $("#dialog").dialog "open"
    event.preventDefault()
    $(".ui-dialog").css(display: "none").fadeIn "slow"
    videoSourceLink = 'http://www.youtube.com/embed/qzR62JJCMBQ'
    $('#video').attr('src', videoSourceLink).css(display: "none").fadeIn "slow"

  $(".ui-icon-closethick").click (event) ->
  	event.preventDefault()
  	$(".ui-dialog").fadeOut "slow"
  	$('#video').removeAttr('src'); 




# Show hide Job Type Forms
$ ->
  $('.closeBtn').click (event) ->
    event.preventDefault()
    $(this).parents("div.jobTypeForm:first").slideUp "slow", ->
    $(this).css("display:none;")

$(".job_type_button").click (event) ->
  event.preventDefault()
  addedForm = $("#" + @value)
  addedForm.slideDown("slow").prependTo('#jobTypeAddedForm')



$("#print_size_options").change((evt) ->
  selected = $(this).val()
  if selected is "customSize"
    $(".custom_size").fadeIn()
  else
    $(".custom_size").fadeOut()
).change()



$("#binding_options").change((evt) ->
  selected = $(this).val()
  if selected is "plasticcoil"
    $(".plasticCoil").fadeIn()
  else
    $(".plasticCoil").hide()
  if selected is "tape"
    $(".tapeColor").fadeIn()
  else
    $(".tapeColor").hide()
  if selected is 'wireo'
    $(".wireColor").fadeIn()
  else
    $(".wireColor").hide()
).change()


$("#binding_options_smallformatcolor").change((evt) ->
  selected = $(this).val()
  if selected is "plasticcoil"
    $(".plasticCoilSmallFormatColor").fadeIn()
  else
    $(".plasticCoilSmallFormatColor").hide()
  if selected is "tape"
    $(".tapeColorSmallFormatColor").fadeIn()
  else
    $(".tapeColorSmallFormatColor").hide()
  if selected is 'wireo'
    $(".wireColorSmallFormatColor").fadeIn()
  else
    $(".wireColorSmallFormatColor").hide()
).change()



$("#fileDelivery").change((evt) ->
  selected = $(this).val()
  if selected is "viaftp"
    $(".emailFTP").fadeIn()
  else
    $(".emailFTP").hide()
).change()

