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
    <style>
        .active {
            display: block;
        }
        .inactive {
            display: none;
        }
        .btn-active {
            background-color: #ff0000;
        }
    </style>
</head>
<body style="background: #241a67;">

    <!-- Modal for viewProfile start-->
    <div id="viewprofilemodal" class="hidden fixed inset-0 bg-slate-950 bg-opacity-85 flex items-center justify-center">
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
                            <!-- <tr class="  ">
                                <th scope="row" class="pt-1 pl-8 font-medium text-gray-900  dark:text-white">
                                    Website :
                                </th>
                                <td class="">
                                   
                                </td>
                            </tr> -->
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
                <button onclick="window.location.href='logout.do'" class="bg-blue-500 text-white px-4 py-2 rounded">Logout</button>
            </div>
        </div>
    </div>
    <!-- Modal for viewProfile end -->
    
    <div class="container">
    
        <div class="row">
            <%@ include file="library_navbar.jsp"%>
        </div>

        <br><br><br><br>
        
       

        <div class="mb-4 border-b border-gray-900 dark:border-gray-700">
            <ul class="flex flex-wrap -mb-px text-lg font-medium text-center" id="default-tab" data-tabs-toggle="#default-tab-content" role="tablist">
                <li class="me-2" role="presentation">
                    <button class="inline-flex items-center p-4 border-b-2 rounded-t-lg" id="t1-tab" data-tabs-target="#t1" type="button" role="tab" aria-controls="t1" aria-selected="false">
                        <img src="static/media/images/find.png" class="w-6 mr-2" alt="find">
                        t1
                    </button>
                </li>
                <li class="me-2" role="presentation">
                    <button class="inline-flex items-center p-4 border-b-2 rounded-t-lg hover:text-gray-600 hover:border-gray-300 dark:hover:text-gray-300" id="t2-tab" data-tabs-target="#t2" type="button" role="tab" aria-controls="t2" aria-selected="false">
                        <img src="static/media/images/find.png" class="w-6 mr-2" alt="find">
                        t2
                    </button>
                </li>
                <li class="me-2" role="presentation">
                    <button class="inline-flex items-center p-4 border-b-2 rounded-t-lg hover:text-gray-600 hover:border-gray-300 dark:hover:text-gray-300" id="t3-tab" data-tabs-target="#t3" type="button" role="tab" aria-controls="t3" aria-selected="false">
                        <img src="static/media/images/find.png" class="w-6 mr-2" alt="find">
                        t3
                    </button>
                </li>
                
                <li class="me-2" role="presentation">
                    <button class="inline-flex items-center p-4 border-b-2 rounded-t-lg hover:text-gray-600 hover:border-gray-300 dark:hover:text-gray-300" id="books-tab" data-tabs-target="#books" type="button" role="tab" aria-controls="books" aria-selected="false">
                        <img src="static/media/images/find.png" class="w-6 mr-2" alt="find">
                        Books
                    </button>
                </li>
                
            </ul>
        </div>
        
        <div id="default-tab-content">
            <!-- t1 -->
            <div class="hidden p-4 rounded-lg bg-indigo-900 dark:bg-indigo-900" id="t1" role="tabpanel" aria-labelledby="t1-tab">    
                t1
            </div>
            <!-- t2 -->
            <div class="hidden p-4 rounded-lg bg-indigo-900 dark:bg-indigo-900" id="t2" role="tabpanel" aria-labelledby="t2-tab">
                t2
            </div>
            <!-- t3 -->
            <div class="hidden p-4 rounded-lg bg-indigo-900 dark:bg-indigo-900" id="t3" role="tabpanel" aria-labelledby="t3-tab">
                t3
            </div>

            <div class="hidden p-4 rounded-lg bg-indigo-900 dark:bg-indigo-900" id="books" role="tabpanel" aria-labelledby="books-tab">
                BOOKS
            </div>
            
            
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
</script>