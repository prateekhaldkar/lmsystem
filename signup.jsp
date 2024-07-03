<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>LMS</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <script
            src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp,container-queries"></script>

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400..900&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Sono:wght@200..800&display=swap" rel="stylesheet">
        <style>
            /* Custom styles for the select dropdown options */
            .custom-select option {
                @apply bg-blue-500 text-white;
            }

            .custom-select option:hover {
                @apply bg-blue-700;
            }
        </style>

        
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
                border: 4px solid #f36d06;
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
                            <p class="xl:text-4xl font-bold">CREAT YOUR ACCOUNT</p>
                            <hr class=" sm:w-52 md:w-1/2 border-t-4 my-2 mx-auto border-orng">
                            <p class="xl:text-2xl font-semibold">
                                <c:choose>
                                    <c:when test="${param.user_type_id==1}">
                                        CANDIDATE
                                    </c:when>
                                    <c:when test="${param.user_type_id==2}">
                                        LIBRARY
                                    </c:when>
                                    <c:when test="${param.user_type_id==3}">
                                        LIBRARIAN
                                    </c:when>
                                    <c:otherwise>
                                        PUBLISHER
                                    </c:otherwise>
                                </c:choose>
                                SIGNUP
                            </p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">

                <form action="signup.do" method="post" class="max-w-lg mx-auto">
                    <input type="hidden" name="user_type_id" id="user_type_id" value="${param.user_type_id}">

                    <!-- Name -->
                    <div class="relative z-0 w-full mb-6 group">
                        <input type="text" name="name" id="name"
                            class="block py-4 px-0 w-full text-lg text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-orngl dark:focus:border-orng focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                            placeholder=" " required />
                        <label for="name"
                            class="peer-focus:font-medium absolute text-lg text-gray-500 dark:text-white duration-300 transform -translate-y-8 scale-75 top-4 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 rtl:peer-focus:left-auto peer-focus:text-blue-600 peer-focus:dark:text-white peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-8">
                            <c:choose>
                                <c:when test="${param.user_type_id==1}">
                                    Candidate
                                </c:when>
                                <c:when test="${param.user_type_id==2}">
                                    Library
                                </c:when>
                                <c:when test="${param.user_type_id==3}">
                                    Librarian
                                </c:when>
                                <c:otherwise>
                                    Publisher
                                </c:otherwise>
                            </c:choose>
                            Name
                        </label>
                    </div>


                    <!-- email -->
                    <div class="relative z-0 w-full mb-6 group">
                        <input type="email" name="email" id="email" placeholder="" required
                            class="block py-4 px-0 w-full text-lg text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-orngl dark:focus:border-orng focus:outline-none focus:ring-0 focus:border-blue-600 peer" />
                        <label for="email"
                            class="peer-focus:font-medium absolute text-lg text-gray-500 dark:text-white duration-300 transform -translate-y-8 scale-75 top-4 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 rtl:peer-focus:left-auto peer-focus:text-blue-600 peer-focus:dark:text-white peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-8">Email
                            address</label>
                    </div>

                    <!-- password -->
                    <div class="relative z-0 w-full mb-6 group">
                        <input type="password" name="password" id="password" placeholder="" required
                            class="block py-4 px-0 w-full text-lg text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-orngl dark:focus:border-orng focus:outline-none focus:ring-0 focus:border-blue-600 peer" />
                        <label for="password"
                            class="peer-focus:font-medium absolute text-lg text-gray-500 dark:text-white duration-300 transform -translate-y-8 scale-75 top-4 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 rtl:peer-focus:left-auto peer-focus:text-blue-600 peer-focus:dark:text-white peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-8">Password</label>
                    </div>

                    <!-- address -->
                    <div class="relative z-0 w-full mb-6 group">
                        <input type="text" name="address" id="address"
                            class="block py-4 px-0 w-full text-lg text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-orngl dark:focus:border-orng focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                            placeholder=" " required />
                        <label for="address"
                            class="peer-focus:font-medium absolute text-lg text-gray-500 dark:text-white duration-300 transform -translate-y-8 scale-75 top-4 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 rtl:peer-focus:left-auto peer-focus:text-blue-600 peer-focus:dark:text-white peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-8">Address</label>
                    </div>

                    <div class="relative z-0 w-full my-2 group">
                        <select name="city_id" id="city_id" class="form-select w-full h-12 bg-transparent bg-bodyblue border border-gray-300 text-white text-sm rounded-lg focus:ring-bodyblue focus:border-bodyblue block w-full p-2.5 dark:bg-bodyblue dark:border-bodyblue dark:placeholder-bodyblue dark:text-white dark:focus:ring-bodyblue dark:focus:border-bodyblue">
                            <option value="">Select City</option>
                            <c:forEach var="city" items="${cities}">
                                <option value="${city.cityId}">${city.city}(${city.state.state})</option>
                            </c:forEach>
                        </select>
                    </div>
                    

                    <!-- phone -->
                    <div class="relative z-0 w-full mb-6 group">
                        <input type="number" name="contact" id="contact" placeholder="" required
                            class="block py-4 px-0 w-full text-lg text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-orngl dark:focus:border-orng focus:outline-none focus:ring-0 focus:border-blue-600 peer" />
                        <label for="contact"
                            class="peer-focus:font-medium absolute text-lg text-gray-500 dark:text-white duration-300 transform -translate-y-8 scale-75 top-4 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 rtl:peer-focus:left-auto peer-focus:text-blue-600 peer-focus:dark:text-white peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-8">Phone
                            number</label>
                    </div>



                    <!-- gender -->
                    <!-- <c:choose>
                        <c:when test="${param.user_type_id==3}">

                            <label for="gender"class="peer-focus:font-medium absolute text-lg text-gray-500 dark:text-white duration-300 transform -translate-y-8 scale-75 top-4 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 rtl:peer-focus:left-auto peer-focus:text-blue-600 peer-focus:dark:text-white peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-8">
                                gender
                            </label>
                            <div class="flex py-4">
                                <div class="pr-5 flex items-center me-4">
                                    <input id="male" type="radio" value="" name="inline-radio-group"
                                        class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600">
                                    <label for="male"
                                        class="ms-2 text-sm font-medium text-gray-900 dark:text-gray-300">Male</label>
                                </div>
                                <div class="px-5 flex items-center me-4">
                                    <input id="female" type="radio" value="" name="inline-radio-group"
                                        class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600">
                                    <label for="female"
                                        class="ms-2 text-sm font-medium text-gray-900 dark:text-gray-300">Female</label>
                                </div>
                                <div class="px-5 flex items-center me-4">
                                    <input id="others" type="radio" value="" name="inline-radio-group"
                                        class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600">
                                    <label for="others"
                                        class="ms-2 text-sm font-medium text-gray-900 dark:text-gray-300">Others</label>
                                </div>
                            </div>
                        </c:when>
                     </c:choose> -->



                    <div class="text-green-400 underline decoration-sky-500 w-full mb-6 group">
                        <a href="login.do?user_type_id=${param.user_type_id}">already have an account</a>
                    </div>

                    <div class="flex flex-col sm:flex-row gap-4">
                        <button type="submit"
                            class=" text-white bg-orngl hover:bg-orng1 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-lg px-48 py-2 text-center dark:bg-orng dark:hover:bg-orngl dark:focus:ring-orngl">
                            creat account
                        </button>
                    </div>

                </form>
            </div>
        </div>
    </body>

    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        orng: '#f36d06',
                        orngl: '#e9a673',
                        clifford: '#da373d',
                        bodyblue: '#20307e',
                    }
                }
            }
        }
    </script>

    </html>