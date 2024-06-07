<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp,container-queries"></script>
    

</head>
<body style="background-image: linear-gradient(90deg, #0f172a 0%, #20307e 86%)">
    <div class="container">
        <div class="row">
            <%@ include file="navbar.jsp" %>
        </div>
    </div>
    <br><br><br><br>


    <div class="container mx-auto p-4">
        <div class="flex justify-center mb-4">
            <img src="${param.img}" alt="check mail" class="block mx-auto w-2/12 ">
        </div>
        <div class="flex justify-center">
            <p class="${param.color} text-center font-bold text-3xl">
                ${param.message}
            </p>
        </div>
    </div>
    
    
</body>
</html>