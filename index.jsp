<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>LMS</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp,container-queries"></script>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400..900&display=swap" rel="stylesheet">

  <style>
    @media (max-width: 767px) {
      .responsive-text {
        flex-grow: 1;
        display: flex;
        flex-direction: column;
        justify-content: start;
        font-size: 3rem;
        font-family: "Orbitron", sans-serif;
        font-optical-sizing: auto;
        font-weight: 400;
        font-style: normal;
        color: whitesmoke;
      }
    }

    @media (min-width: 768px) {
      .responsive-text {
        color: #f6974e;
        flex-grow: 1;
        display: flex;
        flex-direction: column;
        justify-content: start;
        font-size: 6rem;
        font-family: "Orbitron", sans-serif;
        font-optical-sizing: auto;
        font-weight: 400;
        font-style: normal;
        color: whitesmoke;
      }
    }
  </style>

</head>


<body style="background-image: linear-gradient(90deg, #0f172a 0%, #20307e 86%)">
  <div class="container">
    <div class="row">
      <%@ include file="navbar.jsp"%>
    </div>

    <br><br><br>

    <main class="flex-1 p-4 flex items-center justify-center">
      <div class="container mx-auto flex flex-col md:flex-row">

        <div class="w-full md:w-1/2 flex items-center justify-center p-4">
          <div class="p-4 h-full flex flex-col items-center justify-center w-full">
            <div id="wtl" class="responsive-text text-center w-full mb-4 flex-grow">
              <p class="font-semibold">WELCOME</p>
              <p class="font-semibold">TO</p>
              <p class="font-semibold">LMS</p>
            </div>

            <div class="text-white text-center w-full mb-4 flex-grow">
              <a href="getstarted.do">
                <button type="button" class="text-white bg-orng hover:bg-orng1 focus:ring-2 focus:outline-none  font-medium rounded-lg text-sm px-4 py-2 text-center  dark:focus:ring-orng">Get started</button>
              </a>
            </div>

            <div class="text-white text-4xl text-center w-full mb-4 flex-grow">
              <p>Start Education With Our Platform</p>
            </div>
          </div>
        </div>

        <div class="w-full md:w-1/2 flex items-center justify-center p-4">
          <div class=" p-4 h-full flex items-center justify-center w-full">
            <img src="static/media/images/file (3).png" alt="Image description" class="max-w-full h-auto">
          </div>
        </div>

      </div>
    </main>

  </div>
</body>



<script>
  tailwind.config = {
    theme: {
      extend: {
        colors: {
          orng: '#f36d06',
          orng1:'#f6974e',
          clifford: '#da373d',
        },
        width: {
          '40': '40%;',
        }
      }
    }
  }
</script>
</html>