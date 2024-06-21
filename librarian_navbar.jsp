<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="bg-white dark:bg-gray-900 fixed h-20 w-full z-20 top-0 start-0 border-b border-gray-200 dark:border-gray-600">
    <div class="max-w-screen-xl flex flex-wrap items-center justify-between mx-auto p-4">
        <a href="librarian_dashboard.jsp" class="flex items-center space-x-3 rtl:space-x-reverse">
            <img src="static/media/images/reading-book.png" class="h-12" alt="logo">
            <span class="self-center text-4xl font-semibold whitespace-nowrap dark:text-white">LMS</span>
        </a>
        
        <div class="flex md:order-2 space-x-3 md:space-x-0 rtl:space-x-reverse">
            <!-- viewProfile logo -->
            <div id="viewProfile" class="cursor-pointer rounded-full bg-white border-white">
                <c:choose>
                    <c:when test="${empty user.profilePic}">
                        <img src="static/media/images/dpp.png" class="h-12 w-12 rounded-full">
                    </c:when>
                    <c:otherwise>
                        <img src="profilePic.do" class="h-12 w-12 rounded-full">
                    </c:otherwise>
                </c:choose>
                
            </div>            
            
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


<script>
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
            clifford: '#da373d',
          }
        }
      }
    }



</script>