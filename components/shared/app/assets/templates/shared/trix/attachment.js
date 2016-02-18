(function() {
  var createStorageKey, host, uploadAttachment;

  document.addEventListener("trix-attachment-add", function(event) {
    var attachment;
    attachment = event.attachment;
    if (attachment.file) {
      return uploadAttachment(attachment);
    }
  });

  host = "http://extranet.localhost.df.gov.br:3000/arquivos/upload_file/";

  uploadAttachment = function(attachment) {
    var file, form, key, xhr;
    file = attachment.file;
    key = createStorageKey(file);
    form = new FormData;
    form.append("key", key);
    form.append("Content-Type", file.type);
    form.append("image[file_path]", file);
    xhr = new XMLHttpRequest;
    xhr.open("POST", host, true);
    xhr.upload.onprogress = function(event) {
      var progress;
      progress = event.loaded / event.total * 100;
      if(xhr.response == "false") {
        console.log(attachment)
        return attachment.setUploadProgress(0);
      } else {
        return attachment.setUploadProgress(progress);
      }
    };
    xhr.onload = function() {
      var href, url;
      if (xhr.response != "false") {
        url = href = host + key;
        return attachment.setAttributes({
          url: xhr.responseText,
          href: xhr.responseText
        });
      } else {
        alert('arquivo inválido, favor inserir arquivos JPG, PNG ou BMP. Para outros tipos de arquivos use o gerenciador de arquivos')
        return attachment.setUploadProgress(0);
      }
    };
    return xhr.send(form);
  };

  createStorageKey = function(file) {
    var date, day, time;
    date = new Date();
    day = date.toISOString().slice(0, 10);
    time = date.getTime();
    return "tmp/" + day + "/" + time + "-" + file.name;
  };

}).call(this);