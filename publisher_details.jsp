<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
        <link href="https://fonts.googleapis.com/css2?family=Sono:wght@200..800&display=swap" rel="stylesheet">

        <script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>
        <link rel="stylesheet" href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css" type="text/css" />
        
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

            .login_card:hover {
                /* border : 4px solid rgb(212, 73, 73); */
                color: #e9a673;
                /* color: #c66f2c; */
                border: 4px solid #f36d06;
                transition: transform 0.2s;
                transform: scale(1.05);
            }
        </style>

    </head>


    <body style="background-image: linear-gradient(90deg, #0f172a 0%, #20307e 86%)">

        <div class="container">
            <div class="row">
                <%@ include file="publisher_navbar.jsp" %>
            </div>
            <br><br><br>

            <div class="row">
                <div class="w-full flex items-center justify-center p-4">
                    <div class="m-8 p-4 h-full flex flex-col items-center justify-center w-full">
                        <div id="wtl" class="responsive-text text-white text-center w-full mb-4 flex-grow">
                            <p class="xl:text-4xl font-bold">FILL PUBLISHER DETAILS</p>
                            <hr class=" sm:w-52 md:w-1/2 border-t-4 my-2 mx-auto border-orng">
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <!-- profilePic_upload -->
                <div class="col max-w-lg mx-auto">
                    <form action="publisher_profilePic_upload.do" id="libraryProfilePic" style="background-image: linear-gradient(90deg, #1a2662f9 0%, #1f2b6af9 86%)" class="dropzone rounded-xl border-orngl border-3 border-dashed max-w-lg mx-auto">
                        <input type="hidden" name="user_type_id" id="user_type_id" value="${param.user_type_id}">
                    </form>
                    <div class="text-white text-center w-full mb-4 flex-grow" style="display: flex; justify-content: flex-end;">
                        <button type="button" id="upload_btn" class="text-white bg-orngl1 hover:bg-orngl1 focus:ring-2 focus:outline-none  font-medium rounded-lg text-sm px-4 py-2 text-center  dark:focus:ring-orng" >Upload</button>
                    </div>
                </div>
                
                <br>
                
                <form action="publisher_details.do" method="post" class="max-w-lg mx-auto">
                    

                    <!-- established_on -->
                    <div class="relative z-0 w-full mb-6 group">
                        <input type="date" name="dob" id="dob" placeholder="" required class="block py-4 px-0 w-full text-lg text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-orngl dark:focus:border-orng focus:outline-none focus:ring-0 focus:border-blue-600 peer" />
                        <label for="dob" class="peer-focus:font-medium absolute text-lg text-gray-500 dark:text-white duration-300 transform -translate-y-8 scale-75 top-4 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 rtl:peer-focus:left-auto peer-focus:text-blue-600 peer-focus:dark:text-white peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-8">
                            Establishment Date
                        </label>
                    </div>


                    <!-- details -->
                    <div class="relative z-0 w-full mb-6 group">
                        <textarea name="details" placeholder="Details" id="details" rows="1" col="30" style="background-image: linear-gradient(90deg, #152056f9 0%, #1b286af9 86%)" class="block placeholder-slate-50 rounded-lgform-control block py-4 px-0 w-full text-lg text-gray-800 border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-orngl dark:focus:border-orng focus:outline-none focus:ring-0 focus:border-blue-600 peer"></textarea>
                    </div>
                    
                    <!-- website -->
                    <div class="relative z-0 w-full mb-6 group">
                        <input type="url" name="website" id="website" placeholder="" class="block py-4 px-0 w-full text-lg text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-orngl dark:focus:border-orng focus:outline-none focus:ring-0 focus:border-blue-600 peer" />
                        <label for="website" class="peer-focus:font-medium absolute text-lg text-gray-500 dark:text-white duration-300 transform -translate-y-8 scale-75 top-4 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 rtl:peer-focus:left-auto peer-focus:text-blue-600 peer-focus:dark:text-white peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-8">
                            Website
                        </label>
                    </div>

                    <div class="text-white text-center w-full mb-4 flex-grow">
                        <button type="submit"
                            class="text-white bg-orng hover:bg-orng1 focus:ring-2 focus:outline-none  font-medium rounded-lg text-sm px-4 py-2 text-center  dark:focus:ring-orng">
                            Save Details
                        </button>
                    </div>

                </form>
            </div>
        </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"> </script>
    <script>

        Dropzone.autoDiscover = false;

        const dropzone = new Dropzone('#libraryProfilePic', {
            maxFiles: 1,
            maxFilesize: 1,
            acceptedFiles: '.png,.jpg',
            autoProcessQueue: false
        });

        const upload_btn = document.querySelector('#upload_btn');
        
        upload_btn.addEventListener('click', () => {
            dropzone.processQueue();
        });
        
    </script>

    <!-- customisation -->
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        orng: '#f36d06',
                        orngl: '#e9a673',
                        orngl1: '#c66f2c',

                        clifford: '#da373d',
                    }
                }
            }
        }
    </script>

    </body>
    </html>