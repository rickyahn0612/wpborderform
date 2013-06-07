$ ->
  $("#dialog").dialog
    autoOpen: false
    width: 600
    modal: true
    open: ->
      jQuery(".ui-widget-overlay").bind "click", ->
        jQuery("#dialog").dialog "close"

# Link to open the dialog for video
  $("#dialog-link").click (event) ->
    $("#dialog").dialog "open"
    event.preventDefault()
    $(".ui-dialog").css(display: "none").fadeIn "slow"
    videoSourceLink = 'http://www.youtube.com/embed/qzR62JJCMBQ'
    $('#video').attr('src', videoSourceLink).css(display: "none").fadeIn "slow"
    
# close Dialog Box
  $(".ui-icon-closethick").click (event) ->
  	event.preventDefault()
  	$(".ui-dialog").fadeOut "slow"
  	$('#video').removeAttr('src')

# Show hide Job Type Forms
  $(".closeBtn").live "click", (event) ->
    event.preventDefault()
    $(this).parents("div.jobTypeForm:first").slideUp "slow", (evt) ->
      $(this).remove()
      
# Btn to add additional Services to Form 
  $(".job_type_button").live 'click', (event) ->
    event.preventDefault()
  #   addedForm = $("." + @value + ':first')
  #   addedForm.clone().prependTo('#added_form').hide().fadeIn()

# Option when selected Custom Size New Field Fades In
  $(".print_size_options").live 'change', (event) ->
    selected = $(this).val()
    if selected is "customSize"
      $(this).parent().find(".custom_size").fadeIn()
    else
      $(this).parent().find(".custom_size").fadeOut()


  $(".binding_options").change((evt) ->
    selected = $(this).val()
    if selected is "plasticCoil"
      $(this).parent().find(".plasticCoil").fadeIn()
    else
      $(this).parent().find(".plasticCoil").fadeOut()
    if selected is "tape"
      $(this).parent().find(".tapeColor").fadeIn()
    else
      $(this).parent().find(".tapeColor").fadeOut()
    if selected is "wireo"
      $(this).parent().find(".wireColor").fadeIn()
    else
      $(this).parent().find(".wireColor").fadeOut()
  ).change()


  $(".fileDelivery").change((evt) ->
    selected = $(this).val()
    if selected is "viaftp"
      $(".emailFTP").fadeIn()
    else
      $(".emailFTP").fadeOut()
  ).change()


  $("#deliveryOptions").change((evt) ->
    selected = $(this).val()
    if selected is "delivery"
      $(".required_delivery").fadeIn('slow')
    else if selected is "upsground"
      $(".required_delivery").fadeIn('slow')
    else if selected is "upssecondday"
      $(".required_delivery").fadeIn('slow')
    else if selected is "upsovernight"
      $(".required_delivery").fadeIn('slow')
    else 
      $(".required_delivery").fadeOut('slow')
  ).change()

#copy bill to information to deliver to form 
  $("#copy").change ->
    if @checked
      $("#copy").click ->
        billing = $("input[name='billing_info'], select[name='billing_info']")
        shipping = $("input[name='shipping_info'], select[name='shipping_info']")
        billing.each (i, o) ->
          $(shipping.get(i)).val $(o).val()
    else
      $("#copy").click ->
        $(".clearForm").val " "  unless $(this).is(":checked")

#remove Deliver to Form 
  $("#remove").click ->
    $('#deliverToForm').slideToggle();

  $("#remove").change ->
    if @checked
      $("#remove").click ->
        $(".clearForm").val " "  unless $(this).is(":checked")






#  addedLargeFormatBlackWhite = 
#   "
#       <div class='jobTypeForm addedForm1' style='padding-bottom: 10px;'>
#         <h2 class='order_form_header' style='margin-left: 14px;'> LARGE FORMAT BLACK &#38; WHITE </h2>
#         <div class='form_background' style='height: 160px;'>
#           <button class='closeBtn'>
#             remove
#           </button>
#           <button class='addLargeFormatBlackWhite add-entry'>
#             &#43; additional entry
#           </button>
#           <span class='label_for_order_form label_fn'> Description/File Name</span> <span class='required'>*</span>
#           <br />
#           <input class='form_style input_fn' for='first_name' name='lrgFormatBnW[<%= newId %>][description-filename]' type='text' style='width: 350px'>
#             <br />
#             <br />
#           <div class='form_field float-left'>
#             <span class='label label_for_order_form'> Media</span> <span class='required'>*</span>
#             <br />
#             <select class='order_form'>
#               <option value='20lb100Recycled' name='lrgFormatBnW[<%= newId %>][20lb100Recycled]'> 20lb 100% Recycled </option>
#               <option value='20lbLtBlue' name='lrgFormatBnW[<%= newId %>][20lbLtBlue]'> 20lb Lt. Blue </option>
#               <option value='20lbLtGreen' name='lrgFormatBnW[<%= newId %>][20lbLtGreen]'> 20lb Lt. Green </option>
#               <option value='20lbLtPink' name='lrgFormatBnW[<%= newId %>][20lbLtPink]'> 20lb Lt. Pink </option>
#               <option value='20lbLtYellow' name='lrgFormatBnW[<%= newId %>][20lbLtYellow]'> 20lb Lt. Yellow </option>
#               <option value='presentationBond' name='lrgFormatBnW[<%= newId %>][presentationBond]'> Presentation Bond </option>
#               <option value='vellum' name='lrgFormatBnW[<%= newId %>][vellum]'> Vellum </option>
#               <option value='mylar' name='lrgFormatBnW[<%= newId %>][mylar]'> Mylar </option>
#               <option value='seeSpecialInstr' name='lrgFormatBnW[<%= newId %>][seeSpecialInstr]'> See Special Instr. </option>
#             </select>
#           </div>
#           <div class='form_field float-left' style='margin-left: 15px;'>
#             <span class='label_for_order_form'> No. of Originals </span><span class='required'>*</span>
#             <br />
#             <input class='form_style' name='lrgFormatBnW[<%= newId %>][no-of-originals]' type='text'>
#           </div>
#           <div class='form_field float-left' style='margin-left: 15px;'>
#             <span class='label_for_order_form'> No. of Copies </span><span class='required'>*</span>
#             <br />
#             <input class='form_style' name='lrgFormatBnW[<%= newId %>][no-of-copies]' type='text'>
#             <br />
#             <br />
#           </div>
#           <div class='form_field float-left'>
#             <span class='label_for_order_form'> Binding </span><span class='required'>*</span>
#             <br />
#             <select class='order_form float-left'>
#               <option value='edge' name='lrgFormatBnW[<%= newId %>][edge]'> Edge </option>
#               <option value='none' name='lrgFormatBnW[<%= newId %>][none]'> None </option>
#               <option value='screwPost' name='lrgFormatBnW[<%= newId %>][screwPost]'> Screw Post </option>
#               <option value='stapling' name='lrgFormatBnW[<%= newId %>][stapling]'> Stapling </option>
#               <option value='seeSpecialInstr' name='lrgFormatBnW[<%= newId %>][seeSpecialInstr]'> See Special Instr. </option>
#             </select>
#           </div>
#           <div class='form_field float-left' style='margin-left: 15px;'>
#             <span class='label_for_order_form'> Print Size</span> <span class='required'>*</span>
#             <br />
#             <select class='order_form print_size_options'>
#               <option value='fullSize' name='lrgFormatBnW[<%= newId %>][fullSize]'> Full Size </option>
#               <option value='halfSize' name='lrgFormatBnW[<%= newId %>][halfSize]'> Half Size </option>
#               <option value='customSize' name='lrgFormatBnW[<%= newId %>][customSize]'> Custom Size </option>
#             </select>
#             <div class='custom_size' style='margin-left: 15px; float: right; position: relative; top:-40px; display: none;'>
#               <span class='label_for_order_form'> Custom Size</span> <span class='required'>*</span>
#               <br />
#               <input class='form_style' name='lrgFormatBnW[<%= newId %>][custom-size]' type='text' style='width: 165px;'>
#             </div>
#           </div>
#         </div>      
#       </div>
#   "

# template = _.template(addedLargeFormatBlackWhite)

# getNewId = ->
#   newId = new Date().getTime()
#   newId

# $(".addLargeFormatBlackWhite").live "click", (e) ->
#   e.preventDefault()
#   newId = getNewId()
#   compiled_template = template(newId: newId)
#   $(compiled_template).hide().prependTo(".jobTypeForm:first").slideDown "slow"








# $(".addScanningArchiving").live "click", (event) ->
#   event.preventDefault()
#   addedScanningArchiving = 
#   "
#    <div class='jobTypeForm' style='display: none'>
#     <h2 class='order_form_header' style='margin-left: 14px;'> SCANNING &#38; ARCHIVING</h2>
#     <div class='form_background' style='height: 160px;'>
#       <button class='closeBtn'>
#         remove
#       </button>
#       <span class='label_for_order_form label_fn'>Description/File Name</span> <span class='required'>*</span>
#       <br />
#       <input class='form_style input_fn' for='descfilename' name='descfilename' type='text'>
#       <br />
#       <br />
#       <div class='form_field float-left'>
#         <span class='label_for_order_form'> File Type</span> <span class='required'>*</span>
#         <br />
#         <select class='order_form float-left'>
#           <option value='BlackWhitePDF'> Black &#38; White PDF </option>
#           <option value='ColorPDF'> Color PDF </option>
#           <option value='BlackWhiteTIFF'> Black &#38; White TIFF </option>
#           <option value='ColorTIFF' Color TIFF </option>
#         </select>
#         <br />
#         <br />
#         <div class='form_field float-left'>
#           <span class='label_for_order_form'> File Delivery</span> <span class='required'>*</span>
#           <br />
#           <select class='order_form fileDelivery'>
#             <option value='burncddvdrom'> Burn CD/DVD ROM </option>
#             <option value='viaftp'> Via FTP </option>
#           </select>
#           <div class='form_field emailFTP' style='display: none; position: relative; right: -15px;'>
#             <span class='label_for_order_form'> Email</span> <span class='required'>*</span>
#             <br />
#             <input class='form_style' name='nooforiginals' type='email'>
#           </div>
#         </div>
#       </div>
#     </div>
#   </div>
#   "
#   $(addedScanningArchiving).appendTo('.jobtype').hide().fadeIn()