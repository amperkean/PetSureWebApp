<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="petsurweb.index" %>

<!DOCTYPE html>
<html lang="en" ng-app="app">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">
    <title>Technical Examination</title>

    <script src="Scripts/jquery-3.1.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <link href="styles/bootstrap.min.css" rel="stylesheet" />
    <link href="styles/jumbotron-narrow.css" rel="stylesheet" />
    <script src="Scripts/angular.min.js"></script>
    <script src="app/app.js"></script>
    <script src="Scripts/dropzone.js"></script>
   <%-- <script src="app/app.module.js"></script>
    <script src="app/main.js"></script>--%>
    <style type="text/css">
        /*table layout - last column*/
table tr td:last-child {
    white-space: nowrap;
    width: 1px;
    text-align:right;
}

/* layout.css Style */
.upload-drop-zone {
  height: 200px;
  border-width: 2px;
  margin-bottom: 20px;
}

/* skin.css Style*/
.upload-drop-zone {
  color: #ccc;
  border-style: dashed;
  border-color: #ccc;
  line-height: 200px;
  text-align: center
}
.upload-drop-zone.drop {
  color: #222;
  border-color: #222;
}



.image-preview-input {
    position: relative;
    overflow: hidden;
	margin: 0px;    
    color: #333;
    background-color: #fff;
    border-color: #ccc;    
}
.image-preview-input input[type=file] {
	position: absolute;
	top: 0;
	right: 0;
	margin: 0;
	padding: 0;
	font-size: 20px;
	cursor: pointer;
	opacity: 0;
	filter: alpha(opacity=0);
}
.image-preview-input-title {
    margin-left:2px;
}
.progressBar {
    width: 100px;
    height: 22px;
    border: 1px solid #ddd;
    border-radius: 5px; 
    overflow: hidden;
    display:inline-block;
    margin:0px 10px 5px 5px;
    vertical-align:top;
}
 
.progressBar div {
    height: 100%;
    color: #fff;
    text-align: right;
    line-height: 22px; 
    width: 0;
    background-color: #0ba1b5; border-radius: 3px; 
}
.statusbar
{
    border-top:1px solid #A9CCD1;
    min-height:25px;
    /*width:700px;*/
    padding:10px 10px 0px 10px;
    vertical-align:top;
}
.statusbar:nth-child(odd){
    background:#EBEFF0;
}
.filename
{
display:inline-block;
vertical-align:top;
width:250px;
}
.filesize
{
display:inline-block;
vertical-align:top;
color:#30693D;
width:100px;
margin-left:10px;
margin-right:5px;
}
.abort{
    background-color:#A8352F;
    -moz-border-radius:4px;
    -webkit-border-radius:4px;
    border-radius:4px;display:inline-block;
    color:#fff;
    font-family:arial;font-size:13px;font-weight:normal;
    padding:4px 15px;
    cursor:pointer;
    vertical-align:top
    }
    </style>
   
</head>
<body ng-controller="PetsController">
    <div class="container">
        <div class="header clearfix">
            <nav>
                <ul class="nav nav-pills pull-right">
                    <!--<li role="presentation" class="active"><a href="#">Home</a></li>
                    <li role="presentation"><a href="#">About</a></li>
                    <li role="presentation"><a href="#">Contact</a></li>-->
                </ul>
            </nav>
            <h3 class="text-muted">PetSure</h3>
        </div>
        <div class="jumbotron">
            <h1>Make a Claim </h1>
            <p class="lead">Make a Claim for your pet</p>
            <div class="dropdown">
                <button  class="btn btn-primary dropdown-toggle" type="button" id="petsDropDown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                    Pets
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" aria-labelledby="petsDropDown" >
                    <li ng-repeat="x in pets" ><a href="#" class="dropdownClass">{{x.PetName}}</a></li>
            
                </ul>
            </div>
            <hr />
            <div class="row">
            <div class="col-lg-12">
                <p style="float:left;" class="text-muted" id="notifMsg"></p>
            </div>
                </div>
            <div class="row">
                 <div class="col-lg-12">
                	<div class="panel panel-default">
				<div class="panel-heading"><strong>Upload Invoice</strong> <small> </small></div>
				<div class="panel-body">
		
		
					
					<br />
					
		
					<div class="upload-drop-zone" id="drop-zone"> Or drag and drop files here </div>
                    <div id="status1"></div>
					<br />
				       <button type="button" class="btn btn-success btn-lg" id="btnsubmit">
                      Submit
                    </button>
                    <button type="button" class="btn btn-link">Or save later</button>
					<br />
				</div>
			</div>
            </div>
            </div>
           
        </div>
        
           
       
        <footer class="footer">
            <p>&copy; 2017 Kean B. Amper</p>
        </footer>
    </div> <!-- /container -->
  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Congratulations!</h4>
      </div>
      <div class="modal-body">
        <p class="text-primary" id="gratslabel"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default"  data-dismiss="modal">Close</button>
        
      </div>
    </div>
  </div>
</div>

 
</body>
    <script type="text/javascript">
        $(document).ready(function() 
        {
            $('#notifMsg').text('Please select a pet first');
            $("ul.dropdown-menu").on("click", "li", function () {
                var selText = $(this).find("a.dropdownClass").text();
                $('#petsDropDown').html(selText);
                $('#notifMsg').text('Attach '+  selText +'\'s invoice for us here');
                });
        });
        var obj = $("#drop-zone");
        obj.on('dragenter', function (e) {

            e.stopPropagation();
            e.preventDefault();
            $(this).css('border', '2px solid #0B85A1');
            console.log('dragenter');
        });
        obj.on('dragover', function (e) {
            e.stopPropagation();
            e.preventDefault();
            console.log('dragover');
        });
        obj.on('drop', function (e) {

            $(this).css('border', '2px dotted #0B85A1');
            e.preventDefault();
            var files = e.originalEvent.dataTransfer.files;
            handleFileUpload(files, obj);
            console.log('drop');
        });
        $(document).on('dragenter', function (e) {
            e.stopPropagation();
            e.preventDefault();
        });
        $(document).on('dragover', function (e) {
            e.stopPropagation();
            e.preventDefault();
            obj.css('border', '2px dotted #0B85A1');
        });
        $(document).on('drop', function (e) {
            e.stopPropagation();
            e.preventDefault();
        });
        function handleFileUpload(files, obj) {
            for (var i = 0; i < files.length; i++) {
                var fd = new FormData();
                fd.append('file', files[i]);

                var status = new createStatusbar(obj); 
                status.setFileNameSize(files[i].name, files[i].size);
                sendFileToServer(fd, status);

            }
        }
        function sendFileToServer(formData, status) {
            var uploadURL = "http://localhost:55434/api/upload/postupload"; //Upload URL
            var extraData = {}; //Extra Data.
            var jqXHR = $.ajax({
                xhr: function () {
                    var xhrobj = $.ajaxSettings.xhr();
                    if (xhrobj.upload) {
                        xhrobj.upload.addEventListener('progress', function (event) {
                            var percent = 0;
                            var position = event.loaded || event.position;
                            var total = event.total;
                            if (event.lengthComputable) {
                                percent = Math.ceil(position / total * 100);
                            }
                            //Set progress
                            status.setProgress(percent);
                        }, false);
                    }
                    return xhrobj;
                },
                url: uploadURL,
                type: "POST",
                contentType: false,
                processData: false,
                cache: false,
                data: formData,
                success: function (data) {
                    console.log(data);
                    status.setProgress(100);

                    $("#status1").append("File upload Done<br>");           
                }, error: function (err) {
                    console.log('error');
                        console.log(err);
                }
            });

            status.setAbort(jqXHR);
        }
        var rowCount = 0;
        function createStatusbar(obj) {
            rowCount++;
            var row = "odd";
            if (rowCount % 2 == 0) row = "even";
            this.statusbar = $("<div class='statusbar " + row + "'></div>");
            this.filename = $("<div class='filename'></div>").appendTo(this.statusbar);
            this.size = $("<div class='filesize'></div>").appendTo(this.statusbar);
            this.progressBar = $("<div class='progressBar'><div></div></div>").appendTo(this.statusbar);
            this.abort = $("<div class='abort'> <a href='#'>Abort</a></div>").appendTo(this.statusbar);
            obj.after(this.statusbar);

            this.setFileNameSize = function (name, size) {
                var sizeStr = "";
                var sizeKB = size / 1024;
                if (parseInt(sizeKB) > 1024) {
                    var sizeMB = sizeKB / 1024;
                    sizeStr = sizeMB.toFixed(2) + " MB";
                }
                else {
                    sizeStr = sizeKB.toFixed(2) + " KB";
                }

                this.filename.html(name);
                this.size.html(sizeStr);
            }
            this.setProgress = function (progress) {
                var progressBarWidth = progress * this.progressBar.width() / 100;
                this.progressBar.find('div').animate({ width: progressBarWidth }, 10).html(progress + "% ");
                if (parseInt(progress) >= 100) {
                    this.abort.hide();
                }
            }
            this.setAbort = function (jqxhr) {
                var sb = this.statusbar;
                this.abort.click(function () {
                    jqxhr.abort();
                    sb.hide();
                });
            }
        }

        $('#btnsubmit').on('click', function (e) {


            var resultArray = [];
            var selText = $('#petsDropDown').text();
            $('.filename').each(function () {
                resultArray.push($(this).text());
            });
            //validate
            if (resultArray.length <= 0) {
                
                $('#gratslabel').text('Please upload a file');
                $('#myModalLabel').text('Ooop!');
              
            } else if (selText == '' || selText == 'Pets') {

                $('#gratslabel').text('Please choose a pet first');
                $('#myModalLabel').text('Ooop!');

            } else {
                var invoices = '';
                for (i = 0; i < resultArray.length; i++) {
                    invoices += resultArray[i] + ",";
                }
                invoices = invoices.substring(0, invoices.length - 1);
                $('#gratslabel').text('Thank you for submitting {' + invoices + '} for pet [' + selText + ']');
                $('#myModalLabel').text('Congratulations!');
            }
            $('#myModal').modal('show');
        });
    </script>
</html>

