// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


$(function() {
	//videoタグを取得
	var video = document.getElementById('camera');
	//カメラが起動できたかのフラグ
	var localMediaStream = null;
	//カメラ使えるかチェック
	var hasGetUserMedia = function() {
		return (navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia);
	};

	//エラー
	var onFailSoHard = function(e) {
		console.log('エラー!', e);
	};

	if(!hasGetUserMedia()) {
		alert("未対応ブラウザです。");
	} else {
		window.URL = window.URL || window.webkitURL;
		navigator.getUserMedia  = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia;
		navigator.getUserMedia({video: true}, function(stream) {
			video.src = window.URL.createObjectURL(stream);
			localMediaStream = stream;
			video.width = 300;
			video.height = 200;
		}, onFailSoHard);
	}

	$("#start").click(function() {
		if (localMediaStream) {
			var canvas = document.getElementById('canvas');
			//canvasの描画モードを2sに
			var ctx = canvas.getContext('2d');
			var img = document.getElementById('img');

			//videoの縦幅横幅を取得
			video.width = 300
			var w = video.width;
			video.height = 300
			var h = video.height;

			//同じサイズをcanvasに指定
			canvas.setAttribute("width", w);
			canvas.setAttribute("height", h);

			//canvasにコピー
			ctx.drawImage(video, 0, 0, w, h);
			//imgにpng形式で書き出し
			img.src = canvas.toDataURL('image/jpeg');
			
		}
	});
	$("#actions").click(function(){
		if (localMediaStream) {
			var canvas = document.getElementById('canvas');
			//canvasの描画モードを2sに
			var ctx = canvas.getContext('2d');
			var img = document.getElementById('img');

			//videoの縦幅横幅を取得
			var w = video.offsetWidth;
			var h = video.offsetHeight;

			//同じサイズをcanvasに指定
			canvas.setAttribute("width", w);
			canvas.setAttribute("height", h);

			//canvasにコピー
			ctx.drawImage(video, 0, 0, w, h);
			//imgにpng形式で書き出し
			img.src = canvas.toDataURL('image/png');
			
		}
	});
	$('#save-button').click(function(){
		var canvas = document.getElementById('canvas');
		// var img = document.getElementById('img');
		// var ctx = canvas.getContext('2d');
		
		var url = canvas.toDataURL('image/jpeg');
		// base64データをblobに変換
    // var blob = dataURLtoBlob(url);
    	// Create new form data
		// var fd = new FormData();
		
		// Append our Canvas image file to the form data
		// fd.append("image", blob);
	
		// And send it
		// $.ajax({
		//   url: "/headlines",
		//   type: "POST",
		//   data: fd,
		//   processData: false,
		//   contentType: false,
		// });
    	// バイナリ形式からURLオブジェクトに変換
	    // var urlfromblob = URL.createObjectURL(blob);
	    // alert(urlfromblob)
		
	
		$("#picture_image_url").val(""); 
		$("#picture_image_url").val(url);
		$("#picture_blobpic").val(""); 
		$("#picture_blobpic").val("");
		$("#new_picture").submit();
	});
});

		

// Base64データをBlobデータに変換
function Base64toBlob(base64)
{
    // カンマで分割して以下のようにデータを分ける
    // tmp[0] : データ形式（data:image/png;base64）
    // tmp[1] : base64データ（iVBORw0k～）
    var tmp = base64.split(',');
    // base64データの文字列をデコード
    var data = atob(tmp[1]);
    // tmp[0]の文字列（data:image/png;base64）からコンテンツタイプ（image/png）部分を取得
		var mime = tmp[0].split(':')[1].split(';')[0];
	    //  1文字ごとにUTF-16コードを表す 0から65535 の整数を取得
		var buf = new Uint8Array(data.length);
		for (var i = 0; i < data.length; i++) {
	        buf[i] = data.charCodeAt(i);
	    }
	    // blobデータを作成
		var blob = new Blob([buf], { type: mime });
	    return blob;
}		

function dataURLtoBlob(dataURL) {
	  // Decode the dataURL
	  var binary = atob(dataURL.split(',')[1]);
	  // Create 8-bit unsigned array
	  var array = [];
	  for(var i = 0; i < binary.length; i++) {
	      array.push(binary.charCodeAt(i));
	  }
	  // Return our Blob object
	  blob = new Blob([new Uint8Array(array)], {type: 'image/jpeg'});
	  return blob;
	}