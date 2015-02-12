if $("form fieldset .next, form fieldset .previous").length
  formstep =
    animating: false #flag to prevent quick multi-click glitches
    next: (event) ->
      return false if @animating
      @animating = true
      current_fs = $(event.target).parents("fieldset")
      next_fs = $(event.target).parents("fieldset").next()
      
      #activate next step on formprogress using the index of next_fs
      $("#formprogress li").eq($("fieldset").index(next_fs)).addClass "active"
      
      #show the next fieldset
      next_fs.show()
      
      #hide the current fieldset with style
      current_fs.animate
        opacity: 0
      ,
        step: (now, mx) ->
          
          #as the opacity of current_fs reduces to 0 - stored in "now"
          #1. scale current_fs down to 80%
          scale = 1 - (1 - now) * 0.2
          
          #2. bring next_fs from the right(50%)
          left = (now * 50) + "%"
          
          #3. increase opacity of next_fs to 1 as it moves in
          opacity = 1 - now
          current_fs.css transform: "scale(" + scale + ")"
          next_fs.css
            left: left
            opacity: opacity

        duration: 200
        complete: =>
          current_fs.parents("form").css "height", ""
          next_fs.parents("form").height next_fs.outerHeight() + next_fs.parents("form").height() + 60
          current_fs.hide()
          @animating = false
          return
    prev: (event) ->
      return false  if @animating
      @animating = true
      current_fs = $(event.target).parents("fieldset")
      previous_fs = $(event.target).parents("fieldset").prev()
      
      #de-activate current step on formprogress
      $("#formprogress li").eq($("fieldset").index(current_fs)).removeClass "active"
      
      #show the previous fieldset
      previous_fs.show()
      
      #hide the current fieldset with style
      current_fs.animate
        opacity: 0
      ,
        step: (now, mx) ->
          
          #as the opacity of current_fs reduces to 0 - stored in "now"
          #1. scale previous_fs from 80% to 100%
          scale = 0.8 + (1 - now) * 0.2
          
          #2. take current_fs to the right(50%) - from 0%
          left = ((1 - now) * 50) + "%"
          
          #3. increase opacity of previous_fs to 1 as it moves in
          opacity = 1 - now
          current_fs.css left: left
          previous_fs.css
            transform: "scale(" + scale + ")"
            opacity: opacity

        duration: 200
        complete: =>
          current_fs.parents("form").css "height", ""
          previous_fs.parents("form").height previous_fs.outerHeight() + previous_fs.parents("form").height() + 60
          current_fs.hide()
          @animating = false
          return
    formprogress_width: ->
      $("#formprogress>li").css "width", ->
        "#{1/$('#formprogress>li').length * 100}%"
    reset_form_height: ->
      $("form").css 'height', ''
      $("form").height $("form fieldset:visible").outerHeight() + $("form").height() + 60

  $(".next").click formstep.next
  $(".previous").click formstep.prev
    

  if $("#formprogress").length
    formstep.formprogress_width()
  formstep.reset_form_height()
  (exports ? this).formstep = formstep