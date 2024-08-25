<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
    
    <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">

    

</head>


<body class="flex justify-center h-screen" style="background-image: linear-gradient(90deg, #0f172a 0%, #20307e 86%)">
    <!-- Modal for viewProfile start -->
    <div id="vieawprofilemodal" class="hidden fixed inset-0  backdrop-blur flex items-center justify-center overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
        <div class="bg-slate-900 rounded-lg text-white p-8 rounded shadow-lg w-11/12 md:w-1/2">
            <div class="flex items-center">
                <div class="flex-shrink-0">
                    <c:choose>
                        <c:when test="${empty user.profilePic}">
                            <img src="static/media/images/dpp.png" class="w-10 h-10 rounded-full">
                        </c:when>
                        <c:otherwise>
                            <img src="profilePic.do" class="w-10 h-10 rounded-full">
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="ml-4">
                    <p class="text-2xl mb-4">${user.name}</p>
                </div>
            </div>
                                              
            <div class="flex flex-col md:flex-row">

                <div class="w-full md:w-7/12 mb-4 md:mb-0 md:mr-4 overflow-x-auto">
                    <table class="w-full text-lg text-left rtl:text-right text-gray-500 dark:text-gray-400">
                        <tbody>
                            <tr class="">
                                <th scope="row" class="pt-1 pl-8 font-medium text-gray-900 dark:text-white">
                                    Name :
                                </th>
                                <td class="">
                                    ${user.name}
                                </td>
                            </tr>
                            <tr class="  ">
                                <th scope="row" class="pt-1 pl-8 font-medium text-gray-900 dark:text-white">
                                    email :
                                </th>
                                <td class="">
                                    ${user.email}
                                </td>
                            </tr>
                            <tr class="  ">
                                <th scope="row" class="pt-1 pl-8 font-medium text-gray-900 dark:text-white">
                                    Contact :
                                </th>
                                <td class="">
                                    ${user.contact}
                                </td>
                            </tr>
                            <tr class="  ">
                                <th scope="row" class="pt-1 pl-8 font-medium text-gray-900  dark:text-white">
                                    Gender :
                                </th>
                                <td class="">
                                    ${user.gender}
                                </td>
                            </tr>
                            <tr class="  ">
                                <th scope="row" class=" pt-1 pl-8 font-medium text-gray-900 dark:text-white">
                                    Address :
                                </th>
                                <td class="">
                                    ${user.address}
                                </td>
                            </tr>
                            <tr class="  ">
                                <th scope="row" class="pt-1 pl-8 font-medium text-gray-900  dark:text-white">
                                    City :
                                </th>
                                <td class="">
                                    ${user.city.city}(${fn:toLowerCase(user.city.state.state)})
                                </td>
                            </tr>
                            <tr class="  ">
                                <th scope="row" class="pt-1 pl-8 font-medium text-gray-900 dark:text-white">
                                    Details :
                                </th>
                                <td class="">
                                    ${user.details}
                                </td>
                            </tr>
                            <tr class="  ">
                                <th scope="row" class="pt-1 pl-8 font-medium text-gray-900  dark:text-white">
                                    Website :
                                </th>
                                <td class="">
                                    ${user.website}
                                </td>
                            </tr>
                            <tr class="  ">
                                <th scope="row" class="pt-1  pl-8 font-medium text-gray-900 dark:text-white">
                                    Establishment Date :
                                </th>
                                <td class="">
                                    ${user.dob}
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="w-full md:w-5/12">
                    <c:choose>
                        <c:when test="${empty user.profilePic}">
                            <img src="static/media/images/dpp.png" class="w-full">
                        </c:when>
                        <c:otherwise>
                            <img src="profilePic.do" class="w-full">
                        </c:otherwise>
                    </c:choose>
                </div>

            </div>

            <div class="flex justify-between">
                <button id="viewprofileclose-modal" class="bg-blue-500 text-white px-4 py-2 rounded">Close</button>
                <button id="" class="bg-blue-500 text-white px-4 py-2 rounded">Edit</button>
                <button onclick="window.location.href='logout.do'" class="bg-blue-500 text-white px-4 py-2 rounded">Logout</button>
            </div>
        </div>
    </div>
    <!-- Modal for viewProfile end -->

    <!-- add_new_Edition_Model start-->
    <div id="addneweditionmodel" tabindex="-1" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
        <div class="relative p-4 w-full max-w-2xl max-h-full">
            <!-- Modal content -->
            <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
                <!-- Modal header -->
                <div class="flex items-center justify-between p-4 md:p-5 border-b rounded-t dark:border-gray-600">
                    <h3 class="text-xl font-semibold text-gray-900 dark:text-white">
                        Add New Edition
                    </h3>
                </div>

                <!-- Modal body -->
                <div class="p-4 md:p-5 space-y-4">
                    <form action="book_edition.do?title=${param.book_title}" method="post" class="max-w-lg mx-auto">
                        <input type="hidden" name="book_id" id="book_id" value="${param.book_id}">
                        
                        <div class="relative z-0 w-full mb-6 group">
                            <input type="number" name="edition" class="block py-4 px-0 w-full text-lg text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-orngl dark:focus:border-orng focus:outline-none focus:ring-0 focus:border-blue-600 peer" id="book_edition">
                            <label for="edition" class="peer-focus:font-medium absolute text-lg text-gray-500 dark:text-white duration-300 transform -translate-y-8 scale-75 top-4 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 rtl:peer-focus:left-auto peer-focus:text-blue-600 peer-focus:dark:text-white peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-8">
                                Edition
                            </label>
                        </div>

                        <div class="relative z-0 w-full mb-6 group">
                            <input type="date" name="published_on" class="block py-4 px-0 w-full text-lg text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-orngl dark:focus:border-orng focus:outline-none focus:ring-0 focus:border-blue-600 peer" id="published_on">
                            <label for="published_on" class="peer-focus:font-medium absolute text-lg text-gray-500 dark:text-white duration-300 transform -translate-y-8 scale-75 top-4 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 rtl:peer-focus:left-auto peer-focus:text-blue-600 peer-focus:dark:text-white peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-8">
                                Publishment Date
                            </label>
                        </div>

                        <div class="relative z-0 w-full mb-6 group">
                            <input type="number" name="price" class="block py-4 px-0 w-full text-lg text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-orngl dark:focus:border-orng focus:outline-none focus:ring-0 focus:border-blue-600 peer" id="price">
                            <label for="price" class="peer-focus:font-medium absolute text-lg text-gray-500 dark:text-white duration-300 transform -translate-y-8 scale-75 top-4 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 rtl:peer-focus:left-auto peer-focus:text-blue-600 peer-focus:dark:text-white peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-8">
                                Price
                            </label>
                        </div>

                        <div class="relative z-0 w-full mb-6 group">
                            <label for="details" class=" peer-focus:font-medium absolute text-lg text-gray-500 dark:text-white duration-300 transform -translate-y-8 scale-75 top-4 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 rtl:peer-focus:left-auto peer-focus:text-blue-600 peer-focus:dark:text-white peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-8">
                                About This Book
                            </label>
                            <br>
                            <textarea name="details" id="details" rows="1" col="30" class="bg-transparent rounded-lgform-control block py-4 px-0 w-full text-lg text-gray-800 border-0 border-b-2 border-orngl appearance-none dark:text-white dark:border-orngl dark:focus:border-orng focus:outline-none focus:ring-0 focus:border-orng peer"></textarea>
                        </div>
                        
                        <div class="relative z-0 w-full mb-6 group">
                            <input type="number" name="isbn_no" class="block py-4 px-0 w-full text-lg text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-orngl dark:focus:border-orng focus:outline-none focus:ring-0 focus:border-blue-600 peer" id="isbn_no">
                            <label for="isbn_no" class="peer-focus:font-medium absolute text-lg text-gray-500 dark:text-white duration-300 transform -translate-y-8 scale-75 top-4 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 rtl:peer-focus:left-auto peer-focus:text-blue-600 peer-focus:dark:text-white peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-8">
                                Isbn No
                            </label>
                        </div>
                        
                    
                        <!-- Modal footer -->
                        <div class="flex items-center p-4 md:p-5 border-t border-gray-200 rounded-b dark:border-gray-600">
                            <!-- submit button -->
                            <div class="flex flex-col sm:flex-row gap-4">
                                <button type="submit" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 me-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800">
                                    Done
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- add_new_Edition_Model_end -->
    

    <div class="container">
        <!-- navbar -->
        <div class="flex-row">
            <div class="col">
                <nav class="bg-white dark:bg-gray-900 fixed h-20 w-full z-20 top-0 start-0 border-b border-gray-200 dark:border-gray-600">
                    <div class="max-w-screen-xl flex flex-wrap items-center justify-between mx-auto p-4">
                        <a href="publisher_dashboard.jsp" class="flex items-center space-x-3 rtl:space-x-reverse">
                            <img src="static/media/images/reading-book.png" class="h-12" alt="logo">
                            <span class="self-center text-4xl font-semibold whitespace-nowrap dark:text-white">${user.name}</span>
                        </a>
                        
                        <div class="flex md:order-2 space-x-3 md:space-x-0 rtl:space-x-reverse">
                            <!-- viewProfile logo -->
                            <button id="viewProfile" class="rounded-full bg-white border-white">
                                <c:choose>
                                    <c:when test="${empty user.profilePic}">
                                        <img src="static/media/images/dpp.png" class="h-12 w-12 rounded-full">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="profilePic.do" class="h-12 w-12 rounded-full">
                                    </c:otherwise>
                                </c:choose>
                            </button>

                            <button data-collapse-toggle="navbar-sticky" type="button" class="inline-flex items-center p-2 w-10 h-10 justify-center text-sm text-gray-500 rounded-lg md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600" aria-controls="navbar-sticky" aria-expanded="false" id="navbar-toggle">
                                <span class="sr-only">Open main menu</span>
                                <svg class="w-5 h-5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 17 14">
                                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M1 1h15M1 7h15M1 13h15" />
                                </svg>
                            </button>
                        </div>
                        <div class="items-center justify-between hidden w-full md:flex md:w-auto md:order-1" id="navbar-sticky">
                            <ul class="flex flex-col p-4 md:p-0 mt-4 text-2xl border border-gray-100 rounded-lg bg-gray-50 md:space-x-8 rtl:space-x-reverse md:flex-row md:mt-0 md:border-0 md:bg-white dark:bg-gray-800 md:dark:bg-gray-900 dark:border-gray-700">
                                <li>
                                    <a href="#" class="block py-2 px-3 rounded md:hover:text-orng md:p-0 dark:text-white md:dark:hover:bg-transparent dark:border-gray-700">Home</a>
                                </li>
                                <li>
                                    <a href="#" class="block py-2 px-3 rounded md:hover:text-orng md:p-0 dark:text-white md:dark:hover:bg-transparent dark:border-gray-700">Books</a>
                                </li>
                                <li>
                                    <a href="#" class="block py-2 px-3 rounded md:hover:text-orng md:p-0 dark:text-white md:dark:hover:bg-transparent dark:border-gray-700">Libraries</a>
                                </li>
                                <li>
                                    <a href="#" class="block py-2 px-3 rounded md:hover:text-orng md:p-0 dark:text-white md:dark:hover:bg-transparent dark:border-gray-700">Help</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- navbar -->

        <br><br><br><br>

        <!-- heading -->
        <div class="row">
            <div class="w-full flex items-center justify-center p-4">
                <div class="m-8 p-4 h-full flex flex-col items-center justify-center w-full">
                    <div id="wtl" class="responsive-text text-white text-center w-full mb-4 flex-grow">
                        <p class="text-4xl font-bold">${param.book_title}</p>
                        <hr class=" sm:w-52 md:w-1/2 border-t-4 my-2 mx-auto border-orng">
                        <p class="xl:text-2xl font-semibold"></p>
                    </div>
                </div>
            </div>
        </div>
        <!-- heading -->
  
        <!-- Add New Edition -->
        <button data-modal-target="addneweditionmodel" data-modal-toggle="addneweditionmodel" class="block text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800" type="button">
            Add New Edition
        </button>
        
    
        
        
        
        <!-- show edition -->
        <div class="container mx-auto">
            <c:forEach var="bookedition" items="${book_editions}" varStatus="n">
                <c:if test="${(n.count-1) % 5 == 0}">
                    <div class="flex flex-wrap -mx-4">
                </c:if>
                
                <div class="w-1/5 px-4 mb-8">
                    <div class="shadow-md rounded-md p-4">
                        <a href="#">
                            <div id="${book.bookEditionId}" class="w-full max-w-xs bg-white border border-gray-900 rounded-lg shadow dark:bg-gray-900 dark:border-gray-900">
                                <c:choose>
                                    <c:when test="${empty book.bookPic}">
                                        <img src="static/media/images/bookcover/dummybook.png" class="pt-6 card-img-top object-contain h-48 w-full">
                                    </c:when>
                                    <c:otherwise>
                                        <%-- <img src="course_pic.do?course_id=${course.courseId}" class="card-img-top object-contain h-48 w-full"> --%>
                                    </c:otherwise>
                                </c:choose>
                                <div class="px-5 pb-5">
                                    <h5 class="text-xl font-semibold tracking-tight text-gray-900 dark:text-white">${bookedition.edition}st</h5>
                                    <div class="flex items-center mt-2.5 mb-5">
                                        <div class="flex items-center space-x-1 rtl:space-x-reverse">
                                            <!-- Star SVGs -->
                                            <svg class="w-4 h-4 text-yellow-300" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20"><path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/></svg>
                                            <svg class="w-4 h-4 text-yellow-300" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20"><path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/></svg>
                                            <svg class="w-4 h-4 text-yellow-300" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20"><path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/></svg>
                                            <svg class="w-4 h-4 text-yellow-300" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20"><path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/></svg>
                                            <svg class="w-4 h-4 text-gray-200 dark:text-gray-600" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20"><path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/></svg>
                                        </div>
                                        <span class="bg-blue-100 text-blue-800 text-xs font-semibold px-2.5 py-0.5 rounded dark:bg-blue-200 dark:text-blue-800 ms-3">5.0</span>
                                    </div>
                                </div>
                                <div class="px-5 pb-5 flex justify-center justify-between">
                                    <a href="#" class="text-center">
                                        <img src="static/media/images/addimage.png" class="w-6" alt="Add">
                                    </a>
                                    <a href="#" class="text-center">
                                        <img src="static/media/images/edit.png" class="w-6" alt="Edit">
                                    </a>
                                    <a href="delete_book_edition.do?book_id=${param.book_id}&title=${param.book_title}&book_edition_id=${bookedition.bookEditionId}" class="text-center">
                                        <img src="static/media/images/delete.png" class="w-6" alt="Delete">
                                    </a>
                                </div>
                                
                            </div>
                        </a>
                    </div>
                </div>
                
                <c:if test="${n.count % 5 == 0 || n.count == books.size()}">
                    </div>
                </c:if>
            </c:forEach>
        </div>

    </div>
        


<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.js"></script>
</body>
</html>

<script>

    // Arrow function to open the modal
    const openModal = () => {
    document.getElementById('viewprofilemodal').classList.remove('hidden');
    }

    // Arrow function to close the modal
    const closeModal = () => {
        document.getElementById('viewprofilemodal').classList.add('hidden');
    }

    // Event listener to open the modal when the image container is clicked
    document.getElementById('viewProfile').addEventListener('click', openModal);

    // Event listener to close the modal when the close button is clicked
    document.getElementById('viewprofileclose-modal').addEventListener('click', closeModal);
    
    //toggle-button
    document.getElementById('navbar-toggle').addEventListener('click', function () {
        var navbar = document.getElementById('navbar-sticky');
        navbar.classList.toggle('hidden');
    });


    tailwind.config = {
        theme: {
            extend: {
                colors: {
                    orng: '#f36d06',
                    orngl: '#e9a673',
                    clifford: '#da373d',
                }
            }
        }
    }
</script>