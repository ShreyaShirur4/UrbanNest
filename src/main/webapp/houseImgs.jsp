<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>UrbanNest | Register House</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	list-style: none;
}

body {
	background: #f2f2f2;
	font-size: 1;
	line-height: 24px;
}

.wrapper {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background: #2b6777;
	width: 800px;
	height: 680px;
	display: flex;
	justify-content: center;
	border-radius: 16px;
}

.item.images {
	display: grid;
	grid-template-columns: 1fr;
	grid-row-gap: 15px;
	justify-items: center;
	align-items: flex-end;
	color: #f2f2f2;
	font-size: large;
	margin-bottom: 50px;
}

input, select {
	border-radius: 8px;
	height: 30px;
	margin-top: 8px;
}

#selectedImages {
	width: 400px;
	height: 200px;
	position: relative;
	border: 1px solid black;
}

.slide, figure img {
	width: 400px;
	height: 200px;
	position: absolute;
}

button {
	border-radius: 8px;
	width: 80px;
	background-color: transparent;
	color: #f2f2f2;
	border: 2px solid #f2f2f2;
}

.prevnext {
	display: flex;
	justify-content: space-around;
	height: 30px;
	margin-top: 20px;
}

.buttons {
	display: grid;
	grid-template-columns: 1fr 1fr;
	justify-items: center;
	align-items: center;
	margin-bottom: 100px;
}

input[type="submit"], input[type="reset"] {
	margin-right: 8px;
	margin-left: 8px;
	width: 100px;
	color: #f2f2f2;
	background-color: transparent;
	border: 2px solid #f2f2f2
}
</style>
</head>
<body>
	<form method="post" action="houseImagesRegisterServlet"
		enctype="multipart/form-data">
		<div class="wrapper">
			<div class="item images">
				<div class="img1">
					Select Images : <input type="file"
						accept="image/jpg, image/png, image/jpeg"
						placeholder="Select Images" name="images" id="imgInput" multiple
						required onchange="preview()">
					<div id="selectedImages">
						<figure>
							<img src="#" alt="" class="slides" style="display: none;">
							<figcaption></figcaption>
						</figure>
					</div>
					<div class="prevnext">
						<button onclick="slideshow(-1)" type="button">Previous</button>
						<button onclick="slideshow(1)" type="button">Next</button>
					</div>
				</div>
				<div class="buttons">
					<div class="submit">
						<input type="submit" value="Upload">
					</div>
					<div class="reset">
						<input type="reset" value="Clear">
					</div>
				</div>
			</div>
		</div>
	</form>

	<script>
        let fileInput = document.getElementById("imgInput");

        let imageContainer = document.getElementById("selectedImages");
        let numberOfFiles = '${fileInput.files.length}';
        function preview() {
            imageContainer.innerHTML = "";
            numberOfFiles.textContent = '${fileInput.files.length}';
            let cnt = 0;
            for(i of fileInput.files){
                let reader = new FileReader();
                let figure = document.createElement("figure");
                let figcap = document.createElement("figcaption");
                figure.appendChild(figcap);
                reader.onload=()=>{
                    let img = document.createElement("img");
                    img.setAttribute("src",reader.result);
                    img.setAttribute("class","slides");
                    idval = "i"+cnt;
                    console.log(idval);
                    img.setAttribute("id",idval);
                    if(cnt != 0) {
                    img.setAttribute("style","display:none");
                    } else {
                        img.setAttribute("style","display:block");
                    }
                    figure.insertBefore(img,figcap);
                    cnt++;
                }
                imageContainer.appendChild(figure);
                reader.readAsDataURL(i);
            }
        }

        imgcntr = 0;
        function slideshow(change) {
            var filesio = document.getElementById("imgInput");
            var noofimgs = filesio.files.length;
            x = 0;
            imgcntr += change;
            imgcntr %=noofimgs;
            if(imgcntr < 0) {
                imgcntr = noofimgs-1;
            }
            let images = document.querySelectorAll(".slides");
            for(i of images) {
                document.querySelector("#i"+x).style.display="none";
                x++;
            }
            for(i of images){
                let img_id = i.getAttribute("id");
                if(img_id == "i" + imgcntr) {
                    document.querySelector("#"+img_id).style.display="block";
                }
            }
        }
    </script>
</body>
</html>
