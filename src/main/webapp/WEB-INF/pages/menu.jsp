<header class="d-flex justify-content-center py-3">
    <ul class="nav nav-pills">
        <li class="nav-item"><a href="${pageContext.request.contextPath}" class="nav-link ${pageContext.request.requestURI.substring(pageContext.request.requestURI.lastIndexOf
("/")) eq '/' ? ' active' : ''}" aria-current="page">Home</a></li>
        <li class="nav-item"><a href="${pageContext.request.contextPath}/about.jsp" class="nav-link ${pageContext.request.requestURI.substring(pageContext.request.requestURI.lastIndexOf
("/")) eq '/about.jsp' ? ' active' : ''}">About</a></li>
        <li class="nav-item"><a href="#" class="nav-link">Pricing</a></li>
        <li class="nav-item"><a href="#" class="nav-link">FAQs</a></li>
        <li class="nav-item"><a href="#" class="nav-link">About</a></li>
    </ul>
</header>