<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp,container-queries"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400..900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Sono:wght@200..800&display=swap" rel="stylesheet">

    <style>
        .sono-gfont {
            font-family: "Sono", monospace;
            font-optical-sizing: auto;
            font-weight: 800;
            font-style: normal;
            font-variation-settings: "MONO" 1;
        }
        .login_card {
            transition: transform .9s;
        }
        .login_card:hover{
            /* border : 4px solid rgb(212, 73, 73); */
            border : 4px solid #f36d06;
            transition: transform 0.2s;
            transform: scale(1.05);
        }
    </style>

</head>


<body style="background-image: linear-gradient(90deg, #0f172a 0%, #20307e 86%)">
    <div class="container">
        <div class="row">
            <%@ include file="navbar.jsp" %>
        </div>
        <br><br><br>

        <div class="row">
            <div class="w-full flex items-center justify-center p-4">
                <div class="m-8 p-4 h-full flex flex-col items-center justify-center w-full">
                    <div id="wtl" class="responsive-text text-white text-center w-full mb-4 flex-grow">
                        <p class="xl:text-4xl font-bold">LOG IN TO YOUR ACCOUNT</p>
                        <hr class=" sm:w-52 md:w-1/2 border-t-4 my-2 mx-auto border-orng">
                        <p class="xl:text-2xl font-semibold">SELECT USER TYPE</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="flex flex-wrap justify-center">
            <!-- candidate -->
            <div class="w-full sm:w-1/2 md:w-1/3 lg:w-1/4 p-4">
                <div class="m-8 max-w-sm bg-white border border-gray-200 rounded-lg shadow dark:bg-gray-900 dark:border-gray-700 login_card">
                    <a href="signin.do">
                        <div class="m-8 flex flex-col items-center pb-10">
                            <img class="m-8 w-32 h-32 mb-3  shadow-lg" src="static/media/images/candidate.png" alt="Bonnie image" />
                            <h5 class="sono-gfont m-8 mb-1 text-xl font-medium text-gray-900 dark:text-white">candidate</h5>
                            <span class="m-8 text-sm text-gray-500 dark:text-gray-400">-------</span>
                        </div>
                    </a>
                </div>
            </div>

            <!-- librarian -->
            <div class=" w-full sm:w-1/2 md:w-1/3 lg:w-1/4 p-4">
                <div  class="m-8 max-w-sm bg-white border border-gray-200 rounded-lg shadow dark:bg-gray-900 dark:border-gray-700 login_card">
                    <a href="login.jsp">
                        <div class="m-8 flex flex-col items-center pb-10">
                            <img class="m-8 w-32 h-32 mb-3 rounded-lg shadow-lg" src="static/media/images/librarian.png"
                                alt="Bonnie image" />
                            <h5 class="sono-gfont m-8 mb-1 text-xl font-medium text-gray-900 dark:text-white">librarian</h5>
                            <span class="m-8 text-sm text-gray-500 dark:text-gray-400">-------</span>
                        </div>
                    </a>
                </div>
            </div>
            <!-- library -->
            <div class=" w-full sm:w-1/2 md:w-1/3 lg:w-1/4 p-4">
                <div class="max-w-sm m-8 bg-white border border-gray-200 rounded-lg shadow dark:bg-gray-900 dark:border-gray-700 login_card">
                    <a href="login.jsp">
                        <div class="flex m-8 flex-col items-center pb-10">
                            <img class="m-8 w-32 h-32 mb-3 rounded-lg shadow-lg" src="static/media/images/library.png"
                                alt="Bonnie image" />
                            <h5 class="sono-gfont m-8 mb-1 text-xl font-medium text-gray-900 dark:text-white">library
                            </h5>
                            <span class="m-8 text-sm text-gray-500 dark:text-gray-400">-------</span>
                        </div>
                    </a>
                </div>
            </div>

            <!-- publisher -->
            <div class="w-full sm:w-1/2 md:w-1/3 lg:w-1/4 p-4">
                <div class="m-8 max-w-sm bg-white border border-gray-200 rounded-lg shadow dark:bg-gray-900 dark:border-gray-700 login_card">
                    <a href="login.jsp">
                        <div class="flex flex-col items-center m-8 pb-10">
                            <img class="m-8 w-32 h-32 mb-3 rounded-lg  shadow-lg" src="static/media/images/publisher.png"
                                alt="Bonnie image" />
                            <h5 class="sono-gfont m-8 mb-1 text-xl font-medium text-gray-900 dark:text-white">publisher
                            </h5>
                            <span class="text-sm text-gray-500 m-8 dark:text-gray-400">-------</span>
                        </div>
                    </a>
                </div>
            </div>

        </div>


    </div>
</body>

<script>
    tailwind.config = {
      theme: {
        extend: {
          colors: {
            orng: '#f36d06',
            clifford: '#da373d',
          }
        }
      }
    }
  </script>
</html>