<!-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LMS</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp,container-queries"></script>

</head>
<body style="background: #241a67;">
    <div class="container">
        <!-- Modal for viewProfile start-->
        <div id="viewprofilemodal" class="fixed inset-0 bg-slate-400 bg-opacity-75 flex items-center justify-center hidden">
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
                                                  
                <p class="mb-4">This is a simple modal example.</p>
                <div class="flex justify-between">
                    <button id="viewprofileclose-modal" class="bg-blue-500 text-white px-4 py-2 rounded">Close</button>
                    <button onclick="window.location.href='logout.do'" class="bg-blue-500 text-white px-4 py-2 rounded">Logout</button>
                </div>
            </div>
        </div>
        <!-- Modal for viewProfile end -->

        <div class="row">
            <%@ include file="library_navbar.jsp"%>
        </div>


    </div>

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
</body>
</html>