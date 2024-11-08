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
    
    

</head>


<body class="flex justify-center h-screen" style="background-image: linear-gradient(90deg, #0f172a 0%, #20307e 86%)">
    
    <div id="new-book-model" tabindex="-1" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
        <div class="relative p-4 w-full max-w-2xl max-h-full">
            <!-- Modal content -->
            <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
                <!-- Modal body -->
                <div class="p-4 md:p-5 space-y-4">
                    <form action="add_new_book_in_library.do"  id="form">
                        <div class="relative z-0 w-full mb-6 group">
                            <input type="number" name="copies" id="copies" placeholder="" required class="block py-4 px-0 w-full text-lg text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-orngl dark:focus:border-orng focus:outline-none focus:ring-0 focus:border-blue-600 peer" />
                            <label for="copies" class="peer-focus:font-medium absolute text-lg text-gray-500 dark:text-white duration-300 transform -translate-y-8 scale-75 top-4 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 rtl:peer-focus:left-auto peer-focus:text-blue-600 peer-focus:dark:text-white peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-8">Enter Book Copies</label>
                        </div>
                        <!-- <input type="hidden" id="book_edition_id" name="book_edition_id"> -->
                        <input type="hidden" id="editinz" name="book_edition_id">
                        
                        <input type="hidden" name="book_id" id="book_id" value="${param.book_id}">
                        <input type="hidden" name="title" id="title" value="${param.title}">
                    </form>    
                    <div class="flex items-center p-4 md:p-5 border-t border-gray-200 rounded-b dark:border-gray-600">
                        <button id="addnewbookinlibrarybtn" data-modal-hide="new-book-model" type="button" class=" relative px-5 py-2.5 transition-all ease-in duration-75 bg-white dark:bg-gray-900 rounded-md group-hover:bg-opacity-0 relative inline-flex items-center justify-center p-0.5 mb-2 me-2 overflow-hidden text-sm font-medium text-gray-900 rounded-lg group bg-gradient-to-br from-red-200 via-red-300 to-yellow-200 group-hover:from-red-200 group-hover:via-red-300 group-hover:to-yellow-200 dark:text-white dark:hover:text-gray-900 focus:ring-4 focus:outline-none focus:ring-red-100 dark:focus:ring-red-400">ADD BOOK</button>
                    </div>
                </div>


            </div>
        </div>
    </div>

    <div class="container">

        <!-- heading -->
        <div class="row">
            <div class="w-full flex items-center justify-center p-4">
                <div class="m-8 p-4 h-full flex flex-col items-center justify-center w-full">
                    <div id="wtl" class="responsive-text text-white text-center w-full mb-4 flex-grow">
                        <p class="text-4xl font-bold">${param.title}</p>
                        <hr class=" sm:w-52 md:w-1/2 border border-t-4 my-2 mx-auto border-orng">
                        <p class="xl:text-2xl font-semibold"></p>
                    </div>
                </div>
            </div>
        </div>
        <!-- heading -->        
        
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
                                        <img src="static/media/images/bookcover/b7.png" class="pt-6 card-img-top object-contain h-48 w-full">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="book_edition.do?course_id=${course.courseId}" class="card-img-top object-contain h-48 w-full">
                                    </c:otherwise>
                                </c:choose>
                                <div class="px-5 pb-5">
                                    <h1 class="text-xl font-semibold tracking-tight text-gray-900 dark:text-white">Edition - ${bookedition.edition}</h1>
                                    <h6 class="text-xl font-semibold tracking-tight text-gray-900 dark:text-white">&#8377; ${bookedition.price}</h6>
                                    <h6 class="tracking-tight text-gray-900 dark:text-white">Published on: ${bookedition.publishedOn}</h6>
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
                                <div class=" px-5 pb-5 flex justify-center">
                                    <button >
                                        
                                    </button>


                                    <button id="${bookedition.bookEditionId}" data-modal-target="new-book-model" data-modal-toggle="new-book-model" type="button" class="addbtn relative px-5 py-2.5 transition-all ease-in duration-75 bg-white dark:bg-gray-900 rounded-md group-hover:bg-opacity-0 relative inline-flex items-center justify-center p-0.5 mb-2 me-2 overflow-hidden text-sm font-medium text-gray-900 rounded-lg group bg-gradient-to-br from-red-200 via-red-300 to-yellow-200 group-hover:from-red-200 group-hover:via-red-300 group-hover:to-yellow-200 dark:text-white dark:hover:text-gray-900 focus:ring-4 focus:outline-none focus:ring-red-100 dark:focus:ring-red-400">
                                            ADD TO LIBRARY
                                    </button>
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
    let addbtnclasses = document.querySelectorAll('.addbtn');
    // var bookEditionId = document.querySelector('#book_edition_id');
    const bookEditionId = document.querySelector('#editinz');
    
    const addnewbook = document.querySelector('#addnewbookinlibrarybtn');
    const form = document.querySelector('#form');

    addbtnclasses.forEach((ele)=>{
        ele.addEventListener('click',(e)=>{
            bookEditionId.value = e.target.id;
            console.log(bookEditionId.value);
        });
    });
    
    
    addnewbook.addEventListener('click',()=>{
        console.log(bookEditionId.value);
        form.submit();
    });
    
    
</script>

<script>
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