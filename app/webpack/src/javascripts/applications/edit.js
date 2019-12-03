$(document).ready( () => {

  // clickable row - go to application view page
  $(".clickable-row").click(function() {
    return window.location = $(this).data("href");
  });

    // selectable row - select rows of applications to submit
    var selections = [];
    var decision;

    $(function(){
      $('#selectable').selectable({
        filter:'tr',
        cancel: 'a',
        selected: function(event, ui){
          console.log(event);
          console.log(ui);
          var s=$(this).find('.ui-selected');
          console.log(s);
        }
      })
    });

    // select action
    
    $(function(){
      $('#accept').click(function(){
        $('#actionName').attr("value", "Zaakceptuj");
        $('#actionName').removeAttr("disabled");
        $('#actionName').attr("type", "submit");
        decision = "accept";
        $("[name=decision]").attr("value", "accept");
      }
      );
    });

    $(function(){
      $('#reject').click(function(){
        $('#actionName').attr("value", "Odrzuć");
        $('#actionName').removeAttr("disabled");
        $('#actionName').attr("type", "submit");
        decision = "reject";
        $("[name=decision]").attr("value", "reject");
      }
      );
    });

    $(function(){
      $('#pend').click(function(){
        $('#actionName').attr("value", "Oczekuj");
        $('#actionName').removeAttr("disabled");
        $('#actionName').attr("type", "submit");
        decision = "pend";
        $("[name=decision]").attr("value", "pend");
      }
      );
    });

    $(function(){
      $('#delete').click(function(){
        $('#actionName').attr("value", "Usuń");
        $('#actionName').removeAttr("disabled");
        $('#actionName').attr("type", "submit");
        decision = "delete"
        $("[name=decision]").attr("value", "delete");
      }
      );
    });

    $(function(){ 
      $("#selectable").selectable({
         selected: function(event, ui){
           selections.push(ui.selected.id);
           console.log(selections);
        $("[name=selections]").attr("value", selections);
         }
  ,
         unselecting: function(event, ui){
           var index = selections.indexOf(ui.unselecting.id)
           if (index > -1) {
             selections.splice(index, 1);
           }
           console.log(selections);
        $("[name=selections]").attr("value", selections);
         }
      });
    });
});
