/*-
* Custom Js methods are binded under namespace
* You can't acccess any method without namespace
* To access a method just type -- SnmJs.custom.methodname(<parameters>)
* Methods are relating to control common product behaviour
-*/

var SnmJS = SnmJS || {};
SnmJS = (function($, window, document, snm){
  snm.custom ={
    portfolioModalController: function(){
      $("#portfolioModal").on("show.bs.modal", function(e) {
        // var link = $(e.relatedTarget);
        $(this).find(".modal-content").load($(e.relatedTarget).attr("href"));
      });
    },
    textEditorController: function(){
      $('#editor').summernote({
        height: 250
      });

      $(document).on("keyup", ".panel-body", function(e){
        data = $("#editor").val();
        if(data != "" && data != "<br>"){
          $("#editor-preview #data").html(data);
          $("#editor-preview #header").html("Preview");
        }else{
          $("#editor-preview #data").html("");
          $("#editor-preview #header").html("");
        }
      });
    },
    getEditorData: function(){
      return $('#editor').summernote();
    },
    blogCommentController: function(){
      $(document).on("click", ".write-a-comment", function(event){
        $("#comment_nested").val($(this).attr("data-nested"));
        $("#comment_nested_id").val($(this).attr("data-nested-id"));
      });
    },

    signinModalController: function(){
      $("#signin-modal").on("show.bs.modal", function(e) {
        $(this).find(".modal-content").load($(e.relatedTarget).attr("href"));
      });
      if(window.location.href.indexOf("signin=true") > 0){
        $("#signin").trigger("click");
      }
    },

    BlogAdvanceSearchModalController: function(){
      $("#advance-search-modal").on("show.bs.modal", function(e) {
        $(this).find(".modal-content").load($(e.relatedTarget).attr("href"));
      });
      $("#advance-search-modal").on("shown.bs.modal", function(e) {
        SnmJS.custom.dateTimePickerController("from-date-timepicker");
        SnmJS.custom.dateTimePickerController("to-date-timepicker");
      });
    },

    cunstructFlashMessageController: function(container_class, message_class, flash_message){
      $(document).find("."+container_class).html("<div class='alert-alert "+message_class+" flash_message'>"+flash_message+"</div>");
    },

    cunstructErrorMessageController: function(container_class, message_class, flash_message){
      $(document).find("."+container_class).html(flash_message);
    },


    CommonMethodController: function(){
      $(".flash_message").delay(5000).hide(3000);
    },

    dateTimePickerController: function(picker_container_id){
      $('#'+picker_container_id).datetimepicker({
        use24hours: true,
        format : 'yyyy-mm-dd HH:mm:ss'
      });
    }
  };
  return snm;
})(jQuery, this, this.document, SnmJS);
$(document).ready(function(){
  SnmJS.custom.portfolioModalController();
  SnmJS.custom.textEditorController();
  SnmJS.custom.blogCommentController();
  SnmJS.custom.signinModalController();
  SnmJS.custom.BlogAdvanceSearchModalController();
  SnmJS.custom.CommonMethodController();
  SnmJS.custom.cunstructFlashMessageController();
   SnmJS.custom.cunstructErrorMessageController();
})