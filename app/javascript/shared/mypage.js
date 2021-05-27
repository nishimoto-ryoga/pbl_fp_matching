$(function() {
  $('h1').on('click', function () {
    $("h1").css("color", "red");
  });
});

// 編集エリア表示
$(function () {
  $(".btn_edit").on("click", function () {  
    const Name = $(".name");                
    const ButtonEdit = $(".btn_edit");      
    const TextArea = $(".name_text");       
    const Button = $('.btns');              

    Name.hide();
    ButtonEdit.hide();
    TextArea.show();
    Button.show();
  });
});

// 編集エリア非表示
$(function () {
  $(".btn_cancel").on("click", function () {
    const Name = $(".name");                
    const ButtonEdit = $(".btn_edit");      
    const TextArea = $(".name_text");       
    const Button = $('.btns');              

    Name.show();
    ButtonEdit.show();
    TextArea.hide();
    Button.hide();
  });
});

// planner側の編集内容更新
$(function () {
  $(".btn_update").on("click", function () {
    const textArea = $(".name_text");       
    const body = textArea.val();
    const plannerId = $(".current_planner_id").val();

    $.ajax({
      url: '/planners/' + plannerId, 
      type: 'PATCH',                 
      data: {                        
        planner: {
          name: body
        }
      }
    })

    .done(function (data) {
      const name = $(".name");                
      const buttonEdit = $(".btn_edit");      
      const textArea = $(".name_text");       
      const button = $('.btns');              

      name.show();
      name.text(data.name);
      buttonEdit.show();
      textArea.hide();
      button.hide();
    })
  });
});

// client側の編集内容更新
$(function () {
  $(".btn_update_client").on("click", function () {
    const textArea = $(".name_text");       
    const body = textArea.val();
    const clientId = $(".current_client_id").val();

    $.ajax({
      url: '/clients/' + clientId, 
      type: 'PATCH',                 
      data: {                        
        client: {
          name: body
        }
      }
    })

    .done(function (data) {
      const name = $(".name");                
      const buttonEdit = $(".btn_edit");      
      const textArea = $(".name_text");       
      const button = $('.btns');              

      name.show();
      name.text(data.name);
      buttonEdit.show();
      textArea.hide();
      button.hide();
    })
  });
});
