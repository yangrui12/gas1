$(function(){
  $("#docFile").fileinput({
    showPreview : true,
    showUpload : false,
    showRemove : false,
    allowedFileExtensions : [ "jpg", "png", "gif", "doc", "docx", "ppt"],
    elErrorContainer : "#docFileError",
    browseClass : "btn btn-success",
    browseLabel : "浏览文件",
    browseIcon : '<i class="glyphicon glyphicon-search"></i>',
    removeClass : "btn btn-danger",
    removeLabel : "删除",
    removeIcon : '<i class="glyphicon glyphicon-trash"></i>'
  });
});
