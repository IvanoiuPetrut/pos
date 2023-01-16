<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<header class="d-flex justify-content-center py-3 bg-light">
    <ul class="nav nav-pills">
        <li class="nav-item"><a href="${pageContext.request.contextPath}" class="nav-link ${pageContext.request.requestURI.substring(pageContext.request.requestURI.lastIndexOf
("/")) eq '/' ? ' active' : ''}" aria-current="page">Home</a></li>
        <li class="nav-item"><a href="${pageContext.request.contextPath}/about.jsp" class="nav-link ${pageContext.request.requestURI.substring(pageContext.request.requestURI.lastIndexOf
("/")) eq '/about.jsp' ? ' active' : ''}">About</a></li>
        <li class="nav-item"><a href="${pageContext.request.contextPath}/Products" class="nav-link ${pageContext.request.requestURI.substring(pageContext.request.requestURI.lastIndexOf
("/")) eq '/Products' ? ' active' : ''}">Products</a></li>
        <li class="nav-item"><a href="${pageContext.request.contextPath}/Users" class="nav-link ${pageContext.request.requestURI.substring(pageContext.request.requestURI.lastIndexOf
("/")) eq '/Users' ? ' active' : ''}">Users</a></li>

        <c:choose>
            <c:when test="${pageContext.request.getRemoteUser() == null}">
                <a class="nav-link" href="${pageContext.request.contextPath}/Login">Login</a>
            </c:when>
            <c:otherwise>
                <a class="nav-link" href="${pageContext.request.contextPath}/Logout">Logout</a>
            </c:otherwise>
        </c:choose>
        <li class="nav-item"><a href="${pageContext.request.contextPath}/cart.jsp" class="nav-link ${pageContext.request.requestURI.substring(pageContext.request.requestURI.lastIndexOf
("/")) eq '/cart.jsp' ? ' active' : ''}">Cart</a></li>
    </ul>
</header>

<style>
    header {
        z-index: 999999;
    }
</style>