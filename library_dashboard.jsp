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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
                    <button class="inline-flex items-center p-4 border-b-2 rounded-t-lg" id="home-tab" data-tabs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="false">
                        <img src="static/media/images/home.png" class="w-6 mr-2" alt="find">
                        home
                    </button>
                </li>
                
                <li class="me-2" role="presentation">
                    <button class="inline-flex items-center p-4 border-b-2 rounded-t-lg hover:text-gray-600 hover:border-gray-300 dark:hover:text-gray-300" id="candidate-tab" data-tabs-target="#candidate" type="button" role="tab" aria-controls="candidate" aria-selected="false">
                        <img src="static/media/images/candidate.png" class="w-6 mr-2" alt="find">
                        Candidates
                    </button>
                </li>
                
                <li class="me-2" role="presentation">
                    <button class="inline-flex items-center p-4 border-b-2 rounded-t-lg hover:text-gray-600 hover:border-gray-300 dark:hover:text-gray-300" id="issue_book-tab" data-tabs-target="#issue_book" type="button" role="tab" aria-controls="issue_book" aria-selected="false">
                        <img src="static/media/images/issuebook.png" class="w-6 mr-2" alt="find">
                        Issue Book
                    </button>
                </li>
                
                <li class="me-2" role="presentation">
                    <button class="inline-flex items-center p-4 border-b-2 rounded-t-lg hover:text-gray-600 hover:border-gray-300 dark:hover:text-gray-300" id="return_book-tab" data-tabs-target="#return_book" type="button" role="tab" aria-controls="return_book" aria-selected="false">
                        <img src="static/media/images/returnBook.png" class="w-6 mr-2" alt="find">
                        Return Book
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
            <!-- Home -->
            <div class="hidden p-4 rounded-lg bg-indigo-900 dark:bg-indigo-900" id="home" role="tabpanel" aria-labelledby="home-tab">    
                <!-- book_search_bar -->
                <div class="max-w-md mx-auto mt-5">
                    <div class="relative">
                        <input type="search" id="available_book_search_input" class="block w-full p-4 ps-10 text-sm border border-white rounded-lg bg-transparent focus:ring-white focus:border-white dark:bg-transparent dark:border-white dark:placeholder-gray-400 dark:text-white dark:focus:ring-white dark:focus:border-white" placeholder="Search Book" required />
                    </div>
                </div>
                <!-- card -->
                <div id="row_for_available_book_in_library" class="container mx-auto">
                
                </div>
            </div>
            
            <!-- candidate -->
            <div class="hidden p-4 rounded-lg bg-indigo-900 dark:bg-indigo-900" id="candidate" role="tabpanel" aria-labelledby="candidate-tab">
                candidate
            </div>
            
            <!-- Issue Book -->
            <div class="hidden p-4 rounded-lg bg-indigo-900 dark:bg-indigo-900" id="issue_book" role="tabpanel" aria-labelledby="issue_book-tab">
                Issue Book
            </div>
            
            <!-- Return Book -->
            <div class="hidden p-4 rounded-lg bg-indigo-900 dark:bg-indigo-900" id="return_book" role="tabpanel" aria-labelledby="return_book-tab">
                Return Book
            </div>

            <!-- BOOKS -->
            <div class="hidden p-4 rounded-lg bg-indigo-900 dark:bg-indigo-900" id="books" role="tabpanel" aria-labelledby="books-tab">
                
                <!-- book_search_bar -->
                <div class="max-w-md mx-auto mt-5">
                    <div class="relative">
                        <input type="search" id="book_search_input" class="block w-full p-4 ps-10 text-sm border border-white rounded-lg bg-transparent focus:ring-white focus:border-white dark:bg-transparent dark:border-white dark:placeholder-gray-400 dark:text-white dark:focus:ring-white dark:focus:border-white" placeholder="Find Books" required />
                    </div>
                </div>
                <!-- card -->
                <div id="row_for_books" class="container mx-auto">
                </div> 
 
            </div>
            
            
        </div>

    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.js"></script>
</body>
</html>



<!-- <script>
    let debounce_search_title = function (func, delay) {
        let timeout;
        return function () {
            if (timeout)
                clearTimeout(timeout);
            timeout = setTimeout(func, delay);
        }
    }
    let available_book_search_input = document.querySelector('#available_book_search_input');
    let row_for_available_book_in_library = document.querySelector('#row_for_available_book_in_library');

    let libBookFunc = async () => {

        let searchTerm = available_book_search_input.value.trim(); // Trim to remove spaces
        if (searchTerm.length < 3) {
            row_for_available_book_in_library.innerHTML = '';
            return;
        }


        row_for_available_book_in_library.innerHTML = '';
        let param = 'title=' + available_book_search_input.value;
        let response = await fetch('search_book_by_name_available_in_library.do?' + param);
        let data = await response.json();
        console.log(data)
        for(let obj of data){
            let col_1 = document.createElement('div');
            col_1.className = 'border border-gray-100';
            row_for_available_book_in_library.append(col_1);

            let card = document.createElement('div');
            card.className = 'card border border-gray-200';
            col_1.append(card);
            
            let col_1_row_1 = document.createElement('div');
            col_1_row_1.className = 'row border border-gray-300';
            card.append(col_1_row_1);

            let col_1_row_1_col_1 = document.createElement('div');
            col_1_row_1_col_1.className = 'col border border-gray-400';
            col_1_row_1.append(col_1_row_1_col_1);

            let img = document.createElement('img');
            img.className = 'border border-gray-500 rounded';
            img.src = "static/media/images/bookcover/b7.png";
            img.style.width = "250px";
            col_1_row_1_col_1.append(img);

            let col_1_row_1_col_2 = document.createElement('div');
            col_1_row_1_col_2.className = 'border border-gray-600';
            col_1_row_1.append(col_1_row_1_col_2);



            let card_body = document.createElement('div');
            card_body.className = 'card-body border border-gray-700';
            col_1_row_1_col_2.append(card_body);

            let card_body_row_1 = document.createElement('div');
            card_body_row_1.className = 'row border border-gray-800';
            card_body.append(card_body_row_1);
            card_body_row_1.innerText = obj.bookEdition.book.title;

            let card_body_row_2 = document.createElement('div');
            card_body_row_2.className = 'row border border-gray-900';
            card_body.append(card_body_row_2);
            
            let card_body_row_2_col_1 = document.createElement('div');
            card_body_row_2_col_1.className = 'col-md border border-gray-950';
            card_body_row_2_col_1.innerText = 'Total:';
            card_body_row_2.append(card_body_row_2_col_1);
            
            let card_body_row_2_col_2 = document.createElement('div');
            card_body_row_2_col_2.className = 'col-md border border-gray-900';
            card_body_row_2_col_2.innerText = obj.copies;
            card_body_row_2.append(card_body_row_2_col_2);

            
            let card_body_row_3 = document.createElement('div');
            card_body_row_3.className = 'row border-gray-800';
            card_body.append(card_body_row_3);
            
            let card_body_row_3_col_1 = document.createElement('div');
            card_body_row_3_col_1.className = 'col-md border border-gray-700';
            card_body_row_3_col_1.innerText = 'Available:';
            card_body_row_3.append(card_body_row_3_col_1);
            
            let card_body_row_3_col_2 = document.createElement('div');
            if((obj.copies - obj.bookIssued) === 0){
                card_body_row_3_col_2.className = 'col-md border border-gray-600';
                card_body_row_3_col_2.innerText = 'out of stock' ;
                card_body_row_3_col_2.style.color = 'red';
            }else{
                card_body_row_3_col_2.className = 'col-md border border-gray-500';
                card_body_row_3_col_2.innerText = obj.copies - obj.bookIssued ;
            }
            card_body_row_3.append(card_body_row_3_col_2);



            let card_body_row_4 = document.createElement('div');
            card_body_row_4.className = 'row border border-gray-400';
            card_body.append(card_body_row_4);
            
            let card_body_row_4_col_1 = document.createElement('div');
            card_body_row_4_col_1.className = 'col-md border border-gray-300';
            card_body_row_4_col_1.innerText = 'Edition:';
            card_body_row_4.append(card_body_row_4_col_1);
            
            let card_body_row_4_col_2 = document.createElement('div');
            card_body_row_4_col_2.className = 'col-md border border-gray-200';
            card_body_row_4_col_2.innerText = obj.bookEdition.edition ;
            card_body_row_4.append(card_body_row_4_col_2);
            




        }
    }

    let optSearch = debounce_search_title(libBookFunc, 800);
    available_book_search_input.addEventListener('keyup', () => {
        optSearch();
    });
</script> -->

<!-- design sahi but data nai dikh raha hai  -->
<script>
    let debounce_search_title = function (func, delay) {
        let timeout;
        return function () {
            if (timeout)
                clearTimeout(timeout);
            timeout = setTimeout(func, delay);
        }
    }
    let available_book_search_input = document.querySelector('#available_book_search_input');
    let row_for_available_book_in_library = document.querySelector('#row_for_available_book_in_library');

    let libBookFunc = async () => {
    let searchTerm = available_book_search_input.value.trim(); // Trim to remove spaces
    if (searchTerm.length < 3) {
        row_for_available_book_in_library.innerHTML = '';
        return;
    }
    row_for_available_book_in_library.innerHTML = '';
    let param = 'title=' + encodeURIComponent(searchTerm);
    let response = await fetch('search_book_by_name_available_in_library.do?' + param);
    let data = await response.json();
    console.log(data);

    data.forEach((obj, index) => {
        if (index % 5 === 0) {
            let flexWrapDiv = document.createElement('div');
            flexWrapDiv.className = 'flex flex-wrap -mx-4';
            row_for_available_book_in_library.append(flexWrapDiv);
        }

        let colDiv = document.createElement('div');
        colDiv.className = 'w-1/5 px-4 mb-8';
        row_for_available_book_in_library.lastChild.append(colDiv);

        let cardDiv = document.createElement('div');
        cardDiv.className = 'shadow-md rounded-md p-4';
        colDiv.append(cardDiv);

        let anchor = document.createElement('a');
        anchor.href = '#';
        cardDiv.append(anchor);

        let bookDiv = document.createElement('div');
        bookDiv.className = 'w-full max-w-xs bg-white border border-gray-900 rounded-lg shadow dark:bg-gray-900 dark:border-gray-900';
        bookDiv.id = obj.bookEdition.bookEditionId;
        anchor.append(bookDiv);

        let img = document.createElement('img');
        img.className = 'pt-6 card-img-top object-contain h-48 w-full';
        img.src = obj.bookEdition.bookPic ? `book_edition.do?course_id=${obj.bookEdition.courseId}` : 'static/media/images/bookcover/b7.png';
        bookDiv.append(img);

        let contentDiv = document.createElement('div');
        contentDiv.className = 'px-5 pb-5';
        bookDiv.append(contentDiv);

        let title = document.createElement('h1');
        title.className = 'text-xl font-semibold tracking-tight text-gray-900 dark:text-white';
        title.innerText = `Edition - ${obj.bookEdition.edition}`;
        contentDiv.append(title);

        let price = document.createElement('h6');
        price.className = 'text-xl font-semibold tracking-tight text-gray-900 dark:text-white';
        price.innerHTML = `&#8377; ${obj.bookEdition.price}`;
        contentDiv.append(price);

        let publishedOn = document.createElement('h6');
        publishedOn.className = 'tracking-tight text-gray-900 dark:text-white';
        publishedOn.innerText = `Published on: ${obj.bookEdition.publishedOn}`;
        contentDiv.append(publishedOn);

        // Star rating div
        let ratingDiv = document.createElement('div');
        ratingDiv.className = 'flex items-center mt-2.5 mb-5';
        contentDiv.append(ratingDiv);

        let starsDiv = document.createElement('div');
        starsDiv.className = 'flex items-center space-x-1 rtl:space-x-reverse';
        ratingDiv.append(starsDiv);

        for (let i = 0; i < 5; i++) {
            let star = document.createElement('svg');
            star.className = `w-4 h-4 ${i < 4 ? 'text-yellow-300' : 'text-gray-200 dark:text-gray-600'}`;
            star.setAttribute('aria-hidden', 'true');
            star.setAttribute('xmlns', 'http://www.w3.org/2000/svg');
            star.setAttribute('fill', 'currentColor');
            star.setAttribute('viewBox', '0 0 22 20');
            star.innerHTML = '<path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>';
            starsDiv.append(star);
        }

        let ratingText = document.createElement('span');
        ratingText.className = 'bg-blue-100 text-blue-800 text-xs font-semibold px-2.5 py-0.5 rounded dark:bg-blue-200 dark:text-blue-800 ms-3';
        ratingText.innerText = '5.0';
        ratingDiv.append(ratingText);

        let buttonDiv = document.createElement('div');
        buttonDiv.className = 'px-5 pb-5 flex justify-center';
        contentDiv.append(buttonDiv);

        let button = document.createElement('button');
        button.id = obj.bookEdition.bookEditionId;
        button.setAttribute('data-modal-target', 'new-book-model');
        button.setAttribute('data-modal-toggle', 'new-book-model');
        button.type = 'button';
        button.className = 'addbtn relative px-5 py-2.5 transition-all ease-in duration-75 bg-white dark:bg-gray-900 rounded-md group-hover:bg-opacity-0 relative inline-flex items-center justify-center p-0.5 mb-2 me-2 overflow-hidden text-sm font-medium text-gray-900 rounded-lg group bg-gradient-to-br from-red-200 via-red-300 to-yellow-200 group-hover:from-red-200 group-hover:via-red-300 group-hover:to-yellow-200 dark:text-white dark:hover:text-gray-900 focus:ring-4 focus:outline-none focus:ring-red-100 dark:focus:ring-red-400';
        button.innerText = 'ADD TO LIBRARY';
        buttonDiv.append(button);
    });
}

// Event listener for keyup
available_book_search_input.addEventListener('keyup', debounce_search_title(libBookFunc, 400));

</script>

<!-- library search book by name, Available in library -->
<!-- <script>
    let debounce_search_title = function (func, delay) {
        let timeout;
        return function () {
            if (timeout)
                clearTimeout(timeout);
            timeout = setTimeout(func, delay);
        }
    }
    let available_book_search_input = document.querySelector('#available_book_search_input');
    let row_for_available_book_in_library = document.querySelector('#row_for_available_book_in_library');

    let libBookFunc = async () => {
        let searchTerm = available_book_search_input.value.trim(); // Trim to remove spaces
        if (searchTerm.length < 3) {
            row_for_available_book_in_library.innerHTML = '';
            return;
        }
        row_for_available_book_in_library.innerHTML = '';
        let param = 'title=' + encodeURIComponent(searchTerm);
        let response = await fetch('search_book_by_name_available_in_library.do?' + param);
        let data = await response.json();
        console.log(data)
        for (let obj of data) {
            let col_1 = document.createElement('div');
            col_1.className = '';
            row_for_available_book_in_library.append(col_1);

            let card = document.createElement('div');
            card.className = 'card';
            col_1.append(card);

            let col_1_row_1 = document.createElement('div');
            col_1_row_1.className = 'row';
            card.append(col_1_row_1);

            let col_1_row_1_col_1 = document.createElement('div');
            col_1_row_1_col_1.className = 'col';
            col_1_row_1.append(col_1_row_1_col_1);

            let img = document.createElement('img');
            img.className = 'p-3 mb-2';
            img.src = "static/media/images/bookcover/b7.png";
            img.style.width = "300px";
            col_1_row_1_col_1.append(img);

            let col_1_row_1_col_2 = document.createElement('div');
            col_1_row_1_col_2.className = '';
            col_1_row_1.append(col_1_row_1_col_2);



            let card_body = document.createElement('div');
            card_body.className = 'card-body';
            col_1_row_1_col_2.append(card_body);

            let card_body_row_1 = document.createElement('div');
            card_body_row_1.className = 'row fs-1';
            card_body.append(card_body_row_1);
            card_body_row_1.innerText = obj.bookEdition.book.title;

            let card_body_row_2 = document.createElement('div');
            card_body_row_2.className = 'row';
            card_body.append(card_body_row_2);

            let card_body_row_2_col_1 = document.createElement('div');
            card_body_row_2_col_1.className = 'col-md fs-3';
            card_body_row_2_col_1.innerText = 'Total:';
            card_body_row_2.append(card_body_row_2_col_1);

            let card_body_row_2_col_2 = document.createElement('div');
            card_body_row_2_col_2.className = 'col-md fs-2';
            card_body_row_2_col_2.innerText = obj.copies;
            card_body_row_2.append(card_body_row_2_col_2);


            let card_body_row_3 = document.createElement('div');
            card_body_row_3.className = 'row';
            card_body.append(card_body_row_3);

            let card_body_row_3_col_1 = document.createElement('div');
            card_body_row_3_col_1.className = 'col-md fs-3';
            card_body_row_3_col_1.innerText = 'Available:';
            card_body_row_3.append(card_body_row_3_col_1);

            let card_body_row_3_col_2 = document.createElement('div');
            if ((obj.copies - obj.bookIssued) === 0) {
                card_body_row_3_col_2.className = 'col-md mt-2';
                card_body_row_3_col_2.innerText = 'out of stock';
                card_body_row_3_col_2.style.color = 'red';
            } else {
                card_body_row_3_col_2.className = 'col-md fs-2';
                card_body_row_3_col_2.innerText = obj.copies - obj.bookIssued;
            }
            card_body_row_3.append(card_body_row_3_col_2);



            let card_body_row_4 = document.createElement('div');
            card_body_row_4.className = 'row';
            card_body.append(card_body_row_4);

            let card_body_row_4_col_1 = document.createElement('div');
            card_body_row_4_col_1.className = 'col-md fs-3';
            card_body_row_4_col_1.innerText = 'Edition:';
            card_body_row_4.append(card_body_row_4_col_1);

            let card_body_row_4_col_2 = document.createElement('div');
            card_body_row_4_col_2.className = 'col-md fs-2';
            card_body_row_4_col_2.innerText = obj.bookEdition.edition;
            card_body_row_4.append(card_body_row_4_col_2);




        }
    }

    let optSearch = debounce_search_title(libBookFunc, 400);
    available_book_search_input.addEventListener('keyup', () => {
        optSearch();
    });
</script> -->



<!-- library search book by name for add in library-->
<script>
    let book_search_input = document.querySelector('#book_search_input'); 
    let row_for_books = document.querySelector('#row_for_books');

    book_search_input.addEventListener('keyup', () => {
        row_for_books.innerHTML = '';
        let req = new XMLHttpRequest();
        let param = "title=" + book_search_input.value;
        console.log(param);
        req.open('GET', 'search_book_by_name_for_library.do?' + param, true);
        req.addEventListener('readystatechange', () => {
            if (req.readyState == 4 && req.status == 200) {
                console.log(req.responseText);
                let data = JSON.parse(req.responseText);
                console.log(data);

                let row;
                for (let i = 0; i < data.length; i++) {
                    if (i % 5 === 0) {
                        row = document.createElement('div');
                        row.className = 'flex flex-wrap -mx-4';
                        row_for_books.append(row);
                    }

                    let column = document.createElement('div');
                    column.className = 'w-full md:w-1/5 px-4 mb-8';
                    row.append(column);

                    let card = document.createElement('div');
                    card.className = 'shadow-md rounded-md p-4';
                    column.append(card);

                    let cardInner = document.createElement('div');
                    cardInner.className = 'w-full max-w-xs bg-white border border-gray-900 rounded-lg shadow dark:bg-gray-900 dark:border-gray-900';
                    card.append(cardInner);

                    let a = document.createElement('a');
                    a.href = 'show_book_edition_for_library.do?book_id=' + data[i].bookId + "&title="+data[i].title;
                    cardInner.append(a);

                    let img = document.createElement('img');
                    img.src = 'book_pic.do?path=' + data[i].bookPic;
                    img.className = 'card-img-top object-contain h-48 w-full';
                    a.append(img);

                    let card_body = document.createElement('div');
                    card_body.className = 'px-5 pb-5';
                    cardInner.append(card_body);

                    let h3 = document.createElement('h3');
                    h3.innerText = data[i].title;
                    h3.className = 'text-xl font-semibold tracking-tight text-gray-900 dark:text-white';
                    card_body.append(h3);
                }
            }
        });
        req.send();
    });
</script>

<!-- navbar profile model open/close -->
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

create table book_edition_pic(
    book_edition_pic_id int not null auto_increment primary key,
    book_edition_id int not null,
    edition_img_path varchar(256) not null,
    constraint fk_edition_pic foreign key (book_edition_id) references book_editions(book_edition_id)
);